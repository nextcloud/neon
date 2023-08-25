part of '../neon_news.dart';

final foldersSortBox = SortBox<FoldersSortProperty, FolderFeedsWrapper>(
  {
    FoldersSortProperty.alphabetical: (final folderFeedsWrapper) => folderFeedsWrapper.$1.name.toLowerCase(),
    FoldersSortProperty.unreadCount: (final folderFeedsWrapper) => folderFeedsWrapper.$3,
  },
  {
    FoldersSortProperty.alphabetical: {
      (FoldersSortProperty.unreadCount, SortBoxOrder.descending),
    },
    FoldersSortProperty.unreadCount: {
      (FoldersSortProperty.alphabetical, SortBoxOrder.ascending),
    },
  },
);

typedef FolderFeedsWrapper = (NewsFolder folder, int feedCount, int unreadCount);
