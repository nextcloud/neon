// coverage:ignore-file
import 'package:nextcloud/src/client.dart';
import 'package:nextcloud/src/webdav/client.dart';

export 'src/webdav/client.dart' hide WebDavRequest;
export 'src/webdav/file.dart';
export 'src/webdav/path_uri.dart';
export 'src/webdav/props.dart';
export 'src/webdav/webdav.dart';

// ignore: public_member_api_docs
extension DavExtension on NextcloudClient {
  static final _dav = Expando<WebDavClient>();

  /// Client for the dav APIs
  WebDavClient get dav => _dav[this] ??= WebDavClient.dav(this);
}
