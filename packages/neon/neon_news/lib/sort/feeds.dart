part of '../neon_news.dart';

final feedsSortBox = SortBox<FeedsSortProperty, news.Feed>(
  {
    FeedsSortProperty.alphabetical: (final feed) => feed.title.toLowerCase(),
    FeedsSortProperty.unreadCount: (final feed) => feed.unreadCount ?? 0,
  },
  {
    FeedsSortProperty.alphabetical: {
      (property: FeedsSortProperty.unreadCount, order: SortBoxOrder.descending),
    },
    FeedsSortProperty.unreadCount: {
      (property: FeedsSortProperty.alphabetical, order: SortBoxOrder.ascending),
    },
  },
);
