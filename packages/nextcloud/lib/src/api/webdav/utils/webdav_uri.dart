import 'package:meta/meta.dart';
import 'package:nextcloud/src/api/webdav/webdav.dart';

/// Constructs the uri for a webdav request for a given server [baseURL] and file [path].
@internal
Uri constructUri(Uri baseURL, String endpoint, [PathUri? path]) {
  final segments = baseURL.pathSegments.toList()..addAll(PathUri.parse(endpoint).pathSegments);
  if (path != null) {
    segments.addAll(path.pathSegments);
  }
  return baseURL.replace(pathSegments: segments.where((s) => s.isNotEmpty));
}
