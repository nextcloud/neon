import 'dart:async';
import 'dart:io';

import 'package:cookie_store/cookie_store.dart';
import 'package:http/http.dart' as http;
import 'package:interceptor_http_client/src/interceptors/cookie_interceptor.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class _MockCookieStore extends Mock implements CookieStore {}

void main() {
  group('CookieInterceptor', () {
    late CookieStore cookieStore;
    late CookieStoreInterceptor interceptor;

    setUpAll(() {
      registerFallbackValue(http.Request('PUT', Uri()));
      registerFallbackValue(http.StreamedResponse(const Stream.empty(), 200));
      registerFallbackValue(Uri());
    });

    setUp(() {
      cookieStore = _MockCookieStore();
      interceptor = CookieStoreInterceptor(cookieStore: cookieStore);
    });

    test('does add cookies to request', () async {
      when(() => cookieStore.loadForRequest(any())).thenAnswer((_) async {
        return [
          Cookie('a', 'a2'),
          Cookie('b', 'b2'),
          Cookie('c', 'c2'),
        ];
      });

      final request = http.Request('GET', Uri(host: 'host'));
      expect(interceptor.shouldInterceptRequest(request), isTrue);

      final intercepted = await interceptor.interceptRequest(request: request);
      expect(intercepted.headers, equals({'cookie': 'a=a2; b=b2; c=c2'}));

      verify(
        () => cookieStore.loadForRequest(any(that: equals(Uri(host: 'host')))),
      ).called(1);
    });

    test('does not intercept request with "cookie" header', () async {
      final request = http.Request(
        'GET',
        Uri(host: 'host'),
      )..headers['cookie'] = 'key=value';

      expect(interceptor.shouldInterceptRequest(request), isFalse);

      expect(
        () => interceptor.interceptRequest(request: request),
        throwsA(isA<AssertionError>()),
      );
    });

    test('does store response cookies', () async {
      when(() => cookieStore.saveFromResponse(any(), any())).thenAnswer((_) async {});

      final uri = Uri(host: 'host');
      final response = http.StreamedResponse(
        const Stream.empty(),
        200,
        headers: {'set-cookie': 'a=a2,b=b2,c=c2'},
      );
      expect(interceptor.shouldInterceptResponse(response), isTrue);

      final intercepted = await interceptor.interceptResponse(response: response, url: uri);
      expect(intercepted.headers, equals({'set-cookie': 'a=a2,b=b2,c=c2'}));

      verify(
        () => cookieStore.saveFromResponse(
          any(that: equals(Uri(host: 'host'))),
          any(that: hasLength(3)),
        ),
      ).called(1);
    });

    test('does not intercept responses without "set-cookie" header', () async {
      final response = http.StreamedResponse(
        const Stream.empty(),
        200,
        headers: {'Set-Cookie': 'a=a2,b=b2,c=c2'},
      );
      expect(interceptor.shouldInterceptResponse(response), isFalse);

      expect(
        () => interceptor.interceptResponse(response: response, url: Uri()),
        throwsA(isA<AssertionError>()),
      );
    });
  });
}
