part of '../app.dart';

final feedsSortBox = SortBox<FeedsSortProperty, NewsFeed>(
  {
    FeedsSortProperty.alphabetical: (final feed) => feed.title!.toLowerCase(),
    FeedsSortProperty.unreadCount: (final feed) => feed.unreadCount!,
  },
  {
    FeedsSortProperty.alphabetical: Box(FeedsSortProperty.unreadCount, SortBoxOrder.descending),
    FeedsSortProperty.unreadCount: Box(FeedsSortProperty.alphabetical, SortBoxOrder.ascending),
  },
);
