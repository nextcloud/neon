import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:account_repository/account_repository.dart';
import 'package:built_collection/built_collection.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgBytesLoader, vg;
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/src/bloc/result.dart';
import 'package:neon_framework/src/storage/keys.dart';
import 'package:neon_framework/src/storage/sqlite_persistence.dart';
import 'package:neon_framework/src/theme/colors.dart';
import 'package:neon_framework/src/utils/account_client_extension.dart';
import 'package:neon_framework/src/utils/image_utils.dart';
import 'package:neon_framework/src/utils/localizations.dart';
import 'package:neon_framework/src/utils/request_manager.dart';
import 'package:neon_framework/src/utils/user_agent.dart';
import 'package:neon_framework/storage.dart';
import 'package:nextcloud/notifications.dart' as notifications;
import 'package:notifications_push_repository/notifications_push_repository.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;

/// Signature of the callback which called when a new push notification is received.
typedef OnPushNotificationReceivedCallback = Future<void> Function(String accountID);

/// Signature of the callback which called when the user clicks on a local notification.
typedef OnLocalNotificationClickedCallback = Future<void> Function(PushNotification notification);

final _log = Logger('PushUtils');

@internal
@immutable
class PushUtils {
  const PushUtils._(); // coverage:ignore-line

  /// Called when a new push notification was received.
  ///
  /// The callback will only be set if the current flutter engine was opened in the foreground.
  static OnPushNotificationReceivedCallback? onPushNotificationReceived;

  /// Called when a local notification was clicked on by the user.
  ///
  /// The callback will only be set if the current flutter engine was opened in the foreground.
  static OnLocalNotificationClickedCallback? onLocalNotificationClicked;

  static Future<FlutterLocalNotificationsPlugin> initLocalNotifications({
    required NeonLocalizations localizations,
    DidReceiveNotificationResponseCallback? onDidReceiveNotificationResponse,
  }) async {
    final localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await localNotificationsPlugin.initialize(
      InitializationSettings(
        android: const AndroidInitializationSettings('@drawable/ic_launcher_outline'),
        linux: LinuxInitializationSettings(
          defaultActionName: localizations.actionOpen,
          defaultIcon: AssetsLinuxIcon('assets/logo.svg'),
        ),
      ),
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
    return localNotificationsPlugin;
  }

  static Future<void> onMessage(
    Uint8List encryptedPushNotifications,
    String accountID, {
    @visibleForTesting http.Client? httpClient,
  }) async {
    await onPushNotificationReceived?.call(accountID);

    WidgetsFlutterBinding.ensureInitialized();

    final localizations = await appLocalizationsFromSystem();

    final localNotificationsPlugin = await initLocalNotifications(
      localizations: localizations,
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
    final storage = NotificationsPushStorage(
      devicePrivateKeyPersistence: NeonStorage().singleValueStore(StorageKeys.notificationsDevicePrivateKey),
      pushSubscriptionsPersistence: SQLiteCachedPersistence(
        prefix: 'notifications-push-subscriptions',
      ),
    );

    // These are used in the loop, but not every push notification needs them, so we only initialize them when needed.
    PackageInfo? packageInfo;
    AccountStorage? accountStorage;
    AccountRepository? accountRepository;
    BuiltList<Account>? accounts;
    Account? account;

    final pushNotifications = await parseEncryptedPushNotifications(storage, encryptedPushNotifications, accountID);
    for (final pushNotification in pushNotifications) {
      if (pushNotification.subject.delete ?? false) {
        await localNotificationsPlugin.cancel(_getNotificationID(accountID, pushNotification.subject.nid!));
      } else if (pushNotification.subject.deleteMultiple ?? false) {
        await Future.wait([
          for (final nid in pushNotification.subject.nids!)
            localNotificationsPlugin.cancel(_getNotificationID(accountID, nid)),
        ]);
      } else if (pushNotification.subject.deleteAll ?? false) {
        await localNotificationsPlugin.cancelAll();
      } else if (pushNotification.type == 'background') {
        _log.fine('Got unknown background notification ${json.encode(pushNotification.toJson())}');
      } else {
        packageInfo ??= await PackageInfo.fromPlatform();
        accountStorage ??= AccountStorage(
          accountsPersistence: NeonStorage().singleValueStore(StorageKeys.accounts),
          lastAccountPersistence: NeonStorage().singleValueStore(StorageKeys.lastUsedAccount),
        );
        if (accountRepository == null) {
          accountRepository = AccountRepository(
            userAgent: buildUserAgent(packageInfo),
            httpClient: httpClient ?? http.Client(),
            storage: accountStorage,
          );

          await accountRepository.loadAccounts();
        }
        accounts ??= (await accountRepository.accounts.first).accounts;
        account ??= accountRepository.accountByID(accountID);

        notifications.Notification? notification;
        AndroidBitmap<Object>? largeIconBitmap;
        if (account != null) {
          notification = await _fetchNotification(account, pushNotification.subject.nid!);

          final icon = notification?.icon;
          // Only SVG icons are supported right now (should be most of them)
          if (icon != null && icon.endsWith('.svg')) {
            final uri = Uri.parse(icon);
            final rawImage = await _fetchIcon(account, uri);
            if (rawImage != null) {
              largeIconBitmap = await _decodeAndroidBitmap(rawImage);
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
            _getNotificationID(accountID, pushNotification.subject.nid!),
            message != null && appName != null ? '$appName: $title' : title,
            message,
            NotificationDetails(
              android: AndroidNotificationDetails(
                appID,
                appName ?? appID,
                subText: accounts.length > 1 && account != null ? account.humanReadableID : null,
                groupKey: '${appID}_app',
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

          // Other platforms don't support grouping, so don't send another notification there.
          if (defaultTargetPlatform == TargetPlatform.android) {
            // Since we only support Android SDK 24+, we can just generate an empty summary notification as it will not be shown anyway.
            await localNotificationsPlugin.show(
              _getGroupSummaryID(accountID, appID),
              null,
              null,
              NotificationDetails(
                android: AndroidNotificationDetails(
                  appID,
                  appName ?? appID,
                  groupKey: '${appID}_app',
                  setAsGroupSummary: true,
                  styleInformation: InboxStyleInformation(
                    [],
                    summaryText: appName ?? appID,
                  ),
                  color: NcColors.primary,
                ),
              ),
            );
          }
        }
      }
    }
  }

  static Future<notifications.Notification?> _fetchNotification(Account account, int id) async {
    try {
      final response = await account.client.notifications.endpoint.getNotification(
        id: id,
      );

      return response.body.ocs.data;
    } on http.ClientException catch (error, stackTrace) {
      _log.warning(
        'Error loading notification $id.',
        error,
        stackTrace,
      );

      return null;
    }
  }

  static Future<Uint8List?> _fetchIcon(Account account, Uri uri) async {
    final subject = BehaviorSubject<Result<Uint8List>>();

    final headers = account.getAuthorizationHeaders(uri);
    await RequestManager.instance.wrap(
      account: account,
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

  static Future<ByteArrayAndroidBitmap?> _decodeAndroidBitmap(Uint8List rawImage) async {
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

  static int _getNotificationID(String accountID, int nid) {
    return sha256.convert(utf8.encode('$accountID$nid')).bytes.reduce((a, b) => a + b);
  }

  static int _getGroupSummaryID(String accountID, String app) {
    return sha256.convert(utf8.encode('$accountID$app')).bytes.reduce((a, b) => a + b);
  }
}
