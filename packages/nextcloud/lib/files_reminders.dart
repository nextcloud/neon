import 'package:nextcloud/src/api/files_reminders/files_reminders.openapi.dart';
import 'package:nextcloud/src/nextcloud_client.dart';

export 'package:nextcloud/src/api/files_reminders/files_reminders.openapi.dart';

/// Client for the files_reminders APIs.
extension FilesRemindersExtension on NextcloudClient {
  static final _filesReminders = Expando<$Client>();

  /// Client for the files_reminders APIs.
  $Client get filesReminders => _filesReminders[this] ??= $Client.fromClient(this);
}
