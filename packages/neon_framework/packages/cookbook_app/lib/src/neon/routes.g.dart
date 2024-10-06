// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $cookbookAppRoute,
    ];

RouteBase get $cookbookAppRoute => GoRouteData.$route(
      path: '/apps/notifications',
      name: 'notifications',
      factory: $CookbookAppRouteExtension._fromState,
    );

extension $CookbookAppRouteExtension on CookbookAppRoute {
  static CookbookAppRoute _fromState(GoRouterState state) => const CookbookAppRoute();

  String get location => GoRouteData.$location(
        '/apps/notifications',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
