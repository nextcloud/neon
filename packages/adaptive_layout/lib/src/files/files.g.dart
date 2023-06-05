// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'files.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $filesAppRoute,
    ];

RouteBase get $filesAppRoute => GoRouteData.$route(
      path: '/apps/files',
      name: 'filesApp',
      factory: $FilesAppRouteExtension._fromState,
    );

extension $FilesAppRouteExtension on FilesAppRoute {
  static FilesAppRoute _fromState(GoRouterState state) => const FilesAppRoute();

  String get location => GoRouteData.$location(
        '/apps/files',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}
