part of '../../neon.dart';

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

    final keypair = await loadRSAKeypair(AppStorage('notifications', sharedPreferences));

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

        NextcloudNotificationsNotification? notification;
        var accounts = <Account>[];
        Account? account;
        try {
          accounts = loadAccounts(AppStorage('accounts', sharedPreferences));
          account = accounts.find(instance);
          if (account != null) {
            notification =
                (await account.client.notifications.getNotification(id: pushNotification.subject.nid!)).ocs.data;
          }
        } catch (e, s) {
          debugPrint(e.toString());
          debugPrint(s.toString());
        }

        final appID = notification?.app ?? pushNotification.subject.app ?? 'nextcloud';
        var appName = localizations.appImplementationName(appID);
        if (appName == '') {
          debugPrint('Missing app name for $appID');
          appName = appID;
        }
        final title = notification?.subject ?? pushNotification.subject.subject;
        final message = notification != null && notification.message != '' ? notification.message : null;
        final when = notification != null ? DateTime.parse(notification.datetime) : null;

        await localNotificationsPlugin.show(
          _getNotificationID(instance, pushNotification),
          message != null ? '$appName: $title' : appName,
          message ?? title,
          NotificationDetails(
            android: AndroidNotificationDetails(
              appID,
              appName,
              subText: accounts.length > 1 && account != null ? account.client.humanReadableID : null,
              groupKey: 'app_$appID',
              icon: '@mipmap/ic_launcher',
              when: when?.millisecondsSinceEpoch,
              color: themePrimaryColor,
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

      Global.onPushNotificationReceived?.call(instance);
    }
  }

  static int _getNotificationID(
    final String instance,
    final PushNotification notification,
  ) =>
      sha256.convert(utf8.encode('$instance${notification.subject.nid}')).bytes.reduce((final a, final b) => a + b);
}
