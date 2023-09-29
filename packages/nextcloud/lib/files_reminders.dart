import 'package:nextcloud/src/api/files_reminders.openapi.dart';
import 'package:nextcloud/src/client.dart';

export 'src/api/files_reminders.openapi.dart';

// ignore: public_member_api_docs
extension FilesRemindersExtension on NextcloudClient {
  static final _filesReminders = Expando<FilesRemindersClient>();

  /// Client for the files_reminders APIs
  FilesRemindersClient get filesReminders => _filesReminders[this] ??= FilesRemindersClient.fromClient(this);
}
