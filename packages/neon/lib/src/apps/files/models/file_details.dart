part of '../app.dart';

class FileDetails {
  FileDetails({
    required this.path,
    required this.isDirectory,
    required this.size,
    required this.etag,
    required this.mimeType,
    required this.lastModified,
    required this.hasPreview,
    required this.isFavorite,
  });

  String get name => path.last;

  final List<String> path;

  final bool isDirectory;

  final int size;

  final String? etag;

  final String? mimeType;

  final DateTime lastModified;

  final bool? hasPreview;

  final bool? isFavorite;
}
