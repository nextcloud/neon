// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/models/app_implementation.dart';
import 'package:neon/src/pages/account_settings.dart';
import 'package:neon/src/pages/home.dart';
import 'package:neon/src/pages/login.dart';
import 'package:neon/src/pages/login_check_account.dart';
import 'package:neon/src/pages/login_check_server_status.dart';
import 'package:neon/src/pages/login_flow.dart';
import 'package:neon/src/pages/login_qrcode.dart';
import 'package:neon/src/pages/nextcloud_app_settings.dart';
import 'package:neon/src/pages/settings.dart';
import 'package:neon/src/utils/stream_listenable.dart';
import 'package:provider/provider.dart';

part 'router.g.dart';

@internal
class AppRouter extends GoRouter {
  AppRouter({
    required final GlobalKey<NavigatorState> navigatorKey,
    required final AccountsBloc accountsBloc,
  }) : super(
          debugLogDiagnostics: kDebugMode,
          refreshListenable: StreamListenable(accountsBloc.activeAccount),
          navigatorKey: navigatorKey,
          initialLocation: const HomeRoute().location,
          redirect: (final context, final state) {
            final loginQrcode = LoginQrcode.tryParse(state.uri.toString());
            if (loginQrcode != null) {
              return LoginCheckServerStatusRoute.withCredentials(
                serverUrl: loginQrcode.serverURL,
                loginName: loginQrcode.username,
                password: loginQrcode.password,
              ).location;
            }

            // redirect to loginscreen when no account is logged in
            if (!accountsBloc.hasAccounts && !state.uri.toString().startsWith(const LoginRoute().location)) {
              return const LoginRoute().location;
            }

            return null;
          },
          routes: $appRoutes,
        );
}

@immutable
class AccountSettingsRoute extends GoRouteData {
  const AccountSettingsRoute({
    required this.accountid,
  });

  final String accountid;

  @override
  Widget build(final BuildContext context, final GoRouterState state) {
    final bloc = Provider.of<AccountsBloc>(context, listen: false);
    final account = bloc.accounts.value.find(accountid);

    return AccountSettingsPage(
      bloc: bloc,
      account: account,
    );
  }
}

@TypedGoRoute<HomeRoute>(
  path: '/',
  name: 'home',
  routes: [
    TypedGoRoute<SettingsRoute>(
      path: 'settings',
      name: 'Settings',
      routes: [
        TypedGoRoute<NextcloudAppSettingsRoute>(
          path: 'apps/:appid',
          name: 'NextcloudAppSettings',
        ),
        TypedGoRoute<_AddAccountRoute>(
          path: 'account/add',
          name: 'addAccount',
          routes: [
            TypedGoRoute<_AddAccountFlowRoute>(
              path: 'flow',
            ),
            TypedGoRoute<_AddAccountQrcodeRoute>(
              path: 'qrcode',
            ),
            TypedGoRoute<_AddAccountCheckServerStatusRoute>(
              path: 'check/server',
            ),
            TypedGoRoute<_AddAccountCheckAccountRoute>(
              path: 'check/account',
            ),
          ],
        ),
        TypedGoRoute<AccountSettingsRoute>(
          path: 'account/:accountid',
          name: 'AccountSettings',
        ),
      ],
    )
  ],
)
@immutable
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(final BuildContext context, final GoRouterState state) {
    final accountsBloc = Provider.of<AccountsBloc>(context, listen: false);
    final account = accountsBloc.activeAccount.valueOrNull!;

    return HomePage(key: Key(account.id));
  }
}

@TypedGoRoute<LoginRoute>(
  path: '/login',
  name: 'login',
  routes: [
    TypedGoRoute<LoginFlowRoute>(
      path: 'flow',
    ),
    TypedGoRoute<LoginQrcodeRoute>(
      path: 'qrcode',
    ),
    TypedGoRoute<LoginCheckServerStatusRoute>(
      path: 'check/server',
    ),
    TypedGoRoute<LoginCheckAccountRoute>(
      path: 'check/account',
    ),
  ],
)
@immutable
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(final BuildContext context, final GoRouterState state) => const LoginPage();

  @override
  FutureOr<String?> redirect(final BuildContext context, final GoRouterState state) {
    final hasAccounts = Provider.of<AccountsBloc>(context, listen: false).hasAccounts;

    if (state.fullPath == location && hasAccounts) {
      return const _AddAccountRoute().location;
    }

    return null;
  }
}

@immutable
class LoginFlowRoute extends GoRouteData {
  const LoginFlowRoute({
    required this.serverUrl,
  });

  final String serverUrl;

  @override
  Widget build(final BuildContext context, final GoRouterState state) => LoginFlowPage(serverURL: serverUrl);

  @override
  FutureOr<String?> redirect(final BuildContext context, final GoRouterState state) {
    final hasAccounts = Provider.of<AccountsBloc>(context, listen: false).hasAccounts;

    if (state.fullPath == location && hasAccounts) {
      return _AddAccountFlowRoute(serverUrl: serverUrl).location;
    }

    return null;
  }
}

