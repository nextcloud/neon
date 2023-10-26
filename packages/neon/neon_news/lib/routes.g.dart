// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $newsClientRoute,
    ];

RouteBase get $newsClientRoute => GoRouteData.$route(
      path: '/apps/news',
      name: 'news',
      factory: $NewsClientRouteExtension._fromState,
    );

extension $NewsClientRouteExtension on NewsClientRoute {
  static NewsClientRoute _fromState(GoRouterState state) => const NewsClientRoute();

  String get location => GoRouteData.$location(
        '/apps/news',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
