import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
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
import 'package:neon/src/utils/login_qrcode.dart';
import 'package:neon/src/utils/stream_listenable.dart';
import 'package:provider/provider.dart';

part 'router.g.dart';

class AppRouter extends GoRouter {
  AppRouter({
    required final GlobalKey<NavigatorState> navigatorKey,
    required final AccountsBloc accountsBloc,
  }) : super(
          debugLogDiagnostics: kDebugMode,
          refreshListenable: StreamListenable.behaviorSubject(accountsBloc.activeAccount),
          navigatorKey: navigatorKey,
          initialLocation: const HomeRoute().location,
          redirect: (final context, final state) {
            final account = accountsBloc.activeAccount.valueOrNull;

            final loginQrcode = LoginQrcode.tryParse(state.location);
            if (loginQrcode != null) {
              return LoginQrcodeIntermediateRoute(
                serverURL: loginQrcode.server,
                loginName: loginQrcode.user,
                password: loginQrcode.password,
              ).location;
            }

            // redirect to loginscreen when no account is logged in
            if (account == null && !state.location.startsWith(const LoginRoute().location)) {
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
        TypedGoRoute<AddAccountRoute>(
          path: 'account/add',
          name: 'addAccount',
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
      path: 'flow/:serverURL',
      name: 'loginFlow',
    ),
    TypedGoRoute<LoginQrcodeRoute>(
      path: 'qrcode',
      name: 'loginQrcode',
    ),
    TypedGoRoute<LoginQrcodeIntermediateRoute>(
      path: 'qrcode/intermediate/:serverURL/:loginName/:password',
      name: 'loginQrcodeIntermediate',
    ),
    TypedGoRoute<LoginCheckServerStatusRoute>(
      path: 'check/server/:serverURL',
      name: 'checkServerStatus',
    ),
    TypedGoRoute<LoginCheckAccountRoute>(
      path: 'check/account/:serverURL/:loginName/:password',
      name: 'checkAccount',
    ),
  ],
)
@immutable
class LoginRoute extends GoRouteData {
  const LoginRoute({this.serverURL});

  final String? serverURL;

  @override
  Widget build(final BuildContext context, final GoRouterState state) => LoginPage(serverURL: serverURL);
}

@immutable
class LoginFlowRoute extends GoRouteData {
  const LoginFlowRoute({
    required this.serverURL,
  });

  final String serverURL;

  @override
  Widget build(final BuildContext context, final GoRouterState state) => LoginFlowPage(serverURL: serverURL);
}

@immutable
class LoginQrcodeRoute extends GoRouteData {
  const LoginQrcodeRoute();

  @override
  Widget build(final BuildContext context, final GoRouterState state) => const LoginQrcodePage();
}

@immutable
class LoginQrcodeIntermediateRoute extends GoRouteData {
  const LoginQrcodeIntermediateRoute({
    required this.serverURL,
    required this.loginName,
    required this.password,
  });

  final String serverURL;
  final String loginName;
  final String password;

  @override
  Widget build(final BuildContext context, final GoRouterState state) => LoginQrcodeIntermediatePage(
        serverURL: serverURL,
        loginName: loginName,
        password: password,
      );
}

@immutable
class LoginCheckServerStatusRoute extends GoRouteData {
  const LoginCheckServerStatusRoute({
    required this.serverURL,
  });

  final String serverURL;

  @override
  Widget build(final BuildContext context, final GoRouterState state) => LoginCheckServerStatusPage(
        serverURL: serverURL,
      );
}

@immutable
class LoginCheckAccountRoute extends GoRouteData {
  const LoginCheckAccountRoute({
    required this.serverURL,
    required this.loginName,
    required this.password,
  });

  final String serverURL;
  final String loginName;
  final String password;

  @override
  Widget build(final BuildContext context, final GoRouterState state) => LoginCheckAccountPage(
        serverURL: serverURL,
        loginName: loginName,
        password: password,
      );
}

@immutable
class AddAccountRoute extends GoRouteData {
  const AddAccountRoute();

  @override
  Widget build(final BuildContext context, final GoRouterState state) => const LoginPage();
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
  const SettingsRoute();

  @override
  Widget build(final BuildContext context, final GoRouterState state) => const SettingsPage();
}
