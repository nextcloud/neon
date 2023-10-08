// ignore_for_file: public_member_api_docs

import 'package:nextcloud/src/api/core.openapi.dart' as core;

/// Version of core/Server supported
const supportedVersion = 27;

extension CoreVersionSupported on core.Client {
  /// Check if the core/Server version is supported by this client
  ///
  /// Also returns the supported version number
  (bool, int) isSupported(final core.OcsGetCapabilitiesResponseApplicationJson_Ocs_Data capabilities) => (
        capabilities.version.major == supportedVersion,
        supportedVersion,
      );
}

extension CoreStatusVersionSupported on core.Status {
  /// Check if the core/Server version is supported
  bool get isSupported => version.startsWith('$supportedVersion.');
}

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
}
