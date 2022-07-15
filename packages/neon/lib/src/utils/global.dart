part of '../neon.dart';

class Global {
  static Future init() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  static late PackageInfo packageInfo;
  static Function()? onPushNotificationReceived;
  static Function(String? payload)? onPushNotificationClicked;
  static Future<bool> Function(NotificationsNotification notification)? handleNotificationOpening;
}
