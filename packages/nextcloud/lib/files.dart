import 'package:nextcloud/src/api/files/files.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'package:nextcloud/src/api/files/files.openapi.dart';

/// ID for the files app.
const String appID = 'files';

/// Client for the files APIs.
extension FilesExtension on NextcloudClient {
  static final _files = Expando<$Client>();

  /// Client for the files APIs.
  $Client get files => _files[this] ??= $Client.fromClient(this);
}
