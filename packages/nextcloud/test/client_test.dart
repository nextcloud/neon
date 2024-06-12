// ignore_for_file: discarded_futures

import 'package:cookie_jar/cookie_jar.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nextcloud/src/client.dart';
import 'package:nextcloud/utils.dart';
import 'package:test/test.dart';

class _MockInterceptor extends Mock implements HttpInterceptor<BaseRequest, StreamedResponse> {}

void main() {
  final uri = Uri.parse('http://example.com');
  group(NextcloudClient, () {
    group('interceptors', () {
      final fakeRequest = Request('PUT', uri);
      final fakeResponse = StreamedResponse(const Stream.empty(), 200);

      final mockedClient = MockClient((request) async {
        return Response.fromStream(fakeResponse);
      });
      late NextCloudInterceptor interceptor;
      late NextcloudClient client;

      setUpAll(() {
        registerFallbackValue(fakeResponse);
        registerFallbackValue(fakeRequest);
      });

      setUp(() {
        interceptor = _MockInterceptor();

        client = NextcloudClient(
          uri,
          httpClient: mockedClient,
          interceptors: [interceptor],
        );
      });

      test('does not intercept', () async {
        when(() => interceptor.shouldInterceptRequest()).thenReturn(false);
        when(() => interceptor.shouldInterceptResponse()).thenReturn(false);

        final request = Request('GET', uri);
        await client.send(request);

        verifyNever(() => interceptor.interceptRequest(request: any(named: 'request', that: equals(request))));
        verifyNever(() => interceptor.interceptResponse(response: any(named: 'response', that: equals(fakeResponse))));
      });

      test('does intercept', () async {
        when(() => interceptor.shouldInterceptRequest()).thenReturn(true);
        when(() => interceptor.shouldInterceptResponse()).thenReturn(true);
        when(
          () => interceptor.interceptRequest(request: any(named: 'request')),
        ).thenReturn(fakeRequest);
        when(
          () => interceptor.interceptResponse(response: any(named: 'response')),
        ).thenReturn(fakeResponse);

        final request = Request('GET', uri);
        await client.send(request);

        verify(
          () => interceptor.interceptRequest(
            request: any(named: 'request', that: equals(request)),
          ),
        ).called(1);
        verify(
          () => interceptor.interceptResponse(
            response: any(named: 'response'),
          ),
        ).called(1);
      });
    });

    group('Cookies', () {
      late CookieJar cookieJar;
      setUp(() {
        cookieJar = CookieJar();
      });

      test('Cookies', () async {
        final mockedClient = MockClient((request) async {
          expect(request.headers['cookie'], equals('a=b; a2=b2; a3=b3'));

          return Response(
            '',
            200,
            headers: {
              'set-cookie': Cookie('c', 'd').toString(),
            },
          );
        });

        final client = NextcloudClient(
          uri,
          httpClient: mockedClient,
          cookieJar: cookieJar,
        );

        await cookieJar.saveFromResponse(uri, [
          Cookie('a', 'b'),
          Cookie('a2', 'b2'),
          Cookie('a3', 'b3'),
        ]);
        await client.get(uri);

        final cookies = await cookieJar.loadForRequest(uri);
        expect(cookies, hasLength(4));
        expect(cookies[0].name, 'a');
        expect(cookies[0].value, 'b');
        expect(cookies.last.name, 'c');
        expect(cookies.last.value, 'd');
      });

      test('No cookies', () async {
        final mockedClient = MockClient((request) async {
          expect(request.headers['cookie'], isNull);
          return Response('', 200);
        });

        final client = NextcloudClient(
          uri,
          httpClient: mockedClient,
          cookieJar: cookieJar,
        );

        await client.get(uri);
      });
    });

    group('headers', () {
      test('raw request base headers', () async {
        final mockedClient = MockClient((request) async {
          expect(
            request.headers,
            equals({
              'user-agent': 'Neon',
            }),
          );

          return Response(
            '',
            200,
          );
        });

        final client = NextcloudClient(
          uri,
          httpClient: mockedClient,
          userAgent: 'Neon',
        );

        await client.get(uri);
      });

      test('request overwrites base headers', () async {
        final mockedClient = MockClient((request) async {
          expect(
            request.headers,
            equals({
              'user-agent': 'Cookbook',
            }),
          );

          return Response(
            '',
            200,
          );
        });

        final client = NextcloudClient(
          uri,
          httpClient: mockedClient,
          userAgent: 'Neon',
        );

        await client.get(
          uri,
          headers: {
            'user-agent': 'Cookbook',
          },
        );
      });
    });
  });
}
