import 'package:nextcloud/src/api/webdav/webdav_client.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'package:nextcloud/src/api/webdav/webdav.dart'
    hide
        DurationXMLConverter,
        HttpDateXMLConverter,
        ISO8601XMLConverter,
        UnixEpochXMLConverter,
        WebDavCSRFClient,
        constructUri,
        parseWebDavOptions;

/// Client for WebDAV.
extension WebDAVExtension on NextcloudClient {
  static final _webdav = Expando<WebDavClient>();

  /// Client for WebDAV.
  WebDavClient get webdav => _webdav[this] ??= WebDavClient.fromClient(this);
}
