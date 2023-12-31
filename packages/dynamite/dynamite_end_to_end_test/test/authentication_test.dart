// ignore_for_file: discarded_futures

import 'package:dynamite_end_to_end_test/authentication.openapi.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:universal_io/io.dart';

import 'http_client_mock.mocks.dart';

late MockHttpClient mockHttpClient;

class MockHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) => mockHttpClient;
}

void main() {
  late MockHttpHeaders headers;
  late MockHttpClientResponse response;
  late MockHttpClientRequest request;

  final uri = Uri.parse('example.com');

  const basicAuth = DynamiteHttpBasicAuthentication(
    username: 'bearer-username',
    password: 'bearer-password',
  );

  const bearerAuth = DynamiteHttpBearerAuthentication(
    token: 'bearer-token',
  );

  setUp(() {
    mockHttpClient = MockHttpClient();
    HttpOverrides.global = MockHttpOverrides();

    when(mockHttpClient.openUrl(any, any)).thenAnswer((invocation) {
      headers = MockHttpHeaders();

      response = MockHttpClientResponse();
      when(response.headers).thenReturn(headers);
      when(response.transform<dynamic>(any)).thenAnswer((_) => Stream.value('{}'));
      when(response.statusCode).thenReturn(200);

      request = MockHttpClientRequest();
      when(request.headers).thenReturn(headers);
      when(request.close()).thenAnswer((_) async => response);
      return Future.value(request);
    });
  });

  test('No Authentication', () async {
    // no registered authentications
    var client = $Client(uri, authentications: []);
    await client.noAuthentication();
    var captured = verify(headers.add(captureAny, captureAny)).captured;
    expect(captured, equals(['Accept', 'application/json']));

    // registered basic authentication
    client = $Client(uri, authentications: const [basicAuth]);
    await client.noAuthentication();
    captured = verify(headers.add(captureAny, captureAny)).captured;
    expect(captured, equals(['Accept', 'application/json']));

    // registered bearer authentication
    client = $Client(uri, authentications: const [bearerAuth]);
    await client.noAuthentication();
    captured = verify(headers.add(captureAny, captureAny)).captured;
    expect(captured, equals(['Accept', 'application/json']));

    // multiple registered authentication
    client = $Client(uri, authentications: const [basicAuth, bearerAuth]);
    await client.noAuthentication();
    captured = verify(headers.add(captureAny, captureAny)).captured;
    expect(captured, equals(['Accept', 'application/json']));
  });

  test('Basic authentication', () async {
    // no registered authentications
    var client = $Client(uri, authentications: []);
    expect(() => client.basicAuthentication(), throwsA(isA<Exception>()));

    // registered basic authentication
    client = $Client(uri, authentications: const [basicAuth]);
    await client.basicAuthentication();
    var captured = verify(headers.add(captureAny, captureAny)).captured;
    expect(
      captured,
      equals([
        'Accept',
        'application/json',
        'Authorization',
        'Basic YmVhcmVyLXVzZXJuYW1lOmJlYXJlci1wYXNzd29yZA==',
      ]),
    );

    // registered bearer authentication
    client = $Client(uri, authentications: const [bearerAuth]);
    expect(() => client.basicAuthentication(), throwsA(isA<Exception>()));

    // multiple registered authentication
    client = $Client(uri, authentications: const [basicAuth, bearerAuth]);
    await client.basicAuthentication();
    captured = verify(headers.add(captureAny, captureAny)).captured;
    expect(
      captured,
      equals([
        'Accept',
        'application/json',
        'Authorization',
        'Basic YmVhcmVyLXVzZXJuYW1lOmJlYXJlci1wYXNzd29yZA==',
      ]),
    );
  });

  test('Bearer authentication', () async {
    // no registered authentications
    var client = $Client(uri, authentications: []);
    expect(() => client.bearerAuthentication(), throwsA(isA<Exception>()));

    // registered basic authentication
    client = $Client(uri, authentications: const [basicAuth]);
    expect(() => client.bearerAuthentication(), throwsA(isA<Exception>()));

    // registered bearer authentication
    client = $Client(uri, authentications: const [bearerAuth]);
    await client.bearerAuthentication();
    var captured = verify(headers.add(captureAny, captureAny)).captured;
    expect(
      captured,
      equals([
        'Accept',
        'application/json',
        'Authorization',
        'Bearer bearer-token',
      ]),
    );

    // multiple registered authentication
    client = $Client(uri, authentications: const [basicAuth, bearerAuth]);
    await client.bearerAuthentication();
    captured = verify(headers.add(captureAny, captureAny)).captured;
    expect(
      captured,
      equals([
        'Accept',
        'application/json',
        'Authorization',
        'Bearer bearer-token',
      ]),
    );
  });

  test('Multiple authentications', () async {
    // no registered authentications
    var client = $Client(uri, authentications: []);
    expect(() => client.multipleAuthentications(), throwsA(isA<Exception>()));

    // registered basic authentication
    client = $Client(uri, authentications: const [basicAuth]);
    await client.multipleAuthentications();
    var captured = verify(headers.add(captureAny, captureAny)).captured;
    expect(
      captured,
      equals([
        'Accept',
        'application/json',
        'Authorization',
        'Basic YmVhcmVyLXVzZXJuYW1lOmJlYXJlci1wYXNzd29yZA==',
      ]),
    );

    // registered bearer authentication
    client = $Client(uri, authentications: const [bearerAuth]);
    await client.multipleAuthentications();
    captured = verify(headers.add(captureAny, captureAny)).captured;
    expect(
      captured,
      equals([
        'Accept',
        'application/json',
        'Authorization',
        'Bearer bearer-token',
      ]),
    );

    // multiple registered authentication
    client = $Client(uri, authentications: const [basicAuth, bearerAuth]);
    await client.multipleAuthentications();
    captured = verify(headers.add(captureAny, captureAny)).captured;
    expect(
      captured,
      equals([
        'Accept',
        'application/json',
        'Authorization',
        'Basic YmVhcmVyLXVzZXJuYW1lOmJlYXJlci1wYXNzd29yZA==',
      ]),
    );
  });
}
