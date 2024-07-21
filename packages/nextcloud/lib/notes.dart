// coverage:ignore-file
import 'package:nextcloud/src/api/notes/notes.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'src/api/notes/notes.openapi.dart';
export 'src/api/notes/notes_helpers.dart';

// ignore: public_member_api_docs
extension NotesExtension on NextcloudClient {
  static final _notes = Expando<$Client>();

  /// Client for the notes APIs
  $Client get notes => _notes[this] ??= $Client.fromClient(this);
}
