import 'package:nextcloud/src/api/core/core.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'package:nextcloud/src/api/core/core.openapi.dart';
export 'package:nextcloud/src/api/core/core_helpers.dart';

/// Client for the core APIs.
extension CoreExtension on NextcloudClient {
  static final _core = Expando<$Client>();

  /// Client for the core APIs.
  $Client get core => _core[this] ??= $Client.fromClient(this);
}
