import 'dart:io';

import 'package:meta/meta.dart';
import 'package:neon/src/platform/platform.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:xdg_directories/xdg_directories.dart' as xdg;

@internal
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
          getUserAccessibleAppDataPath: () async => p.join(Platform.environment['HOME']!, 'Neon'),
          init: () async {
            sqfliteFfiInit();
            databaseFactory = databaseFactoryFfi;
          },
        );
}
