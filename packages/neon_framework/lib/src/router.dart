// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:account_repository/account_repository.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/src/login/login.dart';
import 'package:neon_framework/src/pages/account_settings.dart';
import 'package:neon_framework/src/pages/app_implementation_settings.dart';
import 'package:neon_framework/src/pages/home.dart';
import 'package:neon_framework/src/pages/route_not_found.dart';
import 'package:neon_framework/src/pages/settings.dart';
import 'package:neon_framework/src/utils/findable.dart';
import 'package:neon_framework/src/utils/provider.dart';

part 'router.g.dart';

/// Internal router for the Neon framework.
@internal
GoRouter buildAppRouter({
  required GlobalKey<NavigatorState> navigatorKey,
  required AccountRepository accountRepository,
}) =>
    GoRouter(
      debugLogDiagnostics: kDebugMode,
      navigatorKey: navigatorKey,
      initialLocation: const HomeRoute().location,
      errorBuilder: (context, state) => RouteNotFoundPage(
        uri: state.uri,
      ),
      redirect: redirect,
      routes: $appRoutes,
    );

/// Handles redirects of the [GoRouter] of [buildAppRouter].
@visibleForTesting
String? redirect(BuildContext context, GoRouterState state) {
  final uri = state.uri.toString();
  if (AccountRepository.isLogInQRCode(url: uri)) {
    return LoginRoute(qrCode: uri).location;
  }

  // Redirect to login screen when no account is logged in
  if (!context.read<AccountRepository>().hasAccounts) {
    return const LoginRoute().location;
  }

  return null;
}

/// {@template AppRoutes.AccountSettingsRoute}
/// Route for the [AccountSettingsPage].
/// {@endtemplate}
@immutable
class AccountSettingsRoute extends GoRouteData {
  /// {@macro AppRoutes.AccountSettingsRoute}
  const AccountSettingsRoute({
    required this.accountID,
  });

  /// The id of the account to show the settings for.
  ///
  /// Passed to [AccountSettingsPage.account].
  final String accountID;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final accountRepository = context.read<AccountRepository>();

    return AccountSettingsPage(
      account: accountRepository.accountByID(accountID)!,
    );
  }
}

/// {@template AppRoutes.HomeRoute}
/// Route for the [HomePage].
/// {@endtemplate}
@TypedGoRoute<HomeRoute>(
  path: '/',
  name: 'home',
  routes: [
    TypedGoRoute<SettingsRoute>(
      path: 'settings',
      name: 'Settings',
      routes: [
        TypedGoRoute<AppImplementationSettingsRoute>(
          path: 'apps/:appid',
          name: 'AppImplementationSettings',
        ),
        TypedGoRoute<AccountSettingsRoute>(
          path: 'account/:accountID',
          name: 'AccountSettings',
        ),
      ],
    ),
  ],
)
@immutable
class HomeRoute extends GoRouteData {
  /// {@macro AppRoutes.HomeRoute}
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return FutureBuilder(
      future: context.read<AccountRepository>().accounts.first,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox.shrink();
        }

        final account = snapshot.requireData.active;

        if (account == null) {
          throw StateError('User must be logged in to show home page.');
        }

        return HomePage(
          key: Key(account.id),
        );
      },
    );
  }
}

/// {@template AppRoutes.LoginRoute}
/// Route for the initial [LoginPage].
/// {@endtemplate}
@TypedGoRoute<LoginRoute>(
  path: '/login',
  name: 'login',
)
@immutable
class LoginRoute extends GoRouteData {
  /// {@macro AppRoutes.LoginRoute}
  const LoginRoute({
    this.serverUrl,
    this.qrCode,
  });

  /// The server url if already known.
  ///
  /// This is used when a user needs to re authenticate an existing account.
  final Uri? serverUrl;

  /// The login qr code.
  final String? qrCode;

  @override
  Widget build(BuildContext context, GoRouterState state) => LoginPage(
        serverURL: serverUrl,
        qrCode: qrCode,
      );
}

/// {@template AppRoutes.AppImplementationSettingsRoute}
/// Route for the [AppImplementationSettingsPage].
/// {@endtemplate}
@immutable
class AppImplementationSettingsRoute extends GoRouteData {
  /// {@macro AppRoutes.AppImplementationSettingsRoute}
  const AppImplementationSettingsRoute({
    required this.appid,
  });

  /// The id of the app to display the settings for.
  final String appid;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final appImplementations = NeonProvider.of<BuiltSet<AppImplementation>>(context);
    final appImplementation = appImplementations.tryFind(appid)!;

    return AppImplementationSettingsPage(appImplementation: appImplementation);
  }
}

/// {@template AppRoutes.SettingsRoute}
/// Route for the [SettingsPage].
/// {@endtemplate}
@immutable
class SettingsRoute extends GoRouteData {
  /// {@macro AppRoutes.SettingsRoute}
  const SettingsRoute({
    this.initialCategory,
  });

  /// The initial category to show.
  final SettingsCategories? initialCategory;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SettingsPage(
      initialCategory: initialCategory,
    );
  }
}
