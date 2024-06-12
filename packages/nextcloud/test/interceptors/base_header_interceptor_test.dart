import 'package:http/http.dart' as http;
import 'package:nextcloud/src/interceptors/base_header_interceptor.dart';
import 'package:test/test.dart';

void main() {
  group('BaseHeaderInterceptor', () {
    test('adds headers to intercepted request ', () {
      const interceptor = BaseHeaderInterceptor(baseHeaders: {'KEY': 'VALUE'});

      final request = http.Request('GET', Uri());

      expect(interceptor.shouldInterceptRequest(), isTrue);
      expect(interceptor.interceptRequest(request: request).headers, equals({'KEY': 'VALUE'}));
    });

    test('does not override existing headers', () {
      const interceptor = BaseHeaderInterceptor(baseHeaders: {'KEY': 'VALUE'});

      final request = http.Request('GET', Uri())..headers['KEY'] = 'NO-VALUE';

      expect(interceptor.shouldInterceptRequest(), isTrue);
      expect(interceptor.interceptRequest(request: request).headers, equals({'KEY': 'NO-VALUE'}));
    });

    test('does not intercept response', () {
      const interceptor = BaseHeaderInterceptor();

      expect(interceptor.shouldInterceptResponse(), isFalse);
      expect(
        () => interceptor.interceptResponse(response: http.Response('', 200)),
        throwsUnsupportedError,
      );
    });
  });
}
