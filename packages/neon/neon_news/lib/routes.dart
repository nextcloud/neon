import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:neon/nextcloud.dart';
import 'package:neon/utils.dart';
import 'package:neon_news/neon_news.dart';

part 'routes.g.dart';

@TypedGoRoute<NewsAppRoute>(
  path: '$appsRoutePrefix${AppIDs.news}',
  name: AppIDs.news,
)
@immutable
class NewsAppRoute extends NeonAppRoute {
  const NewsAppRoute();

  @override
  Widget build(final BuildContext context, final GoRouterState state) => const NewsMainPage();
}
