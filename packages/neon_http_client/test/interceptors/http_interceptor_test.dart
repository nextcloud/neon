import 'package:http/http.dart' as http;
import 'package:neon_http_client/src/interceptors/http_interceptor.dart';
import 'package:test/test.dart';

class _TestHttpInterceptor implements HttpInterceptor {
  @override
  http.BaseRequest interceptRequest({required http.BaseRequest request}) {
    throw UnimplementedError();
  }

  @override
  http.StreamedResponse interceptResponse({
    required http.StreamedResponse response,
    required Uri url,
  }) {
    throw UnimplementedError();
  }

  @override
  bool shouldInterceptRequest(http.BaseRequest request) => throw UnimplementedError();

  @override
  bool shouldInterceptResponse(http.StreamedResponse response) => throw UnimplementedError();
}

void main() {
  group('HttpInterceptor', () {
    test('can be implemented', () {
      expect(_TestHttpInterceptor(), isNotNull);
    });
  });
}
