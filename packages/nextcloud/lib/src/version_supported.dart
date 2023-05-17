part of '../nextcloud.dart';

/// Version of core/Server supported
const coreSupportedVersion = 26;

/// API version of the news app supported
const newsSupportedVersion = 'v1-3';

/// API version of the notes app supported
const notesSupportedVersion = 1;

// ignore: public_member_api_docs
extension CoreVersionSupported on NextcloudCoreClient {
  /// Check if the core/Server version is supported by this client
  ///
  /// Also returns the supported version number
  Future<(bool, int)> isSupported([
    final NextcloudCoreServerCapabilities_Ocs_Data? capabilities,
  ]) async =>
      (
        (capabilities ?? (await getCapabilities()).ocs.data).version.major == coreSupportedVersion,
        coreSupportedVersion,
      );
}

// ignore: public_member_api_docs
extension NewsVersionSupported on NextcloudNewsClient {
  /// Check if the news app version is supported by this client
  ///
  /// Also returns the supported API version number
  Future<(bool, String)> isSupported() async {
    final versions = await getSupportedApiVersions();
    return (
      versions.apiLevels!.contains(newsSupportedVersion),
      newsSupportedVersion,
    );
  }
}

// ignore: public_member_api_docs
extension NotesVersionSupported on NextcloudNotesClient {
  /// Check if the notes app version is supported by this client
  ///
  /// Also returns the supported API version number
  Future<(bool, int)> isSupported([final NextcloudCoreServerCapabilities_Ocs_Data? capabilities]) async => (
        (capabilities ?? (await rootClient.core.getCapabilities()).ocs.data)
                .capabilities
                .notes
                ?.apiVersion
                ?.map(Version.parse)
                .where((final version) => version.major == notesSupportedVersion)
                .isNotEmpty ??
            false,
        notesSupportedVersion,
      );
}
