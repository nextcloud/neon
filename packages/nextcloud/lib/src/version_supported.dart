part of '../nextcloud.dart';

// ignore: public_member_api_docs
extension CoreVersionSupported on CoreClient {
  /// Checks if the app on the server is supported by the client
  Future<bool> isSupported([final CoreServerCapabilitiesOcsData? capabilities]) async =>
      (capabilities ?? (await rootClient.core.getCapabilities()).ocs!.data!).version!.major! == 24;
}

// ignore: public_member_api_docs
extension NewsVersionSupported on NewsClient {
  /// Checks if the app on the server is supported by the client
  Future<bool> isSupported() async {
    final versions = await getSupportedApiVersions();
    return versions.apiLevels!.contains('v1-2');
  }
}

// ignore: public_member_api_docs
extension NotesVersionSupported on NotesClient {
  /// Checks if the app on the server is supported by the client
  Future<bool> isSupported([final CoreServerCapabilitiesOcsData? capabilities]) async =>
      (capabilities ?? (await rootClient.core.getCapabilities()).ocs!.data!)
          .capabilities!
          .notes!
          .apiVersion!
          .map(Version.parse)
          .where((final version) => version.major == 1)
          .isNotEmpty;
}

// Notifications, ProvisioningApi, UserStatus and Webdav are shipped with the Nextcloud server, so their supported versions depend on the major version of the Nextcloud instance.
