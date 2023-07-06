// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
      $loginRoute,
      $settingsRoute,
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      name: 'home',
      factory: $HomeRouteExtension._fromState,
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);
}

RouteBase get $loginRoute => GoRouteData.$route(
      path: '/login',
      name: 'login',
      factory: $LoginRouteExtension._fromState,
    );

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => LoginRoute(
        server: state.queryParameters['server'],
      );

  String get location => GoRouteData.$location(
        '/login',
        queryParams: {
          if (server != null) 'server': server,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);
}

RouteBase get $settingsRoute => GoRouteData.$route(
      path: '/settings',
      name: 'Settings',
      factory: $SettingsRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'apps/:appid',
          name: 'NextcloudAppSettings',
          factory: $NextcloudAppSettingsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'account/add',
          name: 'addAccount',
          factory: $AddAccountRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'account/:accountid',
          name: 'AccountSettings',
          factory: $AccountSettingsRouteExtension._fromState,
        ),
      ],
    );

extension $SettingsRouteExtension on SettingsRoute {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  String get location => GoRouteData.$location(
        '/settings',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);
}

extension $NextcloudAppSettingsRouteExtension on NextcloudAppSettingsRoute {
  static NextcloudAppSettingsRoute _fromState(GoRouterState state) => NextcloudAppSettingsRoute(
        appid: state.pathParameters['appid']!,
      );

  String get location => GoRouteData.$location(
        '/settings/apps/${Uri.encodeComponent(appid)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);
}

extension $AddAccountRouteExtension on AddAccountRoute {
  static AddAccountRoute _fromState(GoRouterState state) => const AddAccountRoute();

  String get location => GoRouteData.$location(
        '/settings/account/add',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);
}

extension $AccountSettingsRouteExtension on AccountSettingsRoute {
  static AccountSettingsRoute _fromState(GoRouterState state) => AccountSettingsRoute(
        accountid: state.pathParameters['accountid']!,
      );

  String get location => GoRouteData.$location(
        '/settings/account/${Uri.encodeComponent(accountid)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);
}
