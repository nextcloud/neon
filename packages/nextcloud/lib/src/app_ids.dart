// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:nextcloud/comments.dart' as _comments;
import 'package:nextcloud/cookbook.dart' as _cookbook;
import 'package:nextcloud/core.dart' as _core;
import 'package:nextcloud/dashboard.dart' as _dashboard;
import 'package:nextcloud/dav.dart' as _dav;
import 'package:nextcloud/drop_account.dart' as _drop_account;
import 'package:nextcloud/files.dart' as _files;
import 'package:nextcloud/files_external.dart' as _files_external;
import 'package:nextcloud/files_reminders.dart' as _files_reminders;
import 'package:nextcloud/files_sharing.dart' as _files_sharing;
import 'package:nextcloud/files_trashbin.dart' as _files_trashbin;
import 'package:nextcloud/files_versions.dart' as _files_versions;
import 'package:nextcloud/news.dart' as _news;
import 'package:nextcloud/notes.dart' as _notes;
import 'package:nextcloud/notifications.dart' as _notifications;
import 'package:nextcloud/provisioning_api.dart' as _provisioning_api;
import 'package:nextcloud/settings.dart' as _settings;
import 'package:nextcloud/sharebymail.dart' as _sharebymail;
import 'package:nextcloud/spreed.dart' as _spreed;
import 'package:nextcloud/systemtags.dart' as _systemtags;
import 'package:nextcloud/tables.dart' as _tables;
import 'package:nextcloud/theming.dart' as _theming;
import 'package:nextcloud/updatenotification.dart' as _updatenotification;
import 'package:nextcloud/uppush.dart' as _uppush;
import 'package:nextcloud/user_ldap.dart' as _user_ldap;
import 'package:nextcloud/user_status.dart' as _user_status;
import 'package:nextcloud/weather_status.dart' as _weather_status;

/// IDs of the apps.
final class AppIDs {
  /// ID for the comments app.
  static const String comments = _comments.appID;

  /// ID for the cookbook app.
  static const String cookbook = _cookbook.appID;

  /// ID for the core app.
  static const String core = _core.appID;

  /// ID for the dashboard app.
  static const String dashboard = _dashboard.appID;

  /// ID for the dav app.
  static const String dav = _dav.appID;

  /// ID for the drop_account app.
  static const String dropAccount = _drop_account.appID;

  /// ID for the files app.
  static const String files = _files.appID;

  /// ID for the files_external app.
  static const String filesExternal = _files_external.appID;

  /// ID for the files_reminders app.
  static const String filesReminders = _files_reminders.appID;

  /// ID for the files_sharing app.
  static const String filesSharing = _files_sharing.appID;

  /// ID for the files_trashbin app.
  static const String filesTrashbin = _files_trashbin.appID;

  /// ID for the files_versions app.
  static const String filesVersions = _files_versions.appID;

  /// ID for the news app.
  static const String news = _news.appID;

  /// ID for the notes app.
  static const String notes = _notes.appID;

  /// ID for the notifications app.
  static const String notifications = _notifications.appID;

  /// ID for the provisioning_api app.
  static const String provisioningApi = _provisioning_api.appID;

  /// ID for the settings app.
  static const String settings = _settings.appID;

  /// ID for the sharebymail app.
  static const String sharebymail = _sharebymail.appID;

  /// ID for the spreed app.
  static const String spreed = _spreed.appID;

  /// ID for the systemtags app.
  static const String systemtags = _systemtags.appID;

  /// ID for the tables app.
  static const String tables = _tables.appID;

  /// ID for the theming app.
  static const String theming = _theming.appID;

  /// ID for the updatenotification app.
  static const String updatenotification = _updatenotification.appID;

  /// ID for the uppush app.
  static const String uppush = _uppush.appID;

  /// ID for the user_ldap app.
  static const String userLdap = _user_ldap.appID;

  /// ID for the user_status app.
  static const String userStatus = _user_status.appID;

  /// ID for the weather_status app.
  static const String weatherStatus = _weather_status.appID;
}
