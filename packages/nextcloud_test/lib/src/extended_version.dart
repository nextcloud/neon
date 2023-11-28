import 'package:meta/meta.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:version/version.dart';

/// An [ExtendedVersion] for [core.minVersion].
@internal
final coreMinVersion = ExtendedVersion.fromVersion(core.minVersion);

/// A replacement for [Version] that correctly compares [minor] and [patch] versions.
@immutable
@internal
class ExtendedVersion implements Comparable<ExtendedVersion> {
  const ExtendedVersion(
    this.major,
    this.minor,
    this.patch,
  );

  factory ExtendedVersion.parse(final String versionString) {
    final version = Version.parse(versionString);
    final dotCount = versionString.split('').where((final char) => char == '.').length;

    return ExtendedVersion(
      version.major,
      dotCount >= 1 ? version.minor : null,
      dotCount >= 2 ? version.patch : null,
    );
  }

  factory ExtendedVersion.fromVersion(final Version version) => ExtendedVersion(
        version.major,
        version.minor,
        version.patch,
      );

  final int major;

  final int? minor;

  final int? patch;

  @override
  String toString() {
    final buffer = StringBuffer('$major');

    if (minor != null) {
      buffer.write('.$minor');
    }
    if (patch != null) {
      buffer.write('.$patch');
    }

    return buffer.toString();
  }

  @override
  int compareTo(final ExtendedVersion other) => _compare(this, other);

  bool operator <(final dynamic other) => other is ExtendedVersion && _compare(this, other) < 0;

  bool operator <=(final dynamic other) => other is ExtendedVersion && _compare(this, other) <= 0;

  @override
  bool operator ==(final dynamic other) => other is ExtendedVersion && _compare(this, other) == 0;

  bool operator >=(final dynamic other) => other is ExtendedVersion && _compare(this, other) >= 0;

  bool operator >(final dynamic other) => other is ExtendedVersion && _compare(this, other) > 0;

  static int _compare(final ExtendedVersion a, final ExtendedVersion b) {
    final compareMinors = a.minor != null && b.minor != null;
    final comparePatches = a.patch != null && b.patch != null;

    return Version(
      a.major,
      compareMinors ? a.minor! : 0,
      comparePatches ? a.patch! : 0,
    ).compareTo(
      Version(
        b.major,
        compareMinors ? b.minor! : 0,
        comparePatches ? b.patch! : 0,
      ),
    );
  }

  @override
  int get hashCode => Object.hashAll([major, minor, patch]);
}
