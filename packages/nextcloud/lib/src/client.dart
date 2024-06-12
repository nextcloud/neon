import 'package:built_collection/built_collection.dart';
import 'package:cookie_jar/cookie_jar.dart' as cookie_jar;
import 'package:dynamite_runtime/http_client.dart';
import 'package:http/http.dart' as http;
import 'package:nextcloud/src/interceptors/base_header_interceptor.dart';
import 'package:nextcloud/src/interceptors/cookie_interceptor.dart';
import 'package:nextcloud/src/interceptors/http_interceptor.dart';
import 'package:universal_io/io.dart';

/// A  [HttpInterceptor] for the [NextcloudClient];
typedef NextCloudInterceptor = HttpInterceptor<http.BaseRequest, http.StreamedResponse>;

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
    super.httpClient,
    cookie_jar.CookieJar? cookieJar,
    Iterable<NextCloudInterceptor>? interceptors,
  })  : _interceptors = BuiltList.build((builder) {
          if (interceptors != null) {
            builder.addAll(interceptors);
          }

          if (cookieJar != null) {
            builder.add(
              CookieJarInterceptor(cookieJar: cookieJar),
            );
          }

          // Adding last to not overwrite request headers to avoid invalid requests.
          if (userAgent != null) {
            builder.add(
              BaseHeaderInterceptor(
                baseHeaders: {
                  HttpHeaders.userAgentHeader: userAgent,
                },
              ),
            );
          }
        }),
        super(
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

  final BuiltList<NextCloudInterceptor> _interceptors;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (_interceptors.isNotEmpty) {
      return _sendIntercepted(request);
    }

    return httpClient.send(request);
  }

  Future<http.StreamedResponse> _sendIntercepted(http.BaseRequest request) async {
    var interceptedRequest = request;
    for (final interceptor in _interceptors) {
      if (interceptor.shouldInterceptRequest()) {
        interceptedRequest = await interceptor.interceptRequest(
          request: interceptedRequest,
        );
      }
    }

    var interceptedResponse = await httpClient.send(interceptedRequest);
    for (final interceptor in _interceptors) {
      if (interceptor.shouldInterceptResponse()) {
        interceptedResponse = await interceptor.interceptResponse(
          response: interceptedResponse,
        );
      }
    }

    return interceptedResponse;
  }
}
