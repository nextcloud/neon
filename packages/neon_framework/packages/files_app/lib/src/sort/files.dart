import 'package:files_app/src/options.dart';
import 'package:neon_framework/sort_box.dart';
import 'package:nextcloud/utils.dart';
import 'package:nextcloud/webdav.dart' as webdav;

final filesSortBox = SortBox<FilesSortProperty, webdav.WebDavResponse>(
  properties: {
    FilesSortProperty.name: (file) => file.name.toLowerCase(),
    FilesSortProperty.modifiedDate: (file) => file.props.davGetlastmodified?.secondsSinceEpoch ?? 0,
    FilesSortProperty.size: (file) => file.props.ocSize ?? 0,
    FilesSortProperty.isFolder: (file) => file.isDirectory ? 0 : 1,
  },
  boxes: const {
    FilesSortProperty.modifiedDate: {
      (property: FilesSortProperty.name, order: SortBoxOrder.ascending),
    },
    FilesSortProperty.size: {
      (property: FilesSortProperty.name, order: SortBoxOrder.ascending),
    },
  },
);
