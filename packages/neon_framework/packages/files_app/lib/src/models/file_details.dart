import 'package:files_app/src/utils/task.dart';
import 'package:meta/meta.dart';
import 'package:nextcloud/webdav.dart' as webdav;
import 'package:timezone/timezone.dart' as tz;

@immutable
class FileDetails {
  const FileDetails({
    required this.uri,
    required this.size,
    required this.etag,
    required this.mimeType,
    required this.lastModified,
    required this.isFavorite,
    required this.blurHash,
  }) : task = null;

  FileDetails.fromWebDav({
    required webdav.WebDavResponse file,
  })  : uri = file.path,
        size = file.props.ocSize,
        etag = file.props.davGetetag,
        mimeType = file.props.davGetcontenttype,
        lastModified = file.props.davGetlastmodified,
        isFavorite = file.props.ocFavorite,
        blurHash = file.props.ncMetadataBlurhash,
        task = null;

  FileDetails.fromUploadTask({
    required FilesUploadTask this.task,
  })  : uri = task.uri,
        size = task.size,
        lastModified = task.lastModified,
        etag = null,
        mimeType = null,
        isFavorite = null,
        blurHash = null;

  FileDetails.fromDownloadTask({
    required FilesDownloadTask this.task,
    required webdav.WebDavResponse file,
  })  : uri = task.uri,
        size = file.props.ocSize,
        etag = file.props.davGetetag,
        mimeType = file.props.davGetcontenttype,
        lastModified = file.props.davGetlastmodified,
        isFavorite = file.props.ocFavorite,
        blurHash = file.props.ncMetadataBlurhash;

  factory FileDetails.fromTask({
    required FilesTask task,
    required webdav.WebDavResponse file,
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

  final webdav.PathUri uri;

  final int? size;

  final String? etag;

  final String? mimeType;

  final tz.TZDateTime? lastModified;

  final bool? isFavorite;

  final String? blurHash;

  final FilesTask? task;

  bool get hasTask => task != null;
}
