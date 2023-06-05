part of 'news.dart';

@TypedGoRoute<NewsAppRoute>(
  path: '/apps/news',
  name: 'newsApp',
)
@immutable
class NewsAppRoute extends NeonAppRoute {
  const NewsAppRoute([this.articleID]);

  final int? articleID;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return NewsAppView(articleID: articleID);
  }
}
