import 'dart:async';

import 'package:cookie_store/cookie_store.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:neon_http_client/src/interceptors/http_interceptor.dart';
import 'package:universal_io/io.dart';

/// A HttpInterceptor to implement cookie persisting interceptors.
///
/// If the request already contains a 'cookie' header the request will not be intercepted.
@immutable
abstract class CookieInterceptor implements HttpInterceptor {
  /// Creates a new cookie interceptor.
  const CookieInterceptor();

  @override
  bool shouldInterceptRequest(http.BaseRequest request) {
    return !request.headers.containsKey(HttpHeaders.cookieHeader);
  }

  @override
  Future<http.BaseRequest> interceptRequest({required http.BaseRequest request}) async {
    assert(
      shouldInterceptRequest(request),
      'Request already contains a cookie header and should not be intercepted.',
    );

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

      request.headers[HttpHeaders.cookieHeader] = buffer.toString();
    }

    return request;
  }

  @override
  bool shouldInterceptResponse(http.StreamedResponse response) {
    return response.headers.containsKey(HttpHeaders.setCookieHeader);
  }

  @override
  Future<http.StreamedResponse> interceptResponse({required http.StreamedResponse response, required Uri url}) async {
    assert(
      shouldInterceptResponse(response),
      'Response should not be intercepted.',
    );

    final cookieHeader = response.headersSplitValues[HttpHeaders.setCookieHeader]!;
    final cookies = cookieHeader.map(Cookie.fromSetCookieValue).toList();
    await saveFromResponse(url, cookies);

    return response;
  }

  /// Load the cookies for specified [uri].
  FutureOr<List<Cookie>> loadForRequest(Uri uri);

  /// Save the [cookies] for specified [uri].
  FutureOr<void> saveFromResponse(Uri uri, List<Cookie> cookies);
}

/// A HttpInterceptor persisting cookies in the provided [cookieStore].
@internal
final class CookieStoreInterceptor extends CookieInterceptor {
  /// Creates a new interceptor persisting cookies.
  const CookieStoreInterceptor({
    required this.cookieStore,
  });

  final CookieStore cookieStore;

  @override
  FutureOr<List<Cookie>> loadForRequest(Uri uri) {
    return cookieStore.loadForRequest(uri);
  }

  @override
  FutureOr<void> saveFromResponse(Uri uri, List<Cookie> cookies) {
    return cookieStore.saveFromResponse(uri, cookies);
  }
}
