part of '../neon_news.dart';

final foldersSortBox = SortBox<FoldersSortProperty, FolderFeedsWrapper>(
  {
    FoldersSortProperty.alphabetical: (final folderFeedsWrapper) => folderFeedsWrapper.folder.name.toLowerCase(),
    FoldersSortProperty.unreadCount: (final folderFeedsWrapper) => folderFeedsWrapper.unreadCount,
  },
  {
    FoldersSortProperty.alphabetical: {
      (property: FoldersSortProperty.unreadCount, order: SortBoxOrder.descending),
    },
    FoldersSortProperty.unreadCount: {
      (property: FoldersSortProperty.alphabetical, order: SortBoxOrder.ascending),
    },
  },
);

typedef FolderFeedsWrapper = ({news.Folder folder, int feedCount, int unreadCount});
