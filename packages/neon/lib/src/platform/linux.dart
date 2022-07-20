part of '../neon.dart';

class LinuxNeonPlatform extends NeonPlatform {
  LinuxNeonPlatform()
      : super(
          canUseWebView: false,
          canUseWakelock: false,
          canUseQuickActions: false,
          canUseSystemTray: true,
          canUseWindowManager: true,
          canUseCamera: false,
          canUsePushNotifications: false,
          getApplicationCachePath: () async => p.join(
            xdg.cacheHome.absolute.path,
            'de.provokateurin.neon',
          ),
          init: () async {
            sqfliteFfiInit();
            databaseFactory = databaseFactoryFfi;
          },
        );
}
