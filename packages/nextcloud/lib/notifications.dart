// coverage:ignore-file
import 'package:nextcloud/src/api/notifications.openapi.dart';
import 'package:nextcloud/src/client.dart';

export 'src/api/notifications.openapi.dart';
export 'src/helpers/notifications.dart';

// ignore: public_member_api_docs
extension NotificationsExtension on NextcloudClient {
  static final _notifications = Expando<NotificationsClient>();

  /// Client for the notifications APIs
  NotificationsClient get notifications => _notifications[this] ??= NotificationsClient.fromClient(this);
}
