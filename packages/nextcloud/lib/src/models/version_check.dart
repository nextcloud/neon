import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:version/version.dart';

/// Holds the [versions], [minimumVersion] and [maximumMajor] of an app.
@immutable
class VersionCheck {
  /// Creates a new [VersionCheck].
  ///
  /// If the [maximumMajor] is `null` the compatibility of the major of the [minimumVersion] is checked.
  const VersionCheck({
    required this.versions,
    required this.minimumVersion,
    required int? maximumMajor,
    bool? isSupportedOverride,
  })  : _maximumMajor = maximumMajor,
        _isSupportedOverride = isSupportedOverride;

  /// Current version of the app.
  final BuiltList<Version>? versions;

  /// Minimum version of the app.
  final Version minimumVersion;

  final int? _maximumMajor;

  /// Maximum major version of the app.
  int get maximumMajor => _maximumMajor ?? minimumVersion.major;

  /// Overrides the check if the current version is supported.
  final bool? _isSupportedOverride;

  /// Whether the [versions] is allowed by the [minimumVersion] and [maximumMajor].
  ///
  /// If [versions] is `null` or empty it is assumed that the app is supported.
  /// Only one of the [versions] has to be supported to return `true`.
  bool get isSupported {
    if (_isSupportedOverride != null) {
      return _isSupportedOverride!;
    }

    if (versions == null || versions!.isEmpty) {
      return true;
    }

    for (final version in versions!) {
      if (version >= minimumVersion && version.major <= maximumMajor) {
        return true;
      }
    }

    return false;
  }

  @override
  bool operator ==(Object other) =>
      other is VersionCheck &&
      other.versions == versions &&
      other.minimumVersion == minimumVersion &&
      other.maximumMajor == maximumMajor &&
      other._isSupportedOverride == _isSupportedOverride;

  @override
  int get hashCode => Object.hashAll([
        versions,
        minimumVersion,
        maximumMajor,
        _isSupportedOverride,
      ]);
}
