import 'dart:async';
import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart' as cookie_jar;
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:nextcloud/src/interceptors/cookie_interceptor.dart';
import 'package:test/test.dart';
import 'package:universal_io/io.dart';

class _MockCookieJar extends Mock implements cookie_jar.CookieJar {}

void main() {
  group('CookieInterceptor', () {
    late cookie_jar.CookieJar cookieJar;

    setUpAll(() {
      registerFallbackValue(http.Request('PUT', Uri()));
      registerFallbackValue(http.StreamedResponse(const Stream.empty(), 200));
      registerFallbackValue(Uri());
    });

    setUp(() {
      cookieJar = _MockCookieJar();
    });

    test('does add cookies to request', () async {
      final interceptor = CookieJarInterceptor(cookieJar: cookieJar);
      when(() => cookieJar.loadForRequest(any())).thenAnswer((_) async {
        return [
          Cookie('a', 'a2'),
          Cookie('b', 'b2'),
          Cookie('c', 'c2'),
        ];
      });

      final request = http.Request('GET', Uri(host: 'host'));
      final intercepted = await interceptor.interceptRequest(request: request);

      expect(interceptor.shouldInterceptRequest(), isTrue);
      expect(intercepted.headers, equals({'cookie': 'a=a2; b=b2; c=c2'}));

      verify(
        () => cookieJar.loadForRequest(any(that: equals(Uri(host: 'host')))),
      ).called(1);
    });

    test('does store response cookies', () async {
      final interceptor = CookieJarInterceptor(cookieJar: cookieJar);
      when(() => cookieJar.saveFromResponse(any(), any())).thenAnswer((_) async {});

      final response = http.Response(
        '',
        200,
        request: http.Request('GET', Uri(host: 'host')),
        headers: {'Set-Cookie': 'a=a2,b=b2,c=c2'},
      );
      final intercepted = await interceptor.interceptResponse(response: response);

      expect(interceptor.shouldInterceptResponse(), isTrue);
      expect(intercepted.headers, equals({'Set-Cookie': 'a=a2,b=b2,c=c2'}));

      verify(
        () => cookieJar.saveFromResponse(
          any(that: equals(Uri(host: 'host'))),
          any(that: hasLength(3)),
        ),
      ).called(1);
    });

    test('throws when response has a null request', () async {
      final interceptor = CookieJarInterceptor(cookieJar: cookieJar);

      final response = http.Response(
        '',
        200,
        headers: {'Set-Cookie': 'a=a2,b=b2,c=c2'},
      );
      expect(() => interceptor.interceptResponse(response: response), throwsException);
    });
  });
}
