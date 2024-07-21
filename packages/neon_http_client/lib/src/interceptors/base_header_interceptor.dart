import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:neon_http_client/src/interceptors/http_interceptor.dart';

/// A HttpInterceptor that adds the given [baseHeaders] to a request.
///
/// The headers of a request will override any header in the `baseHeaders`.
@internal
final class BaseHeaderInterceptor implements HttpInterceptor {
  /// Creates a new base header interceptor.
  const BaseHeaderInterceptor({
    this.baseHeaders,
  });

  /// The base headers added to each request.
  final Map<String, String>? baseHeaders;

  @override
  bool shouldInterceptRequest(http.BaseRequest request) {
    return baseHeaders != null && baseHeaders!.isNotEmpty;
  }

  @override
  http.BaseRequest interceptRequest({required http.BaseRequest request}) {
    baseHeaders?.forEach((key, value) {
      request.headers.putIfAbsent(key, () => value);
    });

    return request;
  }

  @override
  bool shouldInterceptResponse(http.StreamedResponse response) => false;

  @override
  Never interceptResponse({required http.StreamedResponse response, required Uri url}) {
    throw UnsupportedError('Base headers can not be added to a response.');
  }
}
