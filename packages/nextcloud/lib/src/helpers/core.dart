// ignore_for_file: public_member_api_docs

import 'package:nextcloud/src/api/core.openapi.dart';

/// Version of core/Server supported
const coreSupportedVersion = 27;

extension CoreVersionSupported on CoreClient {
  /// Check if the core/Server version is supported by this client
  ///
  /// Also returns the supported version number
  (bool, int) isSupported(final CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data capabilities) => (
        capabilities.version.major == coreSupportedVersion,
        coreSupportedVersion,
      );
}

extension CoreStatusVersionSupported on CoreStatus {
  /// Check if the core/Server version is supported
  bool get isSupported => version.startsWith('$coreSupportedVersion.');
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
