import 'package:cookie_jar/cookie_jar.dart' as cookie_jar;
import 'package:dynamite_runtime/http_client.dart';
import 'package:http/http.dart' as http;
import 'package:nextcloud/src/utils/cookie_jar_client.dart';
import 'package:universal_io/io.dart';

/// A client configuring the clients for all Nextcloud APIs.
///
/// To access the APIs of a particular app import the extensions through `package:nextcloud/{id}.dart`.
class NextcloudClient extends DynamiteClient with http.BaseClient {
  /// Creates a new Nextcloud API client.
  ///
  /// [baseURL] has to point to the Nextcloud server webroot.
  ///
  /// To access authenticated endpoints [loginName] and one of [password] or [appPassword] have to be set.
  /// Note that not all endpoints can be access by using only the [password], so it is preferred to set the [appPassword] instead.
  /// [loginName] can be any user identifier like the username or the e-mail.
  ///
  /// It is good practice to set the [userAgent] to allow server admins to identify clients.
  /// A custom HTTP client can be provided through [httpClient].
  /// Additionally a [cookieJar] can be specified to save cookies across requests.
  /// Some endpoints require the use of a cookies persistence.
  NextcloudClient(
    super.baseURL, {
    String? loginName,
    String? password,
    String? appPassword,
    String? userAgent,
    http.Client? httpClient,
    cookie_jar.CookieJar? cookieJar,
  }) : super(
          httpClient: CookieJarClient(
            httpClient: httpClient,
            cookieJar: cookieJar,
            baseHeaders: {
              if (userAgent != null) HttpHeaders.userAgentHeader: userAgent,
            },
          ),
          authentications: [
            if (appPassword != null)
              DynamiteHttpBearerAuthentication(
                token: appPassword,
              ),
            if (loginName != null && (password ?? appPassword) != null)
              DynamiteHttpBasicAuthentication(
                username: loginName,
                password: (password ?? appPassword)!,
              ),
          ],
        );

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) => httpClient.send(request);
}
