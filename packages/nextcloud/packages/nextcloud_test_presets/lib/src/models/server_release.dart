import 'package:meta/meta.dart';
import 'package:version/version.dart';

@internal
class ServerRelease implements Comparable<ServerRelease> {
  ServerRelease({
    required this.version,
    required this.dockerImageDigest,
  });

  final Version version;

  final String dockerImageDigest;

  String get dockerImageTag => '$version@$dockerImageDigest';

  String get presetVersion => '${version.major}.${version.minor}';

  bool isCompatible(Version min, Version max) => version >= min && version < max.incrementMajor();

  @override
  int compareTo(ServerRelease other) => version.compareTo(other.version);
}
