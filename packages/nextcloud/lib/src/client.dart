import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/content_string.dart';
import 'package:nextcloud/src/api/core.openapi.dart';
import 'package:nextcloud/src/api/news.openapi.dart';
import 'package:nextcloud/src/api/notes.openapi.dart';
import 'package:nextcloud/src/api/notifications.openapi.dart';
import 'package:nextcloud/src/api/provisioning_api.openapi.dart';
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
    this.username,
    final String? password,
    final String? language,
    final AppType appType = AppType.unknown,
    final String? userAgentOverride,
    super.cookieJar,
  })  : assert(loginName != null || username == null, 'Provide loginName instead of username or both'),
        super(
          baseHeaders: (<String, String?>{
            'OCS-APIRequest': 'true',
            'Accept-Language': language,
          }..removeWhere((final _, final value) => value == null))
              .cast<String, String>(),
          userAgent: userAgentOverride ?? appType.userAgent,
          authentications: [
            if (loginName != null && password != null) ...[
              DynamiteHttpBasicAuthentication(
                username: loginName,
                password: password,
              ),
            ],
          ],
        );

  /// Identifier used for authentication. This can be the username or email or something else.
  final String? loginName;

  /// Username of the user on the server, it needs to be set for using WebDAV.
  /// It can be obtained via the
  final String? username;

  WebDavClient? _webdav;

  /// Client for WebDAV. Username needs to be set in order to use it
  WebDavClient get webdav {
    if (_webdav != null) {
      return _webdav!;
    }
    if (username == null) {
      throw Exception('The WebDAV client is only available when a username is set');
    }

    return _webdav = WebDavClient(
      this,
      '/remote.php/dav/files/$username',
    );
  }

  CoreClient? _core;
  NewsClient? _news;
  NotesClient? _notes;
  NotificationsClient? _notifications;
  ProvisioningApiClient? _provisioningApi;
  UppushClient? _uppush;
  UserStatusClient? _userStatus;

  /// Client for the core APIs
  CoreClient get core => _core ??= CoreClient.fromClient(this);

  /// Client for the news app APIs
  NewsClient get news => _news ??= NewsClient.fromClient(this);

  /// Client for the notes app APIs
  NotesClient get notes => _notes ??= NotesClient.fromClient(this);

  /// Client for the notifications app APIs
  NotificationsClient get notifications => _notifications ??= NotificationsClient.fromClient(this);

  /// Client for the provisioning APIs
  ProvisioningApiClient get provisioningApi => _provisioningApi ??= ProvisioningApiClient.fromClient(this);

  /// Client for the uppush app APIs
  UppushClient get uppush => _uppush ??= UppushClient.fromClient(this);

  /// Client for the user status APIs
  UserStatusClient get userStatus => _userStatus ??= UserStatusClient.fromClient(this);
}

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
