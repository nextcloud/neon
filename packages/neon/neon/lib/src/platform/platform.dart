import 'dart:async';
import 'dart:io';

import 'package:meta/meta.dart';
import 'package:neon/src/platform/android.dart';
import 'package:neon/src/platform/linux.dart';

Future<NeonPlatform> getNeonPlatform() async {
  final NeonPlatform platform;
  if (Platform.isAndroid) {
    platform = const AndroidNeonPlatform();
  } else if (Platform.isLinux) {
    platform = const LinuxNeonPlatform();
  } else {
    throw UnimplementedError('No implementation for platform ${Platform.operatingSystem} found');
  }

  await platform.init.call();
  return platform;
}

@immutable
abstract interface class NeonPlatform {
  abstract final bool canUseWebView;

  abstract final bool canUseQuickActions;

  abstract final bool canUseSystemTray;

  abstract final bool canUseWindowManager;

  abstract final bool canUseCamera;

  abstract final bool canUsePushNotifications;

  FutureOr<String> getApplicationCachePath();

  FutureOr<String> getUserAccessibleAppDataPath();

  FutureOr init();
}
