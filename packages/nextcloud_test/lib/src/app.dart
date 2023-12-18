import 'package:meta/meta.dart';
import 'package:version/version.dart';

/// Describes a release of an [App] from https://apps.nextcloud.com
@internal
typedef AppRelease = ({
  Version version,
  String url,
  Version minimumServerVersion,
  Version maximumServerVersion,
});

/// Describes an app from https://apps.nextcloud.com
@internal
typedef App = ({
  String id,
  List<AppRelease> releases,
});

@internal
extension AppFindLatestRelease on App {
  AppRelease? findLatestCompatibleRelease(final Version serverVersion, {final bool allowUnstable = false}) {
    final compatibleReleases = releases
        .where(
          (final release) =>
              serverVersion >= release.minimumServerVersion &&
              serverVersion < release.maximumServerVersion.incrementMajor() &&
              (allowUnstable || !release.version.isPreRelease),
        )
        .toList()
      ..sort((final a, final b) => b.version.compareTo(a.version));
    return compatibleReleases.firstOrNull;
  }

  AppRelease findLatestRelease() {
    final sortedReleases = releases..sort((final a, final b) => b.version.compareTo(a.version));
    return sortedReleases.first;
  }
}

@internal
extension AppReleaseFindLatestServerVersion on AppRelease {
  Version findLatestServerVersion(final List<Version> serverVersions) {
    final compatibleReleases = serverVersions
        .where(
          (final serverVersion) =>
              serverVersion >= minimumServerVersion && serverVersion < maximumServerVersion.incrementMajor(),
        )
        .toList()
      ..sort((final a, final b) => b.compareTo(a));
    return compatibleReleases.first;
  }
}
