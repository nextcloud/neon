import 'package:nextcloud/nextcloud.dart';

/// Different app types to register for
enum AppType {
  /// Will only receive Talk notifications
  talk('Mozilla/5.0 (Android) Nextcloud-Talk'),

  /// Will receive all notifications except Talk notifications if another Talk
  /// app is already registered for the user
  nextcloud('Mozilla/5.0 (Android) Nextcloud-android'),

  /// Default. Same problem with notifications as the [nextcloud] type
  unknown(null);

  // ignore: public_member_api_docs
  const AppType(this.userAgent);

  // ignore: public_member_api_docs
  final String? userAgent;
}

// ignore: public_member_api_docs
class NextcloudClient extends DynamiteClient {
  // ignore: public_member_api_docs
  NextcloudClient(
    super.baseURL, {
    this.loginName,
    final String? password,
    final String? appPassword,
    final String? language,
    final AppType appType = AppType.unknown,
    final String? userAgentOverride,
    super.cookieJar,
  }) : super(
          baseHeaders: language != null ? {'Accept-Language': language} : null,
          userAgent: userAgentOverride ?? appType.userAgent,
          authentications: [
            if (appPassword != null) ...[
              DynamiteHttpBearerAuthentication(
                token: appPassword,
              ),
            ],
            if (loginName != null && (password ?? appPassword) != null) ...[
              DynamiteHttpBasicAuthentication(
                username: loginName,
                password: (password ?? appPassword)!,
              ),
            ],
          ],
        );

  /// Identifier used for authentication. This can be the username or email or something else.
  final String? loginName;

  WebDavClient? _webdav;
  CommentsClient? _comments;
  CoreClient? _core;
  DashboardClient? _dashboard;
  DavClient? _dav;
  FilesClient? _files;
  FilesExternalClient? _filesExternal;
  FilesRemindersClient? _filesReminders;
  FilesSharingClient? _filesSharing;
  FilesTrashbinClient? _filesTrashbin;
  FilesVersionsClient? _filesVersions;
  NewsClient? _news;
  NotesClient? _notes;
  NotificationsClient? _notifications;
  ProvisioningApiClient? _provisioningApi;
  SettingsClient? _settings;
  ThemingClient? _theming;
  UpdatenotificationClient? _updatenotification;
  UppushClient? _uppush;
  UserStatusClient? _userStatus;
  WeatherStatusClient? _weatherStatus;

  /// Client for WebDAV
  WebDavClient get webdav => _webdav ??= WebDavClient(this);

  /// Client for the comments APIs
  CommentsClient get comments => _comments ??= CommentsClient.fromClient(this);

  /// Client for the core APIs
  CoreClient get core => _core ??= CoreClient.fromClient(this);

  /// Client for the dashboard APIs
  DashboardClient get dashboard => _dashboard ??= DashboardClient.fromClient(this);

  /// Client for the dav APIs
  ///
  /// This client does not expose WebDAV functionality. Use [webdav] instead.
  DavClient get dav => _dav ??= DavClient.fromClient(this);

  /// Client for the files APIs
  FilesClient get files => _files ??= FilesClient.fromClient(this);

  /// Client for the files external APIs
  FilesExternalClient get filesExternal => _filesExternal ??= FilesExternalClient.fromClient(this);

  /// Client for the files reminders APIs
  FilesRemindersClient get filesReminders => _filesReminders ??= FilesRemindersClient.fromClient(this);

  /// Client for the files sharing APIs
  FilesSharingClient get filesSharing => _filesSharing ??= FilesSharingClient.fromClient(this);

  /// Client for the files trashbin APIs
  FilesTrashbinClient get filesTrashbin => _filesTrashbin ??= FilesTrashbinClient.fromClient(this);

  /// Client for the files versions APIs
  FilesVersionsClient get filesVersions => _filesVersions ??= FilesVersionsClient.fromClient(this);

  /// Client for the news app APIs
  NewsClient get news => _news ??= NewsClient.fromClient(this);

  /// Client for the notes app APIs
  NotesClient get notes => _notes ??= NotesClient.fromClient(this);

  /// Client for the notifications app APIs
  NotificationsClient get notifications => _notifications ??= NotificationsClient.fromClient(this);

  /// Client for the provisioning APIs
  ProvisioningApiClient get provisioningApi => _provisioningApi ??= ProvisioningApiClient.fromClient(this);

  /// Client for the settings APIs
  SettingsClient get settings => _settings ??= SettingsClient.fromClient(this);

  /// Client for the theming APIs
  ThemingClient get theming => _theming ??= ThemingClient.fromClient(this);

  /// Client for the updatenotification APIs
  UpdatenotificationClient get updatenotification => _updatenotification ??= UpdatenotificationClient.fromClient(this);

  /// Client for the uppush app APIs
  UppushClient get uppush => _uppush ??= UppushClient.fromClient(this);

  /// Client for the user status APIs
  UserStatusClient get userStatus => _userStatus ??= UserStatusClient.fromClient(this);

  /// Client for the weather status APIs
  WeatherStatusClient get weatherStatus => _weatherStatus ??= WeatherStatusClient.fromClient(this);
}
