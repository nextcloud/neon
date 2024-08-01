import 'package:nextcloud/src/api/notes/notes.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'package:nextcloud/src/api/notes/notes.openapi.dart';
export 'package:nextcloud/src/api/notes/notes_helpers.dart';

/// Client for the notes APIs.
extension NotesExtension on NextcloudClient {
  static final _notes = Expando<$Client>();

  /// Client for the notes APIs.
  $Client get notes => _notes[this] ??= $Client.fromClient(this);
}
