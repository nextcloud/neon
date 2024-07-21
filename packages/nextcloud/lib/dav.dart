// coverage:ignore-file
import 'package:nextcloud/src/api/dav/dav.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'src/api/dav/dav.openapi.dart';

// ignore: public_member_api_docs
extension DavExtension on NextcloudClient {
  static final _dav = Expando<$Client>();

  /// Client for the dav APIs
  $Client get dav => _dav[this] ??= $Client.fromClient(this);
}
