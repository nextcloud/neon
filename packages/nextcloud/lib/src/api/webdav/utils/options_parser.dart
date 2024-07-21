import 'package:meta/meta.dart';
import 'package:nextcloud/src/api/webdav/webdav.dart';

/// Parses the response headers from a `options` request.
@internal
WebDavOptions parseWebDavOptions(Map<String, String> headers) {
  final davCapabilities = headers['dav'];
  final davSearchCapabilities = headers['dasl'];

  return WebDavOptions(
    davCapabilities?.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toSet(),
    davSearchCapabilities?.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toSet(),
  );
}
