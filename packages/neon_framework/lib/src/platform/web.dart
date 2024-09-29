import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:meta/meta.dart';
import 'package:neon_framework/src/platform/platform.dart';
import 'package:web/web.dart';

@immutable
@internal
class WebNeonPlatform implements NeonPlatform {
  const WebNeonPlatform();

  static void registerWith(dynamic registrar) {
    NeonPlatform.instance = const WebNeonPlatform();
  }

  @override
  bool get canUseCamera => false;

  @override
  bool get canUsePushNotifications => false;

  @override
  bool get canUseQuickActions => false;

  @override
  bool get canUseWebView => false;

  @override
  bool get canUseWindowManager => false;

  @override
  bool get canUseSharing => false;

  @override
  bool get canUsePaths => false;

  @override
  void init() {}

  @override
  Future<String?> saveFileWithPickDialog(String fileName, String mimeType, Uint8List data) async {
    final anchor = HTMLAnchorElement()
      ..href = 'data:$mimeType;base64,${base64.encode(data)}'
      ..target = 'blank'
      ..download = fileName;

    document.body!.appendChild(anchor);

    anchor
      ..click()
      ..remove();

    return fileName;
  }
}
