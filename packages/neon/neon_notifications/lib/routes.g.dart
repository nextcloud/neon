// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $notificationsClientRoute,
    ];

RouteBase get $notificationsClientRoute => GoRouteData.$route(
      path: '/apps/notifications',
      name: 'notifications',
      factory: $NotificationsClientRouteExtension._fromState,
    );

extension $NotificationsClientRouteExtension on NotificationsClientRoute {
  static NotificationsClientRoute _fromState(GoRouterState state) => const NotificationsClientRoute();

  String get location => GoRouteData.$location(
        '/apps/notifications',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
