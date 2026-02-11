// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $photosAppRoute,
    ];

RouteBase get $photosAppRoute => GoRouteData.$route(
      path: '/apps/photos',
      name: 'photos',
      factory: _$PhotosAppRoute._fromState,
    );

mixin _$PhotosAppRoute on GoRouteData {
  static PhotosAppRoute _fromState(GoRouterState state) => const PhotosAppRoute();

  @override
  String get location => GoRouteData.$location(
        '/apps/photos',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
