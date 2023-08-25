part of '../neon_news.dart';

final feedsSortBox = SortBox<FeedsSortProperty, NewsFeed>(
  {
    FeedsSortProperty.alphabetical: (final feed) => feed.title.toLowerCase(),
    FeedsSortProperty.unreadCount: (final feed) => feed.unreadCount ?? 0,
  },
  {
    FeedsSortProperty.alphabetical: {
      (FeedsSortProperty.unreadCount, SortBoxOrder.descending),
    },
    FeedsSortProperty.unreadCount: {
      (FeedsSortProperty.alphabetical, SortBoxOrder.ascending),
    },
  },
);
