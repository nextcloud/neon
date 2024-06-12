import 'dart:async';

import 'package:cookie_jar/cookie_jar.dart' as cookie_jar;
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:nextcloud/src/interceptors/http_interceptor.dart';
import 'package:universal_io/io.dart';

/// A HttpInterceptor to implement cookie persisting interceptors.
abstract class CookieInterceptor<S extends http.BaseRequest, T extends http.BaseResponse>
    implements HttpInterceptor<S, T> {
  @override
  bool shouldInterceptRequest() => true;

  @override
  Future<S> interceptRequest({required S request}) async {
    final cookies = await loadForRequest(request.url);
    if (cookies.isNotEmpty) {
      final buffer = StringBuffer();
      final iterator = cookies.iterator..moveNext();

      while (true) {
        final cookie = iterator.current;

        buffer
          ..write(cookie.name)
          ..write('=')
          ..write(cookie.value);

        if (iterator.moveNext()) {
          buffer.write('; ');
        } else {
          break;
        }
      }

      request.headers['cookie'] = buffer.toString();
    }

    return request;
  }

  @override
  bool shouldInterceptResponse() => true;

  @override
  Future<T> interceptResponse({required T response}) async {
    final cookieHeader = response.headersSplitValues['Set-Cookie'];
    if (cookieHeader != null) {
      final url = response.request?.url;
      if (url == null) {
        throw http.ClientException('Response does not contain any url. Cookies are ignored.');
      }

      final cookies = cookieHeader.map(Cookie.fromSetCookieValue).toList();
      await saveFromResponse(url, cookies);
    }

    return response;
  }

  /// Load the cookies for specified [uri].
  FutureOr<List<Cookie>> loadForRequest(Uri uri);

  /// Save the [cookies] for specified [uri].
  FutureOr<void> saveFromResponse(Uri uri, List<Cookie> cookies);
}

/// A HttpInterceptor persisting cookies in the provided [cookieJar].
@internal
final class CookieJarInterceptor<S extends http.BaseRequest, T extends http.BaseResponse>
    extends CookieInterceptor<S, T> {
  /// Creates a new interceptor persisting cookies.
  CookieJarInterceptor({
    required this.cookieJar,
  });

  /// The optional cookie jar to persist the response cookies.
  final cookie_jar.CookieJar cookieJar;

  @override
  Future<List<Cookie>> loadForRequest(Uri uri) {
    return cookieJar.loadForRequest(uri);
  }

  @override
  Future<void> saveFromResponse(Uri uri, List<Cookie> cookies) {
    return cookieJar.saveFromResponse(uri, cookies);
  }
}
