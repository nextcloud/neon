part of '../../neon.dart';

Future<NeonPlatform> getNeonPlatform() async {
  NeonPlatform? platform;
  if (Platform.isAndroid) {
    platform = AndroidNeonPlatform();
  }
  if (Platform.isLinux) {
    platform = LinuxNeonPlatform();
  }

  if (platform == null) {
    throw UnimplementedError('No implementation for platform ${Platform.operatingSystem} found');
  }

  await platform.init?.call();
  return platform;
}
