// ignore_for_file: discarded_futures

import 'dart:convert';

import 'package:dynamite_end_to_end_test/request_body.openapi.dart';
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
  late $Client client;
  late MockHttpHeaders headers;
  late MockHttpClientResponse response;
  late MockHttpClientRequest request;

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

    client = $Client(Uri.parse('example.com'));
  });

  test('Request Uint8List body', () async {
    // No body
    await client.$get();
    verifyNever(request.add(captureAny));

    // with body
    final data = utf8.encode('value');
    await client.$get(uint8List: data);
    final captured = verify(request.add(captureAny)).captured;
    expect(captured, [data]);
  });

  test('Request String body', () async {
    // No body
    await client.post();
    verifyNever(request.add(captureAny));

    // with body
    await client.post(string: 'value');
    final captured = verify(request.add(captureAny)).captured;
    expect(captured, [utf8.encode('value')]);
  });
}
