import 'package:neon/sort_box.dart';
import 'package:neon_news/src/options.dart';
import 'package:nextcloud/news.dart' as news;

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
