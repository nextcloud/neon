part of '../nextcloud.dart';

// ignore: public_member_api_docs
class NextcloudClient extends openapi.NextcloudClient {
  // ignore: public_member_api_docs
  NextcloudClient(
    super.baseURL, {
    this.loginName,
    this.username,
    final String? password,
    final String? language,
    final AppType appType = AppType.unknown,
    final String? userAgentOverride,
    super.cookieJar,
  }) : super(
          baseHeaders: (<String, String?>{
            'OCS-APIRequest': 'true',
            'Accept': 'application/json',
            'Accept-Language': language,
          }..removeWhere((final _, final value) => value == null))
              .cast<String, String>(),
          userAgent: userAgentOverride ?? appType.userAgent,
          authentication: loginName != null && password != null
              ? openapi.NextcloudHttpBasicAuthentication(
                  username: loginName,
                  password: password,
                )
              : null,
        );

  /// Identifier used for authentication. This can be the username or email or something else.
  final String? loginName;

  /// Username of the user on the server, it needs to be set for using WebDAV.
  /// It can be obtained via the provisioning_api.
  final String? username;

  WebDavClient? _webdav;

  /// Client for WebDAV. Username needs to be set in order to use it
  WebDavClient get webdav {
    if (_webdav != null) {
      return _webdav!;
    }
    if (username == null) {
      throw Exception('The WebDAV client is only available when a username is set');
    }

    return _webdav = WebDavClient(
      this,
      '/remote.php/dav/files/$username',
    );
  }
}
