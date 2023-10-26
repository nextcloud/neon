// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $dashboardClientRoute,
    ];

RouteBase get $dashboardClientRoute => GoRouteData.$route(
      path: '/apps/dashboard',
      name: 'dashboard',
      factory: $DashboardClientRouteExtension._fromState,
    );

extension $DashboardClientRouteExtension on DashboardClientRoute {
  static DashboardClientRoute _fromState(GoRouterState state) => const DashboardClientRoute();

  String get location => GoRouteData.$location(
        '/apps/dashboard',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
