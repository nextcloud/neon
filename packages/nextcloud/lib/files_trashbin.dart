import 'package:nextcloud/src/api/files_trashbin/files_trashbin.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'package:nextcloud/src/api/files_trashbin/files_trashbin.openapi.dart';

/// ID for the files_trashbin app.
const String appID = 'files_trashbin';

/// Client for the files_trashbin APIs.
extension FilesTrashbinExtension on NextcloudClient {
  static final _filesTrashbin = Expando<$Client>();

  /// Client for the files_trashbin APIs.
  $Client get filesTrashbin => _filesTrashbin[this] ??= $Client.fromClient(this);
}
