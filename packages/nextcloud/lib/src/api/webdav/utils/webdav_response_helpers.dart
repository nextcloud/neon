import 'package:nextcloud/src/api/webdav/models/models.dart';

/// Helpers for WebDavResponse
extension WebDavResponseHelpers on WebDavResponse {
  /// All available props.
  WebDavProp get props => propstats.singleWhere((propstat) => propstat.status.contains('200 OK')).prop;

  /// The path of the resource.
  PathUri get path {
    final href = PathUri.parse(Uri.decodeFull(this.href!));
    return PathUri(
      isAbsolute: false,
      isDirectory: href.isDirectory,
      // The server might be hosted at a subpath, so we don't have a fixed number of path segments to remove
      pathSegments: href.pathSegments.sublist(href.pathSegments.indexOf('remote.php') + 2),
    );
  }

  /// The name of the resource.
  String get name => path.name;

  /// Whether the file is hidden.
  bool get isHidden => props.ncHidden ?? name.startsWith('.');

  /// Whether the file is a directory
  bool get isDirectory => props.davResourcetype?.collection != null || path.isDirectory;
}
