import 'package:meta/meta.dart';
import 'package:neon_framework/src/models/push_notification.dart';

/// Global states handling notification callbacks.
@internal
class Global {
  const Global._();

  static Future<void> Function(String accountID)? onPushNotificationReceived;
  static Future<void> Function(PushNotification notification)? onPushNotificationClicked;
}
