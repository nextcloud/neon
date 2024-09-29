import 'dart:async';

import 'package:account_repository/account_repository.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/src/app.dart';
import 'package:neon_framework/src/blocs/accounts.dart';
import 'package:neon_framework/src/blocs/first_launch.dart';
import 'package:neon_framework/src/blocs/next_push.dart';
import 'package:neon_framework/src/blocs/push_notifications.dart';
import 'package:neon_framework/src/models/disposable.dart';
import 'package:neon_framework/src/platform/platform.dart';
import 'package:neon_framework/src/storage/keys.dart';
import 'package:neon_framework/src/storage/sqlite_persistence.dart';
import 'package:neon_framework/src/theme/neon.dart';
import 'package:neon_framework/src/utils/global_options.dart';
import 'package:neon_framework/src/utils/provider.dart';
import 'package:neon_framework/src/utils/push_utils.dart';
import 'package:neon_framework/src/utils/timezone.dart';
import 'package:neon_framework/src/utils/user_agent.dart';
import 'package:neon_framework/storage.dart';
import 'package:notifications_push_repository/notifications_push_repository.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

/// Runs Neon with the given [appImplementations].
///
/// Optionally provide a [theme] to set the default style.
Future<void> runNeon({
  required BuiltSet<AppImplementation> appImplementations,
  required NeonTheme theme,
  http.Client? httpClient,
}) async {
  assert(appImplementations.isNotEmpty, 'At least one AppImplementation required');

  if (kDebugMode) {
    Logger.root.level = Level.ALL;
  }

  final binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);

  await NeonPlatform.instance.init();
  tzdata.initializeTimeZones();

  final location = guessDeviceLocation();
  if (location != null) {
    tz.setLocalLocation(location);
  }

  await NeonStorage().init();

  final packageInfo = await PackageInfo.fromPlatform();

  final accountStorage = AccountStorage(
    accountsPersistence: NeonStorage().singleValueStore(StorageKeys.accounts),
    lastAccountPersistence: NeonStorage().singleValueStore(StorageKeys.lastUsedAccount),
  );

  final accountRepository = AccountRepository(
    userAgent: buildUserAgent(packageInfo, theme.branding.name),
    httpClient: httpClient ?? http.Client(),
    storage: accountStorage,
  );

  NotificationsPushRepository? notificationsPushRepository;
  var distributors = BuiltList<String>();
  if (NeonPlatform.instance.canUsePushNotifications) {
    final notificationsPushStorage = NotificationsPushStorage(
      devicePrivateKeyPersistence: NeonStorage().singleValueStore(StorageKeys.notificationsDevicePrivateKey),
      pushSubscriptionsPersistence: SQLiteCachedPersistence(
        prefix: 'notifications-push-subscriptions',
      ),
    );

    notificationsPushRepository = NotificationsPushRepository(
      accountRepository: accountRepository,
      storage: notificationsPushStorage,
      onMessage: PushUtils.onMessage,
    );

    distributors = await notificationsPushRepository.distributors;
  }

  final globalOptions = GlobalOptions(
    packageInfo,
    distributors,
  );

  await accountRepository.loadAccounts(
    initialAccount: globalOptions.initialAccount.value,
    rememberLastUsedAccount: globalOptions.rememberLastUsedAccount.value,
  );

  if (notificationsPushRepository != null) {
    await notificationsPushRepository.initialize();

    PushNotificationsBloc(
      globalOptions: globalOptions,
      notificationsPushRepository: notificationsPushRepository,
    );
  }

  final accountsBloc = AccountsBloc(
    allAppImplementations: appImplementations,
    accountRepository: accountRepository,
  );

  final firstLaunchBloc = FirstLaunchBloc();
  final nextPushBloc = NextPushBloc(
    accountsSubject: accountsBloc.accounts,
    globalOptions: globalOptions,
  );

  runApp(
    MultiProvider(
      providers: [
        RepositoryProvider.value(value: accountRepository),
        NeonProvider<GlobalOptions>.value(value: globalOptions),
        NeonProvider<AccountsBloc>.value(value: accountsBloc),
        NeonProvider<FirstLaunchBloc>.value(value: firstLaunchBloc),
        NeonProvider<NextPushBloc>.value(value: nextPushBloc),
        Provider<BuiltSet<AppImplementation>>(
          create: (_) => appImplementations,
          dispose: (_, appImplementations) => appImplementations.disposeAll(),
        ),
        for (final appImplementation in appImplementations) appImplementation.optionsProvider,
        Provider<PackageInfo>.value(value: packageInfo),
      ],
      child: NeonApp(neonTheme: theme),
    ),
  );
}
