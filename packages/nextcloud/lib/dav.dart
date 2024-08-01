import 'package:nextcloud/src/api/dav/dav.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'package:nextcloud/src/api/dav/dav.openapi.dart';

/// Client for the dav APIs.
extension DavExtension on NextcloudClient {
  static final _dav = Expando<$Client>();

  /// Client for the dav APIs.
  $Client get dav => _dav[this] ??= $Client.fromClient(this);
}
