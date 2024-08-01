import 'package:nextcloud/src/api/user_status/user_status.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'package:nextcloud/src/api/user_status/user_status.openapi.dart';

/// ID for the user_status app.
const String appID = 'user_status';

/// Client for the user_status APIs.
extension UserStatusExtension on NextcloudClient {
  static final _userStatus = Expando<$Client>();

  /// Client for the user_status APIs.
  $Client get userStatus => _userStatus[this] ??= $Client.fromClient(this);
}
