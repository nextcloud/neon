import 'package:nextcloud/src/api/files_external/files_external.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'package:nextcloud/src/api/files_external/files_external.openapi.dart';

/// Client for the files_external APIs.
extension FilesExternalExtension on NextcloudClient {
  static final _filesExternal = Expando<$Client>();

  /// Client for the files_external APIs.
  $Client get filesExternal => _filesExternal[this] ??= $Client.fromClient(this);
}
