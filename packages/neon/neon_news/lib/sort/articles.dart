part of '../neon_news.dart';

final articlesSortBox = SortBox<ArticlesSortProperty, NewsArticle>(
  {
    ArticlesSortProperty.publishDate: (final article) => article.pubDate,
    ArticlesSortProperty.alphabetical: (final article) => article.title.toLowerCase(),
    ArticlesSortProperty.byFeed: (final article) => article.feedId,
  },
  {
    ArticlesSortProperty.alphabetical: Box(ArticlesSortProperty.publishDate, SortBoxOrder.descending),
    ArticlesSortProperty.byFeed: Box(ArticlesSortProperty.alphabetical, SortBoxOrder.ascending),
  },
);
