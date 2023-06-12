// ignore: prefer_mixin
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:neon/neon.dart';
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
    final account = bloc.accounts.value.find(accountid)!;

    return AccountSettingsPage(
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
    final appImplementations = Provider.of<List<AppImplementation>>(context, listen: false);
    final appImplementation = appImplementations.find(appid)!;

    return NextcloudAppSettingsPage(appImplementation: appImplementation);
  }
}

@immutable
class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  @override
  Widget build(final BuildContext context, final GoRouterState state) => const SettingsPage();
}
