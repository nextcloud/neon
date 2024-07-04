import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:crypto/crypto.dart';
import 'package:crypton/crypton.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgBytesLoader, vg;
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/src/bloc/result.dart';
import 'package:neon_framework/src/blocs/accounts.dart';
import 'package:neon_framework/src/models/push_notification.dart';
import 'package:neon_framework/src/storage/keys.dart';
import 'package:neon_framework/src/theme/colors.dart';
import 'package:neon_framework/src/utils/findable.dart';
import 'package:neon_framework/src/utils/image_utils.dart';
import 'package:neon_framework/src/utils/localizations.dart';
import 'package:neon_framework/src/utils/request_manager.dart';
import 'package:neon_framework/storage.dart';
import 'package:nextcloud/notifications.dart' as notifications;
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;

final _log = Logger('PushUtils');

@internal
@immutable
class PushUtils {
  const PushUtils._();

  /// Called when a new push notification was received.
  ///
  /// The callback will only be set if the current flutter engine was opened in the foreground.
  static Future<void> Function(String accountID)? onPushNotificationReceived;

  /// Called when a local notification was clicked on by the user.
  ///
  /// The callback will only be set if the current flutter engine was opened in the foreground.
  static Future<void> Function(PushNotification notification)? onLocalNotificationClicked;

  static RSAKeypair loadRSAKeypair() {
    final storage = NeonStorage().settingsStore(StorageKeys.notifications);
    const keyDevicePrivateKey = 'device-private-key';

    final RSAKeypair keypair;
    final privateKey = storage.getString(keyDevicePrivateKey);
    if (privateKey == null || privateKey.isEmpty) {
      _log.fine('Generating RSA keys for push notifications');
      // The key size has to be 2048, other sizes are not accepted by Nextcloud (at the moment at least)
      // ignore: avoid_redundant_argument_values
      keypair = RSAKeypair.fromRandom(keySize: 2048);
      unawaited(storage.setString(keyDevicePrivateKey, keypair.privateKey.toPEM()));
    } else {
      keypair = RSAKeypair(RSAPrivateKey.fromPEM(privateKey));
    }

    return keypair;
  }

