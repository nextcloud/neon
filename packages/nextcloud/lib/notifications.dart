import 'package:nextcloud/src/api/notifications/notifications.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'package:nextcloud/src/api/notifications/notifications.openapi.dart';
export 'package:nextcloud/src/api/notifications/notifications_helpers.dart';

/// ID for the notifications app.
const String appID = 'notifications';

/// Client for the notifications APIs.
extension NotificationsExtension on NextcloudClient {
  static final _notifications = Expando<$Client>();

  /// Client for the notifications APIs.
  $Client get notifications => _notifications[this] ??= $Client.fromClient(this);
}
