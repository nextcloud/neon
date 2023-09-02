import 'package:meta/meta.dart';
import 'package:neon/src/models/push_notification.dart';

@internal
class Global {
  const Global._();

  static Function(String accountID)? onPushNotificationReceived;
  static Function(PushNotification notification)? onPushNotificationClicked;
}
