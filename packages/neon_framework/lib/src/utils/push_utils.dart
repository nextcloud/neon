import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:crypto/crypto.dart';
import 'package:crypton/crypton.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgBytesLoader, vg;
import 'package:image/image.dart' as img;
import 'package:meta/meta.dart';
import 'package:neon_framework/src/bloc/result.dart';
import 'package:neon_framework/src/blocs/accounts.dart';
import 'package:neon_framework/src/models/account.dart';
import 'package:neon_framework/src/models/push_notification.dart';
import 'package:neon_framework/src/settings/models/storage.dart';
import 'package:neon_framework/src/theme/colors.dart';
import 'package:neon_framework/src/utils/findable.dart';
import 'package:neon_framework/src/utils/image_utils.dart';
import 'package:neon_framework/src/utils/localizations.dart';
import 'package:neon_framework/src/utils/request_manager.dart';
import 'package:neon_framework/storage.dart';
import 'package:nextcloud/notifications.dart' as notifications;
import 'package:rxdart/rxdart.dart';

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
    final storage = NeonStorage().settingsStorage(StorageKeys.notifications);
    const keyDevicePrivateKey = 'device-private-key';

    final RSAKeypair keypair;
    final privateKey = storage.getString(keyDevicePrivateKey);
    if (privateKey == null || privateKey.isEmpty) {
      debugPrint('Generating RSA keys for push notifications');
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
        debugPrint('Got unknown background notification ${json.encode(pushNotification.toJson())}');
      } else {
        final localizations = await appLocalizationsFromSystem();

        final accounts = loadAccounts();
        Account? account;
        notifications.Notification? notification;
        AndroidBitmap<Object>? largeIconBitmap;
        try {
          account = accounts.tryFind(instance);
          if (account != null) {
            final response =
                await account.client.notifications.endpoint.getNotification(id: pushNotification.subject.nid!);
            notification = response.body.ocs.data;
            if (notification.icon?.endsWith('.svg') ?? false) {
              // Only SVG icons are supported right now (should be most of them)

              final uri = Uri.parse(notification.icon!);
              final subject = BehaviorSubject<Result<Uint8List>>();
              await RequestManager.instance.wrapUri(
                account: account,
                uri: uri,
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

              if (rawImage != null) {
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

                largeIconBitmap = ByteArrayAndroidBitmap(img.encodeBmp(img.decodePng(bytes!.buffer.asUint8List())!));
              }
            }
          }
        } catch (e, s) {
          debugPrint(e.toString());
          debugPrint(s.toString());
        }

        if (notification?.shouldNotify ?? true) {
          final appID = notification?.app ?? pushNotification.subject.app ?? 'nextcloud';
          String? appName = localizations.appImplementationName(appID);
          if (appName.isEmpty) {
            debugPrint('Missing app name for $appID');
            appName = null;
          }
          final title = (notification?.subject ?? pushNotification.subject.subject)!;
          final message = (notification?.message.isNotEmpty ?? false) ? notification!.message : null;
          final when = notification != null ? DateTime.parse(notification.datetime) : null;

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

  static int _getNotificationID(
    String instance,
    PushNotification notification,
  ) =>
      sha256.convert(utf8.encode('$instance${notification.subject.nid}')).bytes.reduce((a, b) => a + b);
}
