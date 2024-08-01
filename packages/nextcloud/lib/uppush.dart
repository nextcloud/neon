import 'package:nextcloud/src/api/uppush/uppush.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'package:nextcloud/src/api/uppush/uppush.openapi.dart';

/// ID for the uppush app.
const String appID = 'uppush';

/// Client for the uppush APIs.
extension UppushExtension on NextcloudClient {
  static final _uppush = Expando<$Client>();

  /// Client for the uppush APIs.
  $Client get uppush => _uppush[this] ??= $Client.fromClient(this);
}
