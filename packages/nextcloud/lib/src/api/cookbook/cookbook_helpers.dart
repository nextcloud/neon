import 'package:built_collection/built_collection.dart';
import 'package:nextcloud/src/api/cookbook/cookbook.openapi.dart' as cookbook;
import 'package:nextcloud/src/models/models.dart';
import 'package:version/version.dart';

/// Minimum version of the cookbook app supported.
final minAppVersion = Version(0, 11, 1);

/// Extension for checking the version compatibility of the installed cookbook app.
extension CookbookVersionCheck on cookbook.$Client {
  /// Check if the cookbook app version is supported by this client.
  ///
  /// Also returns the supported APP version.
  Future<VersionCheck> getVersionCheck() async {
    final response = await misc.version();
    final version = response.body.cookbookVersion;

    BuiltList<Version>? versions;
    if (version != null) {
      versions = BuiltList([
        Version(
          version[0].asNum as int,
          version[1].asNum as int,
          version[2].asNum as int,
        ),
      ]);
    }

    return VersionCheck(
      versions: versions,
      minimumVersion: minAppVersion,
    );
  }
}
