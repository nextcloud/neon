// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $talkAppRoute,
    ];

RouteBase get $talkAppRoute => GoRouteData.$route(
      path: '/apps/talk',
      name: 'talk',
      factory: $TalkAppRouteExtension._fromState,
    );

extension $TalkAppRouteExtension on TalkAppRoute {
  static TalkAppRoute _fromState(GoRouterState state) => const TalkAppRoute();

  String get location => GoRouteData.$location(
        '/apps/talk',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
