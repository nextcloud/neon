import 'package:meta/meta.dart';
import 'package:nextcloud/src/api/webdav/webdav.dart';

/// Base path used on the server
final webdavBase = PathUri.parse('/remote.php/webdav');

/// Constructs the uri for a webdav request for a given server [baseURL] and file [path].
@internal
Uri constructUri(Uri baseURL, [PathUri? path]) {
  final segments = baseURL.pathSegments.toList()..addAll(webdavBase.pathSegments);
  if (path != null) {
    segments.addAll(path.pathSegments);
  }
  return baseURL.replace(pathSegments: segments.where((s) => s.isNotEmpty));
}
