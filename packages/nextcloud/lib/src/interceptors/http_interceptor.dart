import 'dart:async';

import 'package:http/http.dart' as http;

/// Interceptor that can manipulate http requests and responses.
abstract interface class HttpInterceptor<S extends http.BaseRequest, T extends http.BaseResponse> {
  /// Whether this interceptor should intercept requests.
  bool shouldInterceptRequest();

  /// Intercepts the given [request].
  ///
  /// Provided requests are not finalized yet. It is an error for an interceptor
  /// to request itself.
  FutureOr<S> interceptRequest({required S request});

  /// Whether this interceptor should intercept response.
  bool shouldInterceptResponse();

  /// Intercepts the given [response].
  FutureOr<T> interceptResponse({required T response});
}
