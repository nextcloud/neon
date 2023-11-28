import 'package:meta/meta.dart';
import 'package:nextcloud_test/src/extended_version.dart';

/// Describes a release of an [App] from https://apps.nextcloud.com
@internal
typedef AppRelease = ({
  ExtendedVersion version,
  ExtendedVersion minimumServerVersion,
  ExtendedVersion maximumServerVersion,
});

/// Describes an app from https://apps.nextcloud.com
@internal
typedef App = ({
  String id,
  List<AppRelease> releases,
});

@internal
extension AppFindLatestRelease on App {
  AppRelease findLatestRelease(final ExtendedVersion serverVersion) {
    final compatibleReleases = releases
        .where(
          (final release) =>
              serverVersion >= release.minimumServerVersion && serverVersion <= release.maximumServerVersion,
        )
        .toList()
      ..sort((final a, final b) => b.version.compareTo(a.version));
    return compatibleReleases.first;
  }
}

@internal
extension AppReleaseFindLatestServerVersion on AppRelease {
  ExtendedVersion findLatestServerVersion(final List<ExtendedVersion> serverVersions) {
    final compatibleReleases = serverVersions
        .where(
          (final serverVersion) => serverVersion >= minimumServerVersion && serverVersion <= maximumServerVersion,
        )
        .toList()
      ..sort((final a, final b) => b.compareTo(a));
    return compatibleReleases.first;
  }
}
