part of '../neon.dart';

class Global {
  static Function(String accountID)? onPushNotificationReceived;
  static Function(PushNotificationWithAccountID notification)? onPushNotificationClicked;
}
