import 'package:nextcloud/src/api/files_versions/files_versions.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'package:nextcloud/src/api/files_versions/files_versions.openapi.dart';

/// Client for the files_versions APIs.
extension FilesVersionsExtension on NextcloudClient {
  static final _filesVersions = Expando<$Client>();

  /// Client for the files_versions APIs.
  $Client get filesVersions => _filesVersions[this] ??= $Client.fromClient(this);
}
