part of '../harbour.dart';

class AndroidHarbourPlatform extends HarbourPlatform {
  AndroidHarbourPlatform()
      : super(
          canUseWebView: true,
          canUseWakelock: true,
          canUseQuickActions: true,
          canUseSystemTray: false,
          canUseWindowManager: false,
          canUseCamera: true,
          getApplicationCachePath: () async => (await getTemporaryDirectory()).absolute.path,
          getUserAccessibleAppDataPath: () async {
            if (!await Permission.storage.request().isGranted) {
              throw MissingPermissionException(Permission.storage);
            }
            return p.join((await getExternalStorageDirectory())!.path);
          },
        );
}
