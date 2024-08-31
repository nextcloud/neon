import 'dart:async';

import 'package:http/http.dart' as http;

/// Interceptor that can manipulate http requests and responses.
abstract interface class HttpInterceptor {
  /// Whether this interceptor should intercept requests.
  bool shouldInterceptRequest(http.BaseRequest request);

  /// Intercepts the given [request].
  ///
  /// Provided requests are not finalized yet. It is an error for an interceptor
  /// to finalize it by executing them.
  ///
  /// Exceptions might be thrown during interception.
  /// If the exception is an [http.ClientException] it will be thrown as is,
  /// otherwise it wrapped as an `InterceptionException`.
  FutureOr<http.BaseRequest> interceptRequest({required http.BaseRequest request});

  /// Whether this interceptor should intercept response.
  bool shouldInterceptResponse(http.StreamedResponse response);

  /// Intercepts the given [response].
  ///
  /// Until package:http 2.0 makes [http.BaseResponseWithUrl] mandatory the request url is used.
  ///
  /// Exceptions might be thrown during interception.
  /// If the exception is an [http.ClientException] it will be thrown as is,
  /// otherwise it wrapped as an `InterceptionException`.
  FutureOr<http.StreamedResponse> interceptResponse({
    required http.StreamedResponse response,
    required Uri url,
  });
}
