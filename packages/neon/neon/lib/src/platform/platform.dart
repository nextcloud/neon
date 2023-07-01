import 'dart:io';

import 'package:neon/src/platform/android.dart';
import 'package:neon/src/platform/linux.dart';

Future<NeonPlatform> getNeonPlatform() async {
  NeonPlatform? platform;
  if (Platform.isAndroid) {
    platform = AndroidNeonPlatform();
  }
  if (Platform.isLinux) {
    platform = LinuxNeonPlatform();
  }

  if (platform == null) {
    throw UnimplementedError('No implementation for platform ${Platform.operatingSystem} found');
  }

  await platform.init?.call();
  return platform;
}

abstract class NeonPlatform {
  NeonPlatform({
    required this.canUseWebView,
    required this.canUseWakelock,
    required this.canUseQuickActions,
    required this.canUseSystemTray,
    required this.canUseWindowManager,
    required this.canUseCamera,
    required this.canUsePushNotifications,
    required this.getApplicationCachePath,
    required this.getUserAccessibleAppDataPath,
    this.init,
  });

  final bool canUseWebView;

  final bool canUseWakelock;

  final bool canUseQuickActions;

  final bool canUseSystemTray;

  final bool canUseWindowManager;

  final bool canUseCamera;

  final bool canUsePushNotifications;

  final Future<String> Function() getApplicationCachePath;

  final Future<String> Function() getUserAccessibleAppDataPath;

  final Future Function()? init;
}
