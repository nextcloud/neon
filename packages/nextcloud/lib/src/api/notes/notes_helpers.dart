import 'package:built_collection/built_collection.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud/src/api/notes/notes.openapi.dart' as notes;
import 'package:nextcloud/src/models/models.dart';
import 'package:version/version.dart';

/// Minimum API version of the notes app supported
final minVersion = Version(1, 3, 0);

// ignore: public_member_api_docs
extension NotesVersionCheck on notes.$Client {
  /// Check if the notes app version is supported by this client
  ///
  /// Also returns the supported API version number
  VersionCheck getVersionCheck(core.OcsGetCapabilitiesResponseApplicationJson_Ocs_Data capabilities) {
    final versions = capabilities.capabilities.notesCapabilities?.notes.apiVersion;
    return VersionCheck(
      versions: versions?.map(Version.parse).toBuiltList(),
      minimumVersion: minVersion,
    );
  }
}
