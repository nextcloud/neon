// ignore: prefer_mixin
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neon/neon.dart';
import 'package:provider/provider.dart';

part 'router.g.dart';

class AppRouter extends GoRouter {
  AppRouter({
    required final GlobalKey<NavigatorState> navigatorKey,
    required final AccountsBloc accountsBloc,
  }) : super(
          refreshListenable: StreamListenable.behaviorSubject(accountsBloc.activeAccount),
          navigatorKey: navigatorKey,
          initialLocation: const HomeRoute().location,
          redirect: (final context, final state) {
            final account = accountsBloc.activeAccount.valueOrNull;

            if (account == null) {
              return const LoginRoute().location;
            }

            if (state.location == const LoginRoute().location) {
              return const HomeRoute().location;
            }

            return null;
          },
          routes: $appRoutes,
        );
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

@TypedGoRoute<HomeRoute>(
  path: '/',
  name: 'home',
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