@immutable
class LoginQrcodeRoute extends GoRouteData {
  const LoginQrcodeRoute();

  @override
  Widget build(final BuildContext context, final GoRouterState state) => const LoginQrcodePage();

  @override
  FutureOr<String?> redirect(final BuildContext context, final GoRouterState state) {
    final hasAccounts = Provider.of<AccountsBloc>(context, listen: false).hasAccounts;

    if (state.fullPath == location && hasAccounts) {
      return const _AddAccountQrcodeRoute().location;
    }

    return null;
  }
}

@immutable
class LoginCheckServerStatusRoute extends GoRouteData {
  const LoginCheckServerStatusRoute({
    required this.serverUrl,
    this.loginName,
    this.password,
  });

  const LoginCheckServerStatusRoute.withCredentials({
    required this.serverUrl,
    required String this.loginName,
    required String this.password,
  }) : assert(!kIsWeb, 'Might leak the password to the browser history');

  final String serverUrl;
  final String? loginName;
  final String? password;

  @override
  Widget build(final BuildContext context, final GoRouterState state) {
    if (loginName != null && password != null) {
      return LoginCheckServerStatusPage.withCredentials(
        serverURL: serverUrl,
        loginName: loginName!,
        password: password!,
      );
    }

    return LoginCheckServerStatusPage(
      serverURL: serverUrl,
    );
  }

  @override
  FutureOr<String?> redirect(final BuildContext context, final GoRouterState state) {
    final hasAccounts = Provider.of<AccountsBloc>(context, listen: false).hasAccounts;

    if (state.fullPath == location && hasAccounts) {
      if (loginName != null && password != null) {
        return _AddAccountCheckServerStatusRoute.withCredentials(
          serverUrl: serverUrl,
          loginName: loginName!,
          password: password!,
        ).location;
      }

      return _AddAccountCheckServerStatusRoute(
        serverUrl: serverUrl,
      ).location;
    }

    return null;
  }
}

@immutable
class LoginCheckAccountRoute extends GoRouteData {
  const LoginCheckAccountRoute({
    required this.serverUrl,
    required this.loginName,
    required this.password,
  }) : assert(!kIsWeb, 'Might leak the password to the browser history');

  final String serverUrl;
  final String loginName;
  final String password;

  @override
  Widget build(final BuildContext context, final GoRouterState state) => LoginCheckAccountPage(
        serverURL: serverUrl,
        loginName: loginName,
        password: password,
      );

  @override
  FutureOr<String?> redirect(final BuildContext context, final GoRouterState state) {
    final hasAccounts = Provider.of<AccountsBloc>(context, listen: false).hasAccounts;

    if (state.fullPath == location && hasAccounts) {
      return _AddAccountCheckAccountRoute(
        serverUrl: serverUrl,
        loginName: loginName,
        password: password,
      ).location;
    }

    return null;
  }
}

@immutable
class _AddAccountRoute extends LoginRoute {
  const _AddAccountRoute();
}

@immutable
class _AddAccountFlowRoute extends LoginFlowRoute {
  const _AddAccountFlowRoute({
    required super.serverUrl,
  });

  @override
  String get serverUrl => super.serverUrl;
}

@immutable
class _AddAccountQrcodeRoute extends LoginQrcodeRoute {
  const _AddAccountQrcodeRoute();
}

@immutable
class _AddAccountCheckServerStatusRoute extends LoginCheckServerStatusRoute {
  const _AddAccountCheckServerStatusRoute({
    required super.serverUrl,
  });

  const _AddAccountCheckServerStatusRoute.withCredentials({
    required super.serverUrl,
    required super.loginName,
    required super.password,
  }) : super.withCredentials();

  @override
  String get serverUrl => super.serverUrl;
  @override
  String? get loginName => super.loginName;
  @override
  String? get password => super.password;
}

@immutable
class _AddAccountCheckAccountRoute extends LoginCheckAccountRoute {
  const _AddAccountCheckAccountRoute({
    required super.serverUrl,
    required super.loginName,
    required super.password,
  });

  @override
  String get serverUrl => super.serverUrl;
  @override
  String get loginName => super.loginName;
  @override
  String get password => super.password;
}

@immutable
class NextcloudAppSettingsRoute extends GoRouteData {
  const NextcloudAppSettingsRoute({
    required this.appid,
  });

  final String appid;

  @override
  Widget build(final BuildContext context, final GoRouterState state) {
    final appImplementations = Provider.of<Iterable<AppImplementation>>(context, listen: false);
    final appImplementation = appImplementations.tryFind(appid)!;

    return NextcloudAppSettingsPage(appImplementation: appImplementation);
  }
}

@immutable
class SettingsRoute extends GoRouteData {
  const SettingsRoute({this.initialCategory});

  /// The initial category to show.
  final SettingsCageories? initialCategory;

  @override
  Widget build(final BuildContext context, final GoRouterState state) => SettingsPage(initialCategory: initialCategory);
}
