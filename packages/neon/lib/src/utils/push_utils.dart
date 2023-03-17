part of '../neon.dart';

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
          defaultIcon: AssetsLinuxIcon('assets/logo_neon.svg'),
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
      final notification = PushNotification(
        accountID: instance,
        priority: data['priority']! as String,
        type: data['type']! as String,
        subject: decryptPushNotificationSubject(keypair.privateKey, data['subject']! as String),
      );

      if (notification.subject.delete ?? false) {
        await localNotificationsPlugin.cancel(_getNotificationID(instance, notification));
      } else if (notification.subject.deleteAll ?? false) {
        await localNotificationsPlugin.cancelAll();
        Global.onPushNotificationReceived?.call(instance);
      } else if (notification.type == 'background') {
        debugPrint('Got unknown background notification ${json.encode(notification.toJson())}');
      } else {
        final localizations = await appLocalizationsFromSystem();

        final platform = await getNeonPlatform();
        final cache = Cache(platform);
        await cache.init();
        final requestManager = RequestManager(cache);
        final allAppImplementations = getAppImplementations(sharedPreferences, requestManager, platform);

        final matchingAppImplementations =
            allAppImplementations.where((final a) => a.id == notification.subject.app).toList();
        late AppImplementation app;
        if (matchingAppImplementations.isNotEmpty) {
          app = matchingAppImplementations.single;
        } else {
          app = allAppImplementations.singleWhere((final a) => a.id == 'notifications');
        }

        final appName = app.nameFromLocalization(localizations);

        await localNotificationsPlugin.show(
          _getNotificationID(instance, notification),
          appName,
          notification.subject.subject,
          NotificationDetails(
            android: AndroidNotificationDetails(
              app.id,
              appName,
              groupKey: 'app_${app.id}',
              icon: '@mipmap/app_${app.id}',
              color: themePrimaryColor,
              category: notification.type == 'voip' ? AndroidNotificationCategory.call : null,
              importance: Importance.max,
              priority: notification.priority == 'high'
                  ? (notification.type == 'voip' ? Priority.max : Priority.high)
                  : Priority.defaultPriority,
            ),
            linux: LinuxNotificationDetails(
              icon: AssetsLinuxIcon('assets/apps/${app.id}.svg'),
              urgency:
                  notification.type == 'voip' ? LinuxNotificationUrgency.critical : LinuxNotificationUrgency.normal,
            ),
          ),
          payload: json.encode(
            PushNotification(
              accountID: instance,
              priority: notification.priority,
              type: notification.type,
              subject: notification.subject,
            ).toJson(),
          ),
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
