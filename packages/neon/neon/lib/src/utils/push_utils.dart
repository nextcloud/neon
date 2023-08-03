import 'dart:convert';
import 'dart:ui';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgFileLoader, vg;
import 'package:image/image.dart' as img;
import 'package:meta/meta.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/models/app_ids.dart';
import 'package:neon/src/models/push_notification.dart';
import 'package:neon/src/platform/platform.dart';
import 'package:neon/src/settings/models/storage.dart';
import 'package:neon/src/theme/colors.dart';
import 'package:neon/src/utils/global.dart';
import 'package:neon/src/utils/localizations.dart';
import 'package:neon/src/utils/request_manager.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:shared_preferences/shared_preferences.dart';

@internal
@immutable
class PushUtils {
  static Future<RSAKeypair> loadRSAKeypair(final AppStorage storage) async {
    const keyDevicePrivateKey = 'device-private-key';

    late RSAKeypair keypair;
    if (!storage.containsKey(keyDevicePrivateKey) || (storage.getString(keyDevicePrivateKey)?.isEmpty ?? true)) {
      debugPrint('Generating RSA keys for push notifications');
      // The key size has to be 2048, other sizes are not accepted by Nextcloud (at the moment at least)
      // ignore: avoid_redundant_argument_values
      keypair = RSAKeypair.fromRandom(keySize: 2048);
      await storage.setString(keyDevicePrivateKey, keypair.privateKey.toPEM());
    } else {
      keypair = RSAKeypair(RSAPrivateKey.fromPEM(storage.getString(keyDevicePrivateKey)!));
    }

    return keypair;
  }

  static Future<FlutterLocalNotificationsPlugin> initLocalNotifications({
    final DidReceiveNotificationResponseCallback? onDidReceiveNotificationResponse,
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

  static Future onMessage(final Uint8List messages, final String instance) async {
    WidgetsFlutterBinding.ensureInitialized();

    final localNotificationsPlugin = await initLocalNotifications(
      onDidReceiveNotificationResponse: (final notification) async {
        if (Global.onPushNotificationClicked != null && notification.payload != null) {
          await Global.onPushNotificationClicked!(
            PushNotification.fromJson(
              json.decode(notification.payload!) as Map<String, dynamic>,
            ),
          );
        }
      },
    );
    final sharedPreferences = await SharedPreferences.getInstance();

    final keypair = await loadRSAKeypair(AppStorage(AppIDs.notifications, sharedPreferences));

    for (final message in Uri(query: utf8.decode(messages)).queryParameters.values) {
      final data = json.decode(message) as Map<String, dynamic>;
      final pushNotification = PushNotification(
        accountID: instance,
        priority: data['priority']! as String,
        type: data['type']! as String,
        subject: decryptPushNotificationSubject(keypair.privateKey, data['subject']! as String),
      );

      if (pushNotification.subject.delete ?? false) {
        await localNotificationsPlugin.cancel(_getNotificationID(instance, pushNotification));
      } else if (pushNotification.subject.deleteAll ?? false) {
        await localNotificationsPlugin.cancelAll();
        Global.onPushNotificationReceived?.call(instance);
      } else if (pushNotification.type == 'background') {
        debugPrint('Got unknown background notification ${json.encode(pushNotification.toJson())}');
      } else {
        final localizations = await appLocalizationsFromSystem();

        final platform = await getNeonPlatform();
        final cache = Cache(platform);
        await cache.init();

        var accounts = <Account>[];
        Account? account;
        NotificationsNotification? notification;
        AndroidBitmap<Object>? largeIconBitmap;
        try {
          accounts = loadAccounts(AppStorage('accounts', sharedPreferences));
          account = accounts.tryFind(instance);
          if (account != null) {
            notification =
                (await account.client.notifications.getNotification(id: pushNotification.subject.nid!)).ocs.data;
            if (notification.icon?.endsWith('.svg') ?? false) {
              // Only SVG icons are supported right now (should be most of them)

              final cacheManager = DefaultCacheManager();
              final file = await cacheManager.getSingleFile(notification.icon!);

              final pictureInfo = await vg.loadPicture(SvgFileLoader(file), null);

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
                subText: accounts.length > 1 && account != null ? account.client.humanReadableID : null,
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

      Global.onPushNotificationReceived?.call(instance);
    }
  }

  static int _getNotificationID(
    final String instance,
    final PushNotification notification,
  ) =>
      sha256.convert(utf8.encode('$instance${notification.subject.nid}')).bytes.reduce((final a, final b) => a + b);
}
