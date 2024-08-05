import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_news/src/pages/main.dart';
import 'package:nextcloud/news.dart' as news;

part 'routes.g.dart';

@TypedGoRoute<NewsAppRoute>(
  path: '$appsBaseRoutePrefix${news.appID}',
  name: news.appID,
)
@immutable
class NewsAppRoute extends NeonBaseAppRoute {
  const NewsAppRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const NewsMainPage();
}
