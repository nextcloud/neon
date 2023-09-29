import 'package:collection/collection.dart';
import 'package:nextcloud/src/api/core.openapi.dart';
import 'package:nextcloud/src/api/notes.openapi.dart';
import 'package:version/version.dart';

/// API version of the notes app supported
const notesSupportedVersion = 1;

// ignore: public_member_api_docs
extension NotesVersionSupported on NotesClient {
  /// Check if the notes app version is supported by this client
  ///
  /// Also returns the supported API version number
  (bool, int) isSupported(final CoreOcsGetCapabilitiesResponseApplicationJson_Ocs_Data capabilities) => (
        capabilities.capabilities.notesCapabilities?.notes.apiVersion
                ?.map(Version.parse)
                .firstWhereOrNull((final version) => version.major == notesSupportedVersion) !=
            null,
        notesSupportedVersion,
      );
}
