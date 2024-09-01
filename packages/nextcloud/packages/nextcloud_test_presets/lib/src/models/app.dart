import 'package:meta/meta.dart';
import 'package:nextcloud_test_presets/src/models/models.dart';

/// Describes an app from https://apps.nextcloud.com
@internal
class App {
  App({
    required this.id,
    required this.releases,
  });

  final String id;
  final List<AppRelease> releases;

  AppRelease? findLatestCompatibleRelease(Version serverVersion, {bool allowUnstable = false}) {
    final compatibleReleases = releases
        .where(
          (release) =>
              serverVersion >= release.minimumServerVersion &&
              serverVersion < release.maximumServerVersion.incrementMajor() &&
              (allowUnstable || !release.version.isPreRelease),
        )
        .toList()
      ..sort((a, b) => b.version.compareTo(a.version));
    return compatibleReleases.firstOrNull;
  }

  AppRelease findLatestRelease() {
    final sortedReleases = releases..sort((a, b) => b.version.compareTo(a.version));
    return sortedReleases.first;
  }
}
