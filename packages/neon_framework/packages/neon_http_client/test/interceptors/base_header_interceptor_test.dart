import 'package:http/http.dart' as http;
import 'package:neon_http_client/src/interceptors/base_header_interceptor.dart';
import 'package:test/test.dart';

void main() {
  group('BaseHeaderInterceptor', () {
    test('adds headers to intercepted request ', () {
      const interceptor = BaseHeaderInterceptor(baseHeaders: {'KEY': 'VALUE'});

      final request = http.Request('GET', Uri());

      expect(interceptor.shouldInterceptRequest(request), isTrue);
      expect(interceptor.interceptRequest(request: request).headers, equals({'KEY': 'VALUE'}));
    });

    test('does not override existing headers', () {
      const interceptor = BaseHeaderInterceptor(baseHeaders: {'KEY': 'VALUE'});

      final request = http.Request('GET', Uri())..headers['KEY'] = 'NO-VALUE';

      expect(interceptor.shouldInterceptRequest(request), isTrue);
      expect(interceptor.interceptRequest(request: request).headers, equals({'KEY': 'NO-VALUE'}));
    });

    test('does not intercept response', () {
      const interceptor = BaseHeaderInterceptor();

      final response = http.StreamedResponse(const Stream.empty(), 200);

      expect(interceptor.shouldInterceptResponse(response), isFalse);
      expect(
        () => interceptor.interceptResponse(response: response, url: Uri()),
        throwsUnsupportedError,
      );
    });
  });
}
