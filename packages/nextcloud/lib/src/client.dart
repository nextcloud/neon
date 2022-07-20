import 'package:nextcloud/nextcloud.dart';

// ignore: public_member_api_docs
class NextcloudClient {
  // ignore: public_member_api_docs
  NextcloudClient(
    this.baseURL, {
    this.username,
    this.password,
    this.language,
    this.appType = AppType.unknown,
    this.userAgentOverride,
  }) {
    final authentication = username != null && password != null
        ? HttpBasicAuth(username: username!, password: password!)
        : NoAuthentication();
    _core = NextcloudCoreClient(
      baseURL,
      authentication,
      _addCommonSettings,
    );
    _news = NextcloudNewsClient(
      baseURL,
      authentication,
      _addCommonSettings,
    );
    _notes = NextcloudNotesClient(
      baseURL,
      authentication,
      _addCommonSettings,
    );
    _notifications = NextcloudNotificationsClient(
      baseURL,
      authentication,
      _addCommonSettings,
    );
    _provisioningApi = NextcloudProvisioningApiClient(
      baseURL,
      authentication,
      _addCommonSettings,
    );
    _userStatus = NextcloudUserStatusClient(
      baseURL,
      authentication,
      _addCommonSettings,
    );
    if (username != null) {
      _webdav = NextcloudWebDAVClient(
        baseURL,
        authentication,
        username!,
        commonHeaders,
      );
    }
  }

  /// Headers that should be used for all requests
  late final commonHeaders = <String, String>{
    'OCS-APIRequest': 'true',
    'Accept': 'application/json',
    if (userAgent != null) ...{
      'User-Agent': userAgent!,
    },
  };

  T _addCommonSettings<T extends BaseApiClient>(final T apiClient) {
    var newApiClient = apiClient;
    for (final key in commonHeaders.keys) {
      newApiClient = newApiClient..addDefaultHeader(key, commonHeaders[key]!);
    }

    return newApiClient;
  }

  /// Base URL of the Nextcloud instance this client will connect to.
  final String baseURL;

  /// Username assigned to the client. Can be null, but WebDAV won't work.
  final String? username;

  /// Password of the user assigned to the client;
  final String? password;

  /// Preferred language for the client (not properly respected everywhere yet).
  final String? language;

  /// App type the client will register as. Only relevant for notifications. See [AppType] for explanations.
  final AppType appType;

  /// Overrides the user-agent set by [appType]
  final String? userAgentOverride;

  /// User-agent made up from the user-agent from [userAgentOverride] and the [appType]
  late String? userAgent = userAgentOverride ?? appType.userAgent;

  NextcloudWebDAVClient? _webdav;

  late NextcloudCoreClient _core;
  late NextcloudNewsClient _news;
  late NextcloudNotesClient _notes;
  late NextcloudNotificationsClient _notifications;
  late NextcloudProvisioningApiClient _provisioningApi;
  late NextcloudUserStatusClient _userStatus;

  /// Client for WebDAV. Might be null if no username is set for the client
  NextcloudWebDAVClient get webdav => _getUsernameRequiredClient(_webdav);

  /// Client for Core APIs
  NextcloudCoreClient get core => _core;

  /// Client for Nextcloud News app
  NextcloudNewsClient get news => _news;

  /// Client for Nextcloud Notes app
  NextcloudNotesClient get notes => _notes;

  /// Client for Nextcloud Notifications API
  NextcloudNotificationsClient get notifications => _notifications;

  /// Client for Provisioning APIs
  NextcloudProvisioningApiClient get provisioningApi => _provisioningApi;

  /// Client for User Status
  NextcloudUserStatusClient get userStatus => _userStatus;

  T _getUsernameRequiredClient<T>(final T? t) {
    if (t != null) {
      return t;
    }
    throw Exception('To access this client you need to set the username');
  }
}
