part of '../neon.dart';

abstract class NeonPlatform {
  NeonPlatform({
    required this.canUseWebView,
    required this.canUseWakelock,
    required this.canUseQuickActions,
    required this.canUseSystemTray,
    required this.canUseWindowManager,
    required this.canUseCamera,
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

  final Future<String> Function() getApplicationCachePath;

  final Future<String> Function() getUserAccessibleAppDataPath;

  final Future Function()? init;
}
