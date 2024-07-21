// coverage:ignore-file
import 'package:nextcloud/src/api/notifications/notifications.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'src/api/notifications/notifications.openapi.dart';
export 'src/api/notifications/notifications_helpers.dart';

// ignore: public_member_api_docs
extension NotificationsExtension on NextcloudClient {
  static final _notifications = Expando<$Client>();

  /// Client for the notifications APIs
  $Client get notifications => _notifications[this] ??= $Client.fromClient(this);
}
