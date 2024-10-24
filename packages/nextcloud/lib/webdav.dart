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
  static final _username = Expando<String>();
  static final _webdav = Expando<WebDavClient>();

  /// Client for WebDAV.
  ///
  /// To acquire the [username] of the user you can use the provisioning_api.
  WebDavClient webdav(String username) {
    if (_username[this] != null && username != _username[this]) {
      throw ArgumentError(
        'You can not provide a different username than on the first invocation. Got "$username" but expected "${_username[this]}".',
      );
    }

    _username[this] ??= username;
    return _webdav[this] ??= WebDavClient.fromClient(
      this,
      username: username,
    );
  }
}
