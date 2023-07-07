part of '../neon_files.dart';

@immutable
class FileDetails {
  const FileDetails({
    required this.path,
    required this.isDirectory,
    required this.size,
    required this.etag,
    required this.mimeType,
    required this.lastModified,
    required this.hasPreview,
    required this.isFavorite,
  })  : progress = null,
        isUploading = false,
        isDownloading = false;

  FileDetails.fromWebDav({
    required final WebDavFile file,
    required final List<String> path,
  })  : path = List.from(path)..add(file.name),
        isDirectory = file.isDirectory,
        size = file.size,
        etag = file.etag,
        mimeType = file.mimeType,
        lastModified = file.lastModified,
        hasPreview = file.hasPreview,
        isFavorite = file.favorite,
        progress = null,
        isUploading = false,
        isDownloading = false;

  FileDetails.fromUploadTask({
    required final UploadTask task,
  })  : path = task.path,
        size = task.size,
        lastModified = task.lastModified,
        progress = task.progress,
        isUploading = true,
        isDownloading = false,
        isDirectory = false,
        etag = null,
        mimeType = null,
        hasPreview = null,
        isFavorite = null;

  FileDetails.fromDownloadTask({
    required final DownloadTask task,
    required final WebDavFile file,
  })  : path = task.path,
        isDirectory = file.isDirectory,
        size = file.size,
        etag = file.etag,
        mimeType = file.mimeType,
        lastModified = file.lastModified,
        hasPreview = file.hasPreview,
        isFavorite = file.favorite,
        progress = task.progress,
        isUploading = false,
        isDownloading = true;

  String get name => path.last;

  final List<String> path;

  final bool isDirectory;

  final int? size;

  final String? etag;

  final String? mimeType;

  final DateTime? lastModified;

  final bool? hasPreview;

  final bool? isFavorite;

  final Stream<double>? progress;
  final bool isUploading;
  final bool isDownloading;

  bool get isLoading => isUploading || isDownloading;
}
