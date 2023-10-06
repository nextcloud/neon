part of '../neon_news.dart';

final articlesSortBox = SortBox<ArticlesSortProperty, news.Article>(
  {
    ArticlesSortProperty.publishDate: (final article) => article.pubDate,
    ArticlesSortProperty.alphabetical: (final article) => article.title.toLowerCase(),
    ArticlesSortProperty.byFeed: (final article) => article.feedId,
  },
  {
    ArticlesSortProperty.alphabetical: {
      (ArticlesSortProperty.publishDate, SortBoxOrder.descending),
    },
    ArticlesSortProperty.byFeed: {
      (ArticlesSortProperty.alphabetical, SortBoxOrder.ascending),
    },
  },
);
