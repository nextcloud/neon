import 'package:nextcloud/src/api/updatenotification/updatenotification.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'package:nextcloud/src/api/updatenotification/updatenotification.openapi.dart';

/// ID for the updatenotification app.
const String appID = 'updatenotification';

/// Client for the updatenotification APIs.
extension UpdatenotificationExtension on NextcloudClient {
  static final _updatenotification = Expando<$Client>();

  /// Client for the updatenotification APIs.
  $Client get updatenotification => _updatenotification[this] ??= $Client.fromClient(this);
}
