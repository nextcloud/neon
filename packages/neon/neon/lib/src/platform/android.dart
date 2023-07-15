import 'package:meta/meta.dart';
import 'package:neon/src/platform/platform.dart';
import 'package:neon/src/utils/exceptions.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

@internal
class AndroidNeonPlatform extends NeonPlatform {
  AndroidNeonPlatform()
      : super(
          canUseWebView: true,
          canUseQuickActions: true,
          canUseSystemTray: false,
          canUseWindowManager: false,
          canUseCamera: true,
          canUsePushNotifications: true,
          getApplicationCachePath: () async => (await getTemporaryDirectory()).absolute.path,
          getUserAccessibleAppDataPath: () async {
            if (!await Permission.storage.request().isGranted) {
              throw MissingPermissionException(Permission.storage);
            }
            return p.join((await getExternalStorageDirectory())!.path);
          },
        );
}
