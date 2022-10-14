part of '../neon.dart';

class PushUtils {
  static Future<RSAKeypair> loadRSAKeypair(final Storage storage) async {
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
          defaultIcon: AssetsLinuxIcon('assets/logo_harbour.svg'),
        ),
      ),
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
    return localNotificationsPlugin;
  }

  static Future onMessage(final Uint8List message, final String instance) async {
    WidgetsFlutterBinding.ensureInitialized();

    final localNotificationsPlugin = await initLocalNotifications(
      onDidReceiveNotificationResponse: (final notification) async {
        if (Global.onPushNotificationClicked != null) {
          await Global.onPushNotificationClicked!(notification.payload);
        }
      },
    );
    final sharedPreferences = await SharedPreferences.getInstance();

    final keypair = await loadRSAKeypair(Storage('notifications', sharedPreferences));
    final data = json.decode(utf8.decode(message)) as Map<String, dynamic>;
    final notification = NotificationsPushNotification(
      accountID: instance,
      priority: data['priority']! as String,
      type: data['type']! as String,
      subject: decryptPushNotificationSubject(keypair.privateKey, data['subject']! as String),
    );

    if (notification.subject.delete ?? false) {
      await localNotificationsPlugin.cancel(_getNotificationID(instance, notification));
      return;
    }
    if (notification.subject.deleteAll ?? false) {
      await localNotificationsPlugin.cancelAll();
      return;
    }
    if (notification.type == 'background') {
      debugPrint('Got unknown background notification $notification.subject');
      return;
    }

    final parts =
        (await findSystemLocale()).split('_').map((final a) => a.split('.')).reduce((final a, final b) => [...a, ...b]);
    final localizations = await AppLocalizations.delegate.load(Locale(parts[0], parts.length > 1 ? parts[1] : null));

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
          urgency: notification.type == 'voip' ? LinuxNotificationUrgency.critical : LinuxNotificationUrgency.normal,
        ),
      ),
      payload: json.encode(notification.toJson()),
    );

    Global.onPushNotificationReceived?.call();
  }

  static int _getNotificationID(
    final String instance,
    final NotificationsPushNotification notification,
  ) =>
      sha256.convert(utf8.encode('$instance${notification.subject.nid}')).bytes.reduce((final a, final b) => a + b);
}
