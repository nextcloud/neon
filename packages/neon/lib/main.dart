import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:neon/src/neon.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: WidgetsBinding.instance);

  final sharedPreferences = await SharedPreferences.getInstance();

  final platform = await getNeonPlatform();
  final cache = Cache(platform);
  await cache.init();
  final requestManager = RequestManager(cache);
  final allAppImplementations = getAppImplementations(sharedPreferences, requestManager, platform);

  final packageInfo = await PackageInfo.fromPlatform();

  final globalOptions = GlobalOptions(
    AppStorage('global', sharedPreferences),
    packageInfo,
  );

  final accountsBloc = AccountsBloc(
    requestManager,
    platform,
    AppStorage('accounts', sharedPreferences),
    sharedPreferences,
    globalOptions,
    allAppImplementations,
  );
  final pushNotificationsBloc = PushNotificationsBloc(
    accountsBloc,
    sharedPreferences,
    globalOptions,
    platform,
  );
  final firstLaunchBloc = FirstLaunchBloc(sharedPreferences);
  final nextPushBloc = NextPushBloc(accountsBloc, globalOptions);

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
        Provider<List<AppImplementation>>(
          create: (final _) => allAppImplementations,
        ),
        Provider<PackageInfo>(
          create: (final _) => packageInfo,
        ),
      ],
      child: NeonApp(
        accountsBloc: accountsBloc,
        sharedPreferences: sharedPreferences,
        platform: platform,
        globalOptions: globalOptions,
      ),
    ),
  );
}
