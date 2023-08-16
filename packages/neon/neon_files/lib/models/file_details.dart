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
  }) : task = null;

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
        task = null;

  FileDetails.fromUploadTask({
    required FilesUploadTask this.task,
  })  : path = task.path,
        size = task.size,
        lastModified = task.lastModified,
        isDirectory = false,
        etag = null,
        mimeType = null,
        hasPreview = null,
        isFavorite = null;

  FileDetails.fromDownloadTask({
    required FilesDownloadTask this.task,
    required final WebDavFile file,
  })  : path = task.path,
        isDirectory = file.isDirectory,
        size = file.size,
        etag = file.etag,
        mimeType = file.mimeType,
        lastModified = file.lastModified,
        hasPreview = file.hasPreview,
        isFavorite = file.favorite;

  factory FileDetails.fromTask({
    required final FilesTask task,
    required final WebDavFile file,
  }) {
    switch (task) {
      case FilesUploadTask():
        return FileDetails.fromUploadTask(task: task);
      case FilesDownloadTask():
        return FileDetails.fromDownloadTask(
          task: task,
          file: file,
        );
    }
  }

  String get name => path.last;

  final List<String> path;

  final bool isDirectory;

  final int? size;

  final String? etag;

  final String? mimeType;

  final DateTime? lastModified;

  final bool? hasPreview;

  final bool? isFavorite;

  final FilesTask? task;

  bool get hasTask => task != null;
}
