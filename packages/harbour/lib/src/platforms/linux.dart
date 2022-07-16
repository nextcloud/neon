part of '../harbour.dart';

class LinuxHarbourPlatform extends HarbourPlatform {
  LinuxHarbourPlatform()
      : super(
          canUseWebView: false,
          canUseWakelock: false,
          canUseQuickActions: false,
          canUseSystemTray: true,
          canUseWindowManager: true,
          canUseCamera: false,
          getApplicationCachePath: () async => p.join(
            xdg.cacheHome.absolute.path,
            'de.provokateurin.harbour',
          ),
          getUserAccessibleAppDataPath: () async => p.join(Platform.environment['HOME']!, 'Harbour'),
          init: () async {
            sqfliteFfiInit();
            databaseFactory = databaseFactoryFfi;
          },
        );
}
