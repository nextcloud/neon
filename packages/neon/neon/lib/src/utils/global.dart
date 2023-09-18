import 'package:meta/meta.dart';
import 'package:neon/src/models/push_notification.dart';

@internal
class Global {
  const Global._();

  static Future<void> Function(String accountID)? onPushNotificationReceived;
  static Future<void> Function(PushNotification notification)? onPushNotificationClicked;
}
