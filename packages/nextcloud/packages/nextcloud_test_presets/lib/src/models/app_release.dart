import 'package:meta/meta.dart';
import 'package:nextcloud_test_presets/src/models/models.dart';

/// Describes a release of an [App] from https://apps.nextcloud.com
@internal
class AppRelease {
  const AppRelease({
    required this.version,
    required this.url,
    required this.minimumServerVersion,
    required this.maximumServerVersion,
  });

  final Version version;
  final String url;
  final Version minimumServerVersion;
  final Version maximumServerVersion;

  Version? findLatestServerVersion(List<Version> serverVersions) {
    final compatibleReleases = serverVersions
        .where(
          (serverVersion) =>
              serverVersion >= minimumServerVersion && serverVersion < maximumServerVersion.incrementMajor(),
        )
        .toList()
      ..sort((a, b) => b.compareTo(a));
    return compatibleReleases.firstOrNull;
  }
}
