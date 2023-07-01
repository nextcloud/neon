import 'package:neon/src/models/push_notification.dart';

class Global {
  static Function(String accountID)? onPushNotificationReceived;
  static Function(PushNotification notification)? onPushNotificationClicked;
}
