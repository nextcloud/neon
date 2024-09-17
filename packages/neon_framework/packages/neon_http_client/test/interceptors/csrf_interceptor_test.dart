import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_http_client/src/interceptors/csrf_interceptor.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:test/test.dart';

class _FakeClient extends Fake implements Client {}

void main() {
  group('CSRFInterceptor', () {
    test('does intercept requests to the webdav endpoint', () {
      final interceptor = CSRFInterceptor(
        client: _FakeClient(),
        baseURL: Uri.https('example.com', '/nextcloud'),
      );

      final request = Request('GET', Uri.https('example.com', '/nextcloud/remote.php/webdav'));

      expect(interceptor.shouldInterceptRequest(request), isTrue);
    });

    test('does not intercept requests to non webdav endpoints', () async {
      final interceptor = CSRFInterceptor(
        client: _FakeClient(),
        baseURL: Uri.https('example.com', '/nextcloud'),
      );

      var request = Request('GET', Uri.https('example.com', '/remote.php/webdav'));
      expect(interceptor.shouldInterceptRequest(request), isFalse);
      expect(
        () => interceptor.interceptRequest(request: request),
        throwsA(isA<AssertionError>()),
      );

      request = Request('GET', Uri.https('other-example.com', '/nextcloud/remote.php/webdav'));
      expect(interceptor.shouldInterceptRequest(request), isFalse);
      expect(
        () => interceptor.interceptRequest(request: request),
        throwsA(isA<AssertionError>()),
      );
    });

    test('does intercept requests to non webdav endpoints', () {
      final interceptor = CSRFInterceptor(
        client: _FakeClient(),
        baseURL: Uri.https('example.com', '/nextcloud'),
      );

      var request = Request('GET', Uri.https('example.com', '/remote.php/webdav'));
      expect(interceptor.shouldInterceptRequest(request), isFalse);

      request = Request('GET', Uri.https('other-example.com', '/nextcloud/remote.php/webdav'));
      expect(interceptor.shouldInterceptRequest(request), isFalse);
    });

    test('requests and attaches a new token', () async {
      final mockedClient = MockClient((request) async {
        return Response('{"token":"token"}', 200);
      });

      final interceptor = CSRFInterceptor(
        client: mockedClient,
        baseURL: Uri.https('example.com', '/nextcloud'),
      );

      final request = Request('GET', Uri.https('example.com', '/nextcloud/remote.php/webdav'));

      await interceptor.interceptRequest(request: request);

      expect(
        request.headers,
        equals({
          'OCS-APIRequest': 'true',
          'requesttoken': 'token',
        }),
      );
      expect(interceptor.token, equals('token'));
    });

    test('attaches cached token', () async {
      final interceptor = CSRFInterceptor(
        client: _FakeClient(),
        baseURL: Uri.https('example.com', '/nextcloud'),
      )..token = 'token';

      final request = Request('GET', Uri.https('example.com', '/nextcloud/remote.php/webdav'));

      await interceptor.interceptRequest(request: request);

      expect(
        request.headers,
        equals({
          'OCS-APIRequest': 'true',
          'requesttoken': 'token',
        }),
      );
      expect(interceptor.token, equals('token'));
    });

    test('throws DynamiteStatusCodeException when token request status code >=300', () async {
      final mockedClient = MockClient((request) async {
        return Response('', 404);
      });

      final interceptor = CSRFInterceptor(
        client: mockedClient,
        baseURL: Uri.https('example.com', '/nextcloud'),
      );

      final request = Request('GET', Uri.https('example.com', '/nextcloud/remote.php/webdav'));

      expect(
        interceptor.interceptRequest(request: request),
        throwsA(isA<DynamiteStatusCodeException>()),
      );
    });

    test('does intercept response with 401 response', () async {
      final interceptor = CSRFInterceptor(
        client: _FakeClient(),
        baseURL: Uri.https('example.com', '/nextcloud'),
      );

      final response = StreamedResponse(const Stream.empty(), 401);
      expect(interceptor.shouldInterceptResponse(response), isTrue);
    });

    test('does not intercept response with non 401 response', () {
      final interceptor = CSRFInterceptor(
        client: _FakeClient(),
        baseURL: Uri.https('example.com', '/nextcloud'),
      );

      final response = StreamedResponse(const Stream.empty(), 200);
      expect(interceptor.shouldInterceptResponse(response), isFalse);
      expect(
        () => interceptor.interceptResponse(response: response, url: Uri()),
        throwsA(isA<AssertionError>()),
      );
    });

    test('clears token on with a 401 ', () {
      final interceptor = CSRFInterceptor(
        client: _FakeClient(),
        baseURL: Uri.https('example.com', '/nextcloud'),
      );

      final response = StreamedResponse(const Stream.empty(), 401);
      expect(
        interceptor.interceptResponse(response: response, url: Uri()),
        equals(response),
      );
      expect(
        interceptor.token,
        isNull,
      );
    });
  });
}
