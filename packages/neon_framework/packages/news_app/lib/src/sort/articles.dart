import 'package:neon_framework/sort_box.dart';
import 'package:news_app/src/options.dart';
import 'package:nextcloud/news.dart' as news;

final articlesSortBox = SortBox<ArticlesSortProperty, news.Article>(
  properties: {
    ArticlesSortProperty.publishDate: (article) => article.pubDate,
    ArticlesSortProperty.alphabetical: (article) => article.title.toLowerCase(),
    ArticlesSortProperty.byFeed: (article) => article.feedId,
  },
  boxes: const {
    ArticlesSortProperty.alphabetical: {
      (property: ArticlesSortProperty.publishDate, order: SortBoxOrder.descending),
    },
    ArticlesSortProperty.byFeed: {
      (property: ArticlesSortProperty.alphabetical, order: SortBoxOrder.ascending),
    },
  },
);
