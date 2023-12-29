import 'package:meta/meta.dart';
import 'package:neon_framework/src/platform/linux.dart';
import 'package:neon_framework/src/platform/platform.dart';
import 'package:neon_framework/src/utils/exceptions.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

/// Android specific platform information.
///
/// See:
///   * [NeonPlatform] to initialize and acquire an instance
///   * [LinuxNeonPlatform] for the Linux implementation
@immutable
@internal
class AndroidNeonPlatform implements NeonPlatform {
  /// Creates a new Android Neon platform.
  const AndroidNeonPlatform();

  @override
  bool get canUseCamera => true;

  @override
  bool get canUsePushNotifications => true;

  @override
  bool get canUseQuickActions => true;

  @override
  bool get canUseWebView => true;

  @override
  bool get canUseWindowManager => false;

  @override
  bool get canUseSharing => true;

  @override
  bool get shouldUseFileDialog => true;

  @override
  Future<String> get userAccessibleAppDataPath async {
    if (!await Permission.storage.request().isGranted) {
      throw const MissingPermissionException(Permission.storage);
    }

    return p.join((await getExternalStorageDirectory())!.path);
  }

  @override
  void init() {}
}
