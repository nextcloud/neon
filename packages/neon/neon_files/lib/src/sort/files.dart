import 'package:neon/sort_box.dart';
import 'package:neon_files/src/options.dart';
import 'package:nextcloud/webdav.dart';

final filesSortBox = SortBox<FilesSortProperty, WebDavFile>(
  {
    FilesSortProperty.name: (final file) => file.name.toLowerCase(),
    FilesSortProperty.modifiedDate: (final file) => file.lastModified?.millisecondsSinceEpoch ?? 0,
    FilesSortProperty.size: (final file) => file.size ?? 0,
    FilesSortProperty.isFolder: (final file) => file.isDirectory ? 0 : 1,
  },
  {
    FilesSortProperty.modifiedDate: {
      (property: FilesSortProperty.name, order: SortBoxOrder.ascending),
    },
    FilesSortProperty.size: {
      (property: FilesSortProperty.name, order: SortBoxOrder.ascending),
    },
  },
);
