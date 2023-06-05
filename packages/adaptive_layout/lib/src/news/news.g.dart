// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $newsAppRoute,
    ];

RouteBase get $newsAppRoute => GoRouteData.$route(
      path: '/apps/news',
      name: 'newsApp',
      factory: $NewsAppRouteExtension._fromState,
    );

extension $NewsAppRouteExtension on NewsAppRoute {
  static NewsAppRoute _fromState(GoRouterState state) => NewsAppRoute(
        _$convertMapValue('article-i-d', state.queryParameters, int.parse),
      );

  String get location => GoRouteData.$location(
        '/apps/news',
        queryParams: {
          if (articleID != null) 'article-i-d': articleID!.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}
