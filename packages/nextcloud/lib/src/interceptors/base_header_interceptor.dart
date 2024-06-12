import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:nextcloud/src/interceptors/http_interceptor.dart';

/// A HttpInterceptor that adds the given [baseHeaders] to a request.
///
/// The headers of a request will override any header in the `baseHeaders`.
@internal
final class BaseHeaderInterceptor<S extends http.BaseRequest> implements HttpInterceptor<S, Never> {
  /// Creates a new base header interceptor.
  const BaseHeaderInterceptor({
    this.baseHeaders,
  });

  /// The base headers added to each request.
  final Map<String, String>? baseHeaders;

  @override
  bool shouldInterceptRequest() => true;

  @override
  S interceptRequest({required S request}) {
    baseHeaders?.forEach((key, value) {
      request.headers.putIfAbsent(key, () => value);
    });

    return request;
  }

  @override
  bool shouldInterceptResponse() => false;

  @override
  Never interceptResponse({required http.BaseResponse response}) {
    throw UnsupportedError('Base headers can not be added to responses.');
  }
}
