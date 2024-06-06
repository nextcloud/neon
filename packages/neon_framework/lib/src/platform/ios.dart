import 'dart:typed_data';

import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/src/platform/platform.dart';

/// IOS specific platform information.
///
/// See:
///   * [NeonPlatform] to initialize and acquire an instance
///   * `LinuxNeonPlatform` for the Linux implementation
///   * `AndroidNeonPlatform` for the Android implementation
///   * `WebNeonPlatform` for the Web implementation
@immutable
final class IOSNeonPlatform implements NeonPlatform {
  /// Creates a new IOS Neon platform.
  const IOSNeonPlatform();

  /// Registers this platform.
  @visibleForTesting
  static void registerWith() {
    NeonPlatform.instance = const IOSNeonPlatform();
  }

  @override
  bool get canUseCamera => true;

  @override
  bool get canUsePushNotifications => false;

  @override
  bool get canUseQuickActions => true;

  @override
  bool get canUseWebView => true;

  @override
  bool get canUseWindowManager => false;

  @override
  bool get canUseSharing => true;

  @override
  bool get canUsePaths => true;

  @override
  void init() {}

  @override
  Future<void> saveFileWithPickDialog(String fileName, String mimeType, Uint8List data) async {
    await FlutterFileDialog.saveFile(
      params: SaveFileDialogParams(
        data: data,
        fileName: fileName,
      ),
    );
  }
}