  static Future<FlutterLocalNotificationsPlugin> initLocalNotifications({
    DidReceiveNotificationResponseCallback? onDidReceiveNotificationResponse,
  }) async {
    final localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await localNotificationsPlugin.initialize(
      InitializationSettings(
        android: const AndroidInitializationSettings('@mipmap/ic_launcher'),
        linux: LinuxInitializationSettings(
          defaultActionName: 'Open',
          defaultIcon: AssetsLinuxIcon('assets/logo.svg'),
        ),
      ),
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
    return localNotificationsPlugin;
  }

  static Future<void> onMessage(Uint8List messages, String instance) async {
    WidgetsFlutterBinding.ensureInitialized();

    final localNotificationsPlugin = await initLocalNotifications(
      onDidReceiveNotificationResponse: (notification) async {
        if (onLocalNotificationClicked != null && notification.payload != null) {
          await onLocalNotificationClicked!(
            PushNotification.fromJson(
              json.decode(notification.payload!) as Map<String, dynamic>,
            ),
          );
        }
      },
    );
    await NeonStorage().init();

    final keypair = loadRSAKeypair();
    for (final message in Uri(query: utf8.decode(messages)).queryParameters.values) {
      final data = json.decode(message) as Map<String, dynamic>;
      final pushNotification = PushNotification.fromEncrypted(
        data,
        instance,
        keypair.privateKey,
      );

      if (pushNotification.subject.delete ?? false) {
        await localNotificationsPlugin.cancel(_getNotificationID(instance, pushNotification));
      } else if (pushNotification.subject.deleteAll ?? false) {
        await localNotificationsPlugin.cancelAll();
        await onPushNotificationReceived?.call(instance);
      } else if (pushNotification.type == 'background') {
        _log.fine('Got unknown background notification ${json.encode(pushNotification.toJson())}');
      } else {
        final localizations = await appLocalizationsFromSystem();

        final accounts = loadAccounts();
        final account = accounts.tryFind(instance);

        notifications.Notification? notification;
        AndroidBitmap<Object>? largeIconBitmap;
        if (account != null) {
          try {
            final response =
                await account.client.notifications.endpoint.getNotification(id: pushNotification.subject.nid!);
            notification = response.body.ocs.data;
          } on http.ClientException catch (error, stackTrace) {
            _log.warning(
              'Error loading notification ${pushNotification.subject.nid}.',
              error,
              stackTrace,
            );
          }

          final icon = notification?.icon;
          // Only SVG icons are supported right now (should be most of them)
          if (icon != null && icon.endsWith('.svg')) {
            final uri = Uri.parse(icon);
            final rawImage = await _fetchIcon(account, uri);
            if (rawImage != null) {
              largeIconBitmap = await _decodeIcon(rawImage);
            }
          }
        }

        if (notification?.shouldNotify ?? true) {
          final appID = notification?.app ?? pushNotification.subject.app ?? 'nextcloud';
          String? appName = localizations.appImplementationName(appID);
          if (appName.isEmpty) {
            _log.warning('Missing app name for $appID');
            appName = null;
          }
          final title = (notification?.subject ?? pushNotification.subject.subject)!;
          final message = (notification?.message.isNotEmpty ?? false) ? notification!.message : null;
          final when = notification != null ? tz.TZDateTime.parse(tz.UTC, notification.datetime) : null;

          await localNotificationsPlugin.show(
            _getNotificationID(instance, pushNotification),
            message != null && appName != null ? '$appName: $title' : title,
            message,
            NotificationDetails(
              android: AndroidNotificationDetails(
                appID,
                appName ?? appID,
                subText: accounts.length > 1 && account != null ? account.humanReadableID : null,
                groupKey: 'app_$appID',
                icon: '@mipmap/ic_launcher',
                largeIcon: largeIconBitmap,
                when: when?.millisecondsSinceEpoch,
                color: NcColors.primary,
                category: pushNotification.type == 'voip' ? AndroidNotificationCategory.call : null,
                importance: Importance.max,
                priority: pushNotification.priority == 'high'
                    ? (pushNotification.type == 'voip' ? Priority.max : Priority.high)
                    : Priority.defaultPriority,
              ),
            ),
            payload: json.encode(pushNotification.toJson()),
          );
        }
      }

      await onPushNotificationReceived?.call(instance);
    }
  }

  static Future<Uint8List?> _fetchIcon(Account account, Uri uri) async {
    final subject = BehaviorSubject<Result<Uint8List>>();

    final headers = account.getAuthorizationHeaders(uri);
    await RequestManager.instance.wrap(
      account: account,
      cacheKey: uri.toString(),
      getCacheHeaders: () async {
        final response = await account.client.head(
          uri,
          headers: headers,
        );

        return response.headers;
      },
      getRequest: () {
        final request = http.Request('GET', uri);
        if (headers != null) {
          request.headers.addAll(headers);
        }

        return request;
      },
      converter: const BinaryResponseConverter(),
      unwrap: (data) {
        try {
          return utf8.encode(ImageUtils.rewriteSvgDimensions(utf8.decode(data)));
        } catch (_) {}
        return data;
      },
      subject: subject,
    );
    final rawImage = subject.valueOrNull?.data;
    unawaited(subject.close());

    return rawImage;
  }

  static Future<ByteArrayAndroidBitmap?> _decodeIcon(Uint8List rawImage) async {
    final pictureInfo = await vg.loadPicture(SvgBytesLoader(rawImage), null);

    const largeIconSize = 256;
    final scale = largeIconSize / pictureInfo.size.longestSide;
    final scaledSize = pictureInfo.size * scale;

    final recorder = PictureRecorder();
    Canvas(recorder)
      ..scale(scale)
      ..drawPicture(pictureInfo.picture)
      ..drawColor(NcColors.primary, BlendMode.srcIn);

    pictureInfo.picture.dispose();

    final image = recorder.endRecording().toImageSync(scaledSize.width.toInt(), scaledSize.height.toInt());
    final bytes = await image.toByteData(format: ImageByteFormat.png);

    return ByteArrayAndroidBitmap(img.encodeBmp(img.decodePng(bytes!.buffer.asUint8List())!));
  }

  static int _getNotificationID(
    String instance,
    PushNotification notification,
  ) =>
      sha256.convert(utf8.encode('$instance${notification.subject.nid}')).bytes.reduce((a, b) => a + b);
}
