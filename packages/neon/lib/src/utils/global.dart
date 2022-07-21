part of '../neon.dart';

class Global {
  static Future init() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  static late PackageInfo packageInfo;
}
