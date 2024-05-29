import 'package:meta/meta.dart';
import 'package:neon_files/src/utils/task.dart';
import 'package:nextcloud/webdav.dart';
import 'package:timezone/timezone.dart' as tz;

@immutable
class FileDetails {
  const FileDetails({
    required this.uri,
    required this.size,
    required this.etag,
    required this.mimeType,
    required this.lastModified,
    required this.hasPreview,
    required this.isFavorite,
    required this.blurHash,
  }) : task = null;

  FileDetails.fromWebDav({
    required WebDavFile file,
  })  : uri = file.path,
        size = file.size,
        etag = file.etag,
        mimeType = file.mimeType,
        lastModified = file.lastModified,
        hasPreview = file.hasPreview,
        isFavorite = file.favorite,
        blurHash = file.blurHash,
        task = null;

  FileDetails.fromUploadTask({
    required FilesUploadTask this.task,
  })  : uri = task.uri,
        size = task.size,
        lastModified = task.lastModified,
        etag = null,
        mimeType = null,
        hasPreview = null,
        isFavorite = null,
        blurHash = null;

  FileDetails.fromDownloadTask({
    required FilesDownloadTask this.task,
    required WebDavFile file,
  })  : uri = task.uri,
        size = file.size,
        etag = file.etag,
        mimeType = file.mimeType,
        lastModified = file.lastModified,
        hasPreview = file.hasPreview,
        isFavorite = file.favorite,
        blurHash = file.blurHash;

  factory FileDetails.fromTask({
    required FilesTask task,
    required WebDavFile file,
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

  String get name => uri.name;

  bool get isDirectory => uri.isDirectory;

  final PathUri uri;

  final int? size;

  final String? etag;

  final String? mimeType;

  final tz.TZDateTime? lastModified;

  final bool? hasPreview;

  final bool? isFavorite;

  final String? blurHash;

  final FilesTask? task;

  bool get hasTask => task != null;
}
