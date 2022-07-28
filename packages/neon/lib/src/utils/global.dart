part of '../neon.dart';

class Global {
  static Function()? onPushNotificationReceived;
  static Function(String? payload)? onPushNotificationClicked;
  static Future<bool> Function(NotificationsNotification notification)? handleNotificationOpening;
}
