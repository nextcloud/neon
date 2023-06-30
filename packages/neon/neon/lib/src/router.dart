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
            final account = accountsBloc.activeAccount.valueOrNull;

            // redirect to loginscreen when no account is logged in
            if (account == null) {
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
)
@immutable
class LoginRoute extends GoRouteData {
  const LoginRoute({this.server});

  final String? server;

  @override
  Widget build(final BuildContext context, final GoRouterState state) => LoginPage(serverURL: server);
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
