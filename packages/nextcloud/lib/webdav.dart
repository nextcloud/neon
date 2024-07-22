// coverage:ignore-file
import 'package:nextcloud/src/api/webdav/webdav_client.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'src/api/webdav/webdav.dart' hide DurationXMLConverter, WebDavCSRFClient, constructUri, parseWebDavOptions;

// ignore: public_member_api_docs
extension WebDAVExtension on NextcloudClient {
  static final _webdav = Expando<Map<String, WebDavClient>>();

  /// Client for WebDAV.
  ///
  /// Defaults to `remote.php/webdav` for accessing "Files".
  WebDavClient webdav({String endpoint = 'remote.php/webdav'}) {
    _webdav[this] ??= {};

    return _webdav[this]![endpoint] ??= WebDavClient(
      this,
      endpoint: endpoint,
    );
  }
}
