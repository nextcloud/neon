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
import 'package:neon/src/platform/platform.dart';
import 'package:neon/src/settings/models/storage.dart';
import 'package:neon/src/theme/neon.dart';
import 'package:neon/src/utils/global_options.dart';
import 'package:neon/src/utils/request_manager.dart';
import 'package:neon/src/utils/user_agent.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

Future runNeon({
  required final Iterable<AppImplementation> appImplementations,
  required final NeonTheme theme,
  @visibleForTesting final WidgetsBinding? bindingOverride,
  @visibleForTesting final Account? account,
  @visibleForTesting final bool firstLaunchDisabled = false,
  @visibleForTesting final bool nextPushDisabled = false,
}) async {
  final binding = bindingOverride ?? WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);

  await NeonPlatform.setup();
  await RequestManager.instance.initCache();
  await AppStorage.init();

  final packageInfo = await PackageInfo.fromPlatform();
  buildUserAgent(packageInfo);

  final globalOptions = GlobalOptions(
    packageInfo,
  );

  final accountsBloc = AccountsBloc(
    globalOptions,
    appImplementations,
  );
  if (account != null) {
    accountsBloc
      ..addAccount(account)
      ..setActiveAccount(account);
  }
  final pushNotificationsBloc = PushNotificationsBloc(
    accountsBloc,
    globalOptions,
  );
  final firstLaunchBloc = FirstLaunchBloc(
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
        Provider<GlobalOptions>(
          create: (final _) => globalOptions,
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
          create: (final _) => appImplementations,
        ),
        Provider<PackageInfo>(
          create: (final _) => packageInfo,
        ),
      ],
      child: NeonApp(neonTheme: theme),
    ),
  );
}
