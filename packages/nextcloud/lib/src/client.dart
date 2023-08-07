import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/content_string.dart';
import 'package:nextcloud/src/api/core.openapi.dart';
import 'package:nextcloud/src/api/files_sharing.openapi.dart';
import 'package:nextcloud/src/api/news.openapi.dart';
import 'package:nextcloud/src/api/notes.openapi.dart';
import 'package:nextcloud/src/api/notifications.openapi.dart';
import 'package:nextcloud/src/api/provisioning_api.openapi.dart';
import 'package:nextcloud/src/api/settings.openapi.dart';
import 'package:nextcloud/src/api/theming.openapi.dart';
import 'package:nextcloud/src/api/uppush.openapi.dart';
import 'package:nextcloud/src/api/user_status.openapi.dart';
import 'package:nextcloud/src/app_type.dart';
import 'package:nextcloud/src/webdav/client.dart';

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
          baseHeaders: (<String, String?>{
            'Accept-Language': language,
          }..removeWhere((final _, final value) => value == null))
              .cast<String, String>(),
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
  CoreClient? _core;
  FilesSharingClient? _filesSharing;
  NewsClient? _news;
  NotesClient? _notes;
  NotificationsClient? _notifications;
  ProvisioningApiClient? _provisioningApi;
  SettingsClient? _settings;
  ThemingClient? _theming;
  UppushClient? _uppush;
  UserStatusClient? _userStatus;

  /// Client for WebDAV
  WebDavClient get webdav => _webdav ??= WebDavClient(this);

  /// Client for the core APIs
  CoreClient get core => _core ??= CoreClient.fromClient(this);

  /// Client for the files sharing APIs
  FilesSharingClient get filesSharing => _filesSharing ??= FilesSharingClient.fromClient(this);

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

  /// Client for the uppush app APIs
  UppushClient get uppush => _uppush ??= UppushClient.fromClient(this);

  /// Client for the user status APIs
  UserStatusClient get userStatus => _userStatus ??= UserStatusClient.fromClient(this);
}

// coverage:ignore-start

// ignore: public_member_api_docs
final serializers = Serializers.merge([
  coreSerializers,
  newsSerializers,
  notesSerializers,
  notificationsSerializers,
  provisioningApiSerializers,
  uppushSerializers,
  userStatusSerializers,
]);

// ignore: public_member_api_docs
final Serializers jsonSerializers = (serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();

// ignore: public_member_api_docs
T deserializeNextcloud<T>(final Object data) => serializers.deserialize(data, specifiedType: FullType(T))! as T;

// ignore: public_member_api_docs
Object? serializeNextcloud<T>(final T data) => serializers.serialize(data, specifiedType: FullType(T));

// coverage:ignore-end
