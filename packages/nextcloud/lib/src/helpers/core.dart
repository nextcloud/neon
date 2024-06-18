// ignore_for_file: public_member_api_docs

import 'package:built_collection/built_collection.dart';
import 'package:nextcloud/src/api/core.openapi.dart' as core;
import 'package:nextcloud/src/helpers/common.dart';
import 'package:version/version.dart';

/// Minimum version of core/Server supported
final minVersion = Version(28, 0, 0);

/// Maximum major of core/Server supported
const maxMajor = 29;

/// Checks whether the server [version] is a dev, beta or RC version.
bool _isDevelopmentServerVersion(String version) {
  return version.contains('dev') || version.contains('beta') || version.contains('RC');
}

extension CoreVersionCheck on core.$Client {
  /// Check if the core/Server version is supported by this client
  ///
  /// Also returns the minimum supported version
  VersionCheck getVersionCheck(core.OcsGetCapabilitiesResponseApplicationJson_Ocs_Data capabilities) {
    final version = Version(
      capabilities.version.major,
      capabilities.version.minor,
      capabilities.version.micro,
    );
    return VersionCheck(
      versions: BuiltList([version]),
      minimumVersion: minVersion,
      maximumMajor: maxMajor,
      isSupportedOverride: _isDevelopmentServerVersion(capabilities.version.string) ? true : null,
    );
  }
}

extension CoreStatusVersionCheck on core.Status {
  /// Check if the core/Server version is supported
  VersionCheck get versionCheck => VersionCheck(
        versions: BuiltList([Version.parse(version)]),
        minimumVersion: minVersion,
        maximumMajor: maxMajor,
        isSupportedOverride: _isDevelopmentServerVersion(versionstring) ? true : null,
      );
}

// https://github.com/nextcloud/server/blob/master/lib/public/Share/IShare.php
enum ShareType {
  user,
  group,
  usergroup,
  link,
  email,
  @Deprecated('No longer used')
  contact,
  remote,
  circle,
  guest,
  remoteGroup,
  room,
  @Deprecated('Only used internally')
  userroom,
  deck,
  deckUser,
  // ignore: unused_field
  _unused,
  scienceMesh,
}
