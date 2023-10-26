// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $filesClientRoute,
    ];

RouteBase get $filesClientRoute => GoRouteData.$route(
      path: '/apps/files',
      name: 'files',
      factory: $FilesClientRouteExtension._fromState,
    );

extension $FilesClientRouteExtension on FilesClientRoute {
  static FilesClientRoute _fromState(GoRouterState state) => const FilesClientRoute();

  String get location => GoRouteData.$location(
        '/apps/files',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
