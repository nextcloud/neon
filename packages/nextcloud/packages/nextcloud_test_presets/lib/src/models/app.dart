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

  AppRelease? findLatestCompatibleRelease(ServerRelease serverRelease, {bool allowUnstable = false}) {
    final compatibleReleases = releases
        .where(
          (release) =>
              serverRelease.isCompatible(release.minimumServerVersion, release.maximumServerVersion) &&
              (allowUnstable || !release.version.isPreRelease),
        )
        .toList()
      ..sort((a, b) => b.compareTo(a));
    return compatibleReleases.firstOrNull;
  }

  AppRelease findLatestRelease() {
    final sortedReleases = releases..sort((a, b) => b.compareTo(a));
    return sortedReleases.first;
  }
}
