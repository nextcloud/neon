part of '../neon_files.dart';

final filesSortBox = SortBox<FilesSortProperty, WebDavFile>(
  {
    FilesSortProperty.name: (final file) => file.name.toLowerCase(),
    FilesSortProperty.modifiedDate: (final file) => file.lastModified?.millisecondsSinceEpoch ?? 0,
    FilesSortProperty.size: (final file) => file.size ?? 0,
  },
  {
    FilesSortProperty.modifiedDate: {
      (FilesSortProperty.name, SortBoxOrder.ascending),
    },
    FilesSortProperty.size: {
      (FilesSortProperty.name, SortBoxOrder.ascending),
    },
  },
);
