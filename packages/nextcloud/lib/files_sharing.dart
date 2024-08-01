import 'package:nextcloud/src/api/files_sharing/files_sharing.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'package:nextcloud/src/api/files_sharing/files_sharing.openapi.dart';

/// ID for the files_sharing app.
const String appID = 'files_sharing';

/// Client for the files_sharing APIs.
extension FilesSharingExtension on NextcloudClient {
  static final _filesSharing = Expando<$Client>();

  /// Client for the files_sharing APIs.
  $Client get filesSharing => _filesSharing[this] ??= $Client.fromClient(this);
}
