import 'dart:convert';

import 'package:dynamite_runtime/http_client.dart';
import 'package:dynamite_runtime/utils.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:nextcloud/src/webdav/models.dart';
import 'package:nextcloud/src/webdav/path_uri.dart';
import 'package:nextcloud/src/webdav/webdav.dart';

/// Base path used on the server
final webdavBase = PathUri.parse('/remote.php/webdav');

/// Parses the response headers from a `options` request.
WebDavOptions parseWebDavOptions(Map<String, String> headers) {
  final davCapabilities = headers['dav'];
  final davSearchCapabilities = headers['dasl'];

  return WebDavOptions(
    davCapabilities?.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toSet(),
    davSearchCapabilities?.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toSet(),
  );
}

/// Constructs the uri for a webdav request for a given server [baseURL] and file [path].
@internal
Uri constructUri(Uri baseURL, [PathUri? path]) {
  final segments = baseURL.pathSegments.toList()..addAll(webdavBase.pathSegments);
  if (path != null) {
    segments.addAll(path.pathSegments);
  }
  return baseURL.replace(pathSegments: segments.where((s) => s.isNotEmpty));
}

/// Converter to transform a [http.StreamedResponse] into a [DynamiteResponse].
///
/// Throws a [DynamiteApiException] on errors.
final class WebDavResponseConverter with Converter<http.StreamedResponse, Future<WebDavMultistatus>> {
  /// Creates a new response converter
  const WebDavResponseConverter();

  @override
  Future<WebDavMultistatus> convert(http.StreamedResponse input) async {
    final encoding = encodingForHeaders(input.headers);

    final xml = await input.stream.bytesToXml(encoding);
    return WebDavMultistatus.fromXmlElement(xml!);
  }
}
