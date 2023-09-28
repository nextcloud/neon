import 'package:nextcloud/src/api/core.openapi.dart';
import 'package:nextcloud/src/api/news.openapi.dart';
import 'package:nextcloud/src/api/notes.openapi.dart';
import 'package:version/version.dart';

/// Version of core/Server supported
const coreSupportedVersion = 27;

/// API version of the news app supported
const newsSupportedVersion = 'v1-3';

/// API version of the notes app supported
const notesSupportedVersion = 1;

// ignore: public_member_api_docs
extension CoreVersionSupported on CoreClient {
  /// Check if the core/Server version is supported by this client
  ///
  /// Also returns the supported version number
  (bool, int) isSupported(final CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data capabilities) => (
        capabilities.version.major == coreSupportedVersion,
        coreSupportedVersion,
      );
}

// ignore: public_member_api_docs
extension CoreStatusVersionSupported on CoreStatus {
  /// Check if the core/Server version is supported
  bool get isSupported => version.startsWith('$coreSupportedVersion.');
}

// ignore: public_member_api_docs
extension NewsVersionSupported on NewsClient {
  /// Check if the news app version is supported by this client
  ///
  /// Also returns the supported API version number
  Future<(bool, String)> isSupported() async {
    final response = await getSupportedApiVersions();
    return (
      response.body.apiLevels!.contains(newsSupportedVersion),
      newsSupportedVersion,
    );
  }
}

// ignore: public_member_api_docs
extension NotesVersionSupported on NotesClient {
  /// Check if the notes app version is supported by this client
  ///
  /// Also returns the supported API version number
  (bool, int) isSupported(final CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data capabilities) => (
        capabilities.capabilities.notesCapabilities?.notes.apiVersion
                ?.map(Version.parse)
                .where((final version) => version.major == notesSupportedVersion)
                .isNotEmpty ??
            false,
        notesSupportedVersion,
      );
}
