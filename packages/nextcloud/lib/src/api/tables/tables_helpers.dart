import 'package:built_collection/built_collection.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/tables.dart' as tables;
import 'package:version/version.dart';

/// Minimum version of the tables app supported.
final minAppVersion = Version(0, 6, 0);

/// Extension for checking the version compatibility of the installed tables app.
extension TablesVersionCheck on tables.$Client {
  /// Check if the tables app version is supported by this client.
  ///
  /// Also returns the supported APP version.
  VersionCheck getVersionCheck(core.OcsGetCapabilitiesResponseApplicationJson_Ocs_Data capabilities) {
    final version = capabilities.capabilities.tablesCapabilities?.tables.version;

    return VersionCheck(
      versions: version != null ? BuiltList([Version.parse(version)]) : null,
      minimumVersion: minAppVersion,
      maximumMajor: null,
    );
  }
}
