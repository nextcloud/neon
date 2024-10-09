import 'package:meta/meta.dart';
import 'package:nextcloud/src/api/webdav/webdav.dart';

/// Constructs the uri for a webdav request for a given server [baseURL] and file [path].
@internal
Uri constructUri(String username, Uri baseURL, [PathUri? path]) {
  final segments = baseURL.pathSegments.toList()..addAll(['remote.php', 'dav', 'files', username]);
  if (path != null) {
    segments.addAll(path.pathSegments);
  }
  return baseURL.replace(pathSegments: segments.where((s) => s.isNotEmpty));
}
