import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:neon/src/app.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/blocs/first_launch.dart';
import 'package:neon/src/blocs/next_push.dart';
import 'package:neon/src/blocs/push_notifications.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/models/app_implementation.dart';
import 'package:neon/src/models/branding.dart';
import 'package:neon/src/platform/platform.dart';
import 'package:neon/src/utils/global_options.dart';
import 'package:neon/src/utils/request_manager.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future runNeon({
  required final Iterable<AppImplementation> Function(SharedPreferences, RequestManager, NeonPlatform)
      getAppImplementations,
  required final Branding branding,
  final WidgetsBinding? bindingOverride,
  final SharedPreferences? sharedPreferencesOverride,
  final Account? account,
  final bool firstLaunchDisabled = false,
  final bool nextPushDisabled = false,
}) async {
  final binding = bindingOverride ?? WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);

  final sharedPreferences = sharedPreferencesOverride ?? await SharedPreferences.getInstance();

  final platform = await getNeonPlatform();
  final cache = Cache(platform);
  await cache.init();
  final requestManager = RequestManager(cache);
  final allAppImplementations = getAppImplementations(sharedPreferences, requestManager, platform);

  final packageInfo = await PackageInfo.fromPlatform();

  final globalOptions = GlobalOptions(
    sharedPreferences,
    packageInfo,
  );

  final accountsBloc = AccountsBloc(
    requestManager,
    platform,
    sharedPreferences,
    globalOptions,
    allAppImplementations,
  );
  if (account != null) {
    accountsBloc
      ..addAccount(account)
      ..setActiveAccount(account);
  }
  final pushNotificationsBloc = PushNotificationsBloc(
    accountsBloc,
    sharedPreferences,
    globalOptions,
    platform,
  );
  final firstLaunchBloc = FirstLaunchBloc(
    sharedPreferences,
    disabled: firstLaunchDisabled,
  );
  final nextPushBloc = NextPushBloc(
    accountsBloc,
    globalOptions,
    disabled: nextPushDisabled,
  );

  runApp(
    MultiProvider(
      providers: [
        Provider<SharedPreferences>(
          create: (final _) => sharedPreferences,
        ),
        Provider<NeonPlatform>(
          create: (final _) => platform,
        ),
        Provider<GlobalOptions>(
          create: (final _) => globalOptions,
        ),
        Provider<RequestManager>(
          create: (final _) => requestManager,
        ),
        Provider<AccountsBloc>(
          create: (final _) => accountsBloc,
        ),
        Provider<PushNotificationsBloc>(
          create: (final _) => pushNotificationsBloc,
        ),
        Provider<FirstLaunchBloc>(
          create: (final _) => firstLaunchBloc,
        ),
        Provider<NextPushBloc>(
          create: (final _) => nextPushBloc,
        ),
        Provider<Iterable<AppImplementation>>(
          create: (final _) => allAppImplementations,
        ),
        Provider<PackageInfo>(
          create: (final _) => packageInfo,
        ),
        Provider<Branding>(
          create: (final _) => branding,
        ),
      ],
      child: const NeonApp(),
    ),
  );
}
