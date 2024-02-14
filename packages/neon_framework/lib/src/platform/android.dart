import 'dart:typed_data';

import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/src/platform/platform.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqlcipher_flutter_libs/sqlcipher_flutter_libs.dart';
import 'package:sqlite3/open.dart' as sqlite3;

/// Android specific platform information.
///
/// See:
///   * [NeonPlatform] to initialize and acquire an instance
///   * `LinuxNeonPlatform` for the Linux implementation
@immutable
class AndroidNeonPlatform implements NeonPlatform {
  /// Creates a new Android Neon platform.
  const AndroidNeonPlatform();

  /// Registers this platform.
  static void registerWith() {
    NeonPlatform.instance = const AndroidNeonPlatform();
  }

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
  bool get canUsePaths => true;

  @override
  void init() {
    databaseFactory = createDatabaseFactoryFfi(ffiInit: _ffiInit);
  }

  static void _ffiInit() {
    sqlite3.open.overrideFor(sqlite3.OperatingSystem.android, openCipherOnAndroid);
  }

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
