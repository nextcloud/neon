import 'dart:io';

import 'package:meta/meta.dart';
import 'package:neon/src/platform/platform.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:xdg_directories/xdg_directories.dart' as xdg;

@immutable
@internal
class LinuxNeonPlatform implements NeonPlatform {
  const LinuxNeonPlatform();

  @override
  bool get canUseWebView => false;

  @override
  bool get canUseQuickActions => false;

  @override
  bool get canUseSystemTray => true;

  @override
  bool get canUseWindowManager => true;

  @override
  bool get canUseCamera => false;

  @override
  bool get canUsePushNotifications => false;

  @override
  String getApplicationCachePath() => p.join(
        xdg.cacheHome.absolute.path,
        'de.provokateurin.neon',
      );

  @override
  String getUserAccessibleAppDataPath() => p.join(Platform.environment['HOME']!, 'Neon');

  @override
  void init() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
}
