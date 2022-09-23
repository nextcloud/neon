part of '../nextcloud.dart';

// ignore: public_member_api_docs
class NextcloudClient extends Client {
  // ignore: public_member_api_docs
  NextcloudClient(
    super.baseURL, {
    this.username,
    final String? password,
    final String? language,
    final AppType appType = AppType.unknown,
    final String? userAgentOverride,
  }) : super(
          baseHeaders: (<String, String?>{
            'OCS-APIRequest': 'true',
            'Accept': 'application/json',
            'Accept-Language': language,
            'User-Agent': userAgentOverride ?? appType.userAgent,
          }..removeWhere((final _, final value) => value == null))
              .cast<String, String>(),
          authentication: username != null && password != null
              ? HttpBasicAuthentication(
                  username: username,
                  password: password,
                )
              : null,
        );

  /// Username used for all operations. Necessary for accessing WebDAV resources
  final String? username;

  WebDavClient? _webdav;

  /// Client for WebDAV. Will be null if no username is set for the client
  WebDavClient get webdav {
    if (_webdav != null) {
      return _webdav!;
    }
    if (username == null) {
      throw Exception('The WebDAV client is only available when a username is set');
    }

    return _webdav = WebDavClient(
      super.baseURL,
      basePath: '/remote.php/dav/files/${(super.authentication! as HttpBasicAuthentication).username}',
      baseHeaders: super.baseHeaders,
    );
  }
}
