import 'package:meta/meta.dart';
import 'package:nextcloud_test_presets/src/models/models.dart';

/// Describes a release of an [App] from https://apps.nextcloud.com
@internal
class AppRelease implements Comparable<AppRelease> {
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

  ServerRelease? findLatestServerRelease(List<ServerRelease> serverReleases) {
    final compatibleReleases = serverReleases
        .where((serverRelease) => serverRelease.isCompatible(minimumServerVersion, maximumServerVersion))
        .toList()
      ..sort((a, b) => b.compareTo(a));
    return compatibleReleases.firstOrNull;
  }

  String get presetVersion => '${version.major}.${version.minor}';

  @override
  int compareTo(AppRelease other) => version.compareTo(other.version);
}
