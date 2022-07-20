part of '../neon.dart';

class AndroidNeonPlatform extends NeonPlatform {
  AndroidNeonPlatform()
      : super(
          canUseWebView: true,
          canUseWakelock: true,
          canUseQuickActions: true,
          canUseSystemTray: false,
          canUseWindowManager: false,
          canUseCamera: true,
          canUsePushNotifications: true,
          getApplicationCachePath: () async => (await getTemporaryDirectory()).absolute.path,
        );
}
