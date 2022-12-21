part of '../app.dart';

final foldersSortBox = SortBox<FoldersSortProperty, FolderFeedsWrapper>(
  {
    FoldersSortProperty.alphabetical: (final folderFeedsWrapper) => folderFeedsWrapper.folder.name.toLowerCase(),
    FoldersSortProperty.unreadCount: (final folderFeedsWrapper) => feedsUnreadCountSum(folderFeedsWrapper.feeds),
  },
  {
    FoldersSortProperty.alphabetical: Box(FoldersSortProperty.unreadCount, SortBoxOrder.descending),
    FoldersSortProperty.unreadCount: Box(FoldersSortProperty.alphabetical, SortBoxOrder.ascending),
  },
);

class FolderFeedsWrapper {
  FolderFeedsWrapper(
    this.folder,
    this.feeds,
  );

  final NextcloudNewsFolder folder;
  final List<NextcloudNewsFeed> feeds;
}

int feedsUnreadCountSum(final List<NextcloudNewsFeed> feeds) => [
      0, // Fixes error when no feeds are in the folder
      ...feeds.map((final f) => f.unreadCount!),
    ].reduce(
      (final a, final b) => a + b,
    );
