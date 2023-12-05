import 'package:meta/meta.dart';
import 'package:neon_framework/src/platform/android.dart';
import 'package:neon_framework/src/platform/platform.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:universal_io/io.dart';

/// Linux specific platform information.
///
/// See:
///   * [NeonPlatform] to initialize and acquire an instance
///   * [AndroidNeonPlatform] for the Android implementation
@immutable
@internal
class LinuxNeonPlatform implements NeonPlatform {
  /// Creates a new Linux Neon platform.
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
  bool get canUseSharing => false;

  @override
  bool get shouldUseFileDialog => false;

  @override
  String get userAccessibleAppDataPath => p.join(Platform.environment['HOME']!, 'Neon');

  @override
  void init() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
}
