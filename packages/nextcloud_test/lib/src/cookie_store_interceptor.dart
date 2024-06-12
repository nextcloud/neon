import 'dart:async';

import 'package:cookie_store/cookie_store.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:nextcloud/utils.dart';
import 'package:universal_io/io.dart';

/// A HttpInterceptor persisting cookies in the provided [cookieStore].
@internal
final class CookieStoreInterceptor<S extends http.BaseRequest, T extends http.BaseResponse>
    extends CookieInterceptor<S, T> {
  /// Creates a new interceptor persisting cookies.
  CookieStoreInterceptor({
    required this.cookieStore,
  });

  /// The optional cookie jar to persist the response cookies.
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
