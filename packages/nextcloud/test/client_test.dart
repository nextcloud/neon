import 'package:cookie_jar/cookie_jar.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:nextcloud/src/client.dart';
import 'package:test/test.dart';

void main() {
  final uri = Uri.parse('http://example.com');
  group(NextcloudClient, () {
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
