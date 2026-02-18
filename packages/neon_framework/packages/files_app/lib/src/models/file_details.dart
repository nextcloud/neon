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
  });

  FileDetails.fromWebDav({
    required webdav.WebDavFile file,
  })  : uri = file.path,
        size = file.size,
        etag = file.etag,
        mimeType = file.mimeType,
        lastModified = file.lastModified,
        isFavorite = file.favorite,
        blurHash = file.blurHash;

  FileDetails.fromUploadTask({
    required FilesUploadTask task,
  })  : uri = task.uri,
        size = task.size,
        lastModified = task.lastModified,
        etag = null,
        mimeType = null,
        isFavorite = null,
        blurHash = null;

  String get name => uri.name;

  bool get isDirectory => uri.isDirectory;

  final webdav.PathUri uri;

  final int? size;

  final String? etag;

  final String? mimeType;

  final tz.TZDateTime? lastModified;

  final bool? isFavorite;

  final String? blurHash;
}
