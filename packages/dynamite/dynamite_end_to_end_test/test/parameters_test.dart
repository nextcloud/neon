// ignore_for_file: discarded_futures

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:dynamite_end_to_end_test/parameters.openapi.dart';
import 'package:dynamite_runtime/models.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:universal_io/io.dart';

import 'http_client_mock.mocks.dart';

late MockHttpClient mockHttpClient;

class MockHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(final SecurityContext? context) => mockHttpClient;
}

void main() {
  late Client client;
  late MockHttpHeaders headers;
  late MockHttpClientResponse response;
  late MockHttpClientRequest request;

  setUp(() {
    mockHttpClient = MockHttpClient();
    HttpOverrides.global = MockHttpOverrides();

    when(mockHttpClient.openUrl(any, any)).thenAnswer((final invocation) {
      headers = MockHttpHeaders();

      response = MockHttpClientResponse();
      when(response.headers).thenReturn(headers);
      when(response.transform<dynamic>(any)).thenAnswer((final _) => Stream.value('{}'));
      when(response.statusCode).thenReturn(200);

      request = MockHttpClientRequest();
      when(request.headers).thenReturn(headers);
      when(request.close()).thenAnswer((final _) async => response);
      return Future.value(request);
    });

    client = Client(Uri.parse('example.com'));
  });

  group(r'$get', () {
    test('no parameters', () async {
      await client.$get();
      final captured = verify(headers.add(captureAny, captureAny)).captured;
      expect(captured, equals(['Accept', 'application/json']));
    });

    test('with contentString', () async {
      final contentString = ContentString<BuiltMap<String, JsonObject>>(
        (final b) => b..content = BuiltMap<String, JsonObject>({'key': JsonObject('value')}),
      );

      final queryComponent = Uri.encodeQueryComponent(json.encode({'key': 'value'}));

      await client.$get(contentString: contentString);
      final captured = verify(mockHttpClient.openUrl(captureAny, captureAny)).captured;
      expect(
        captured,
        equals([
          'get',
          Uri.parse('example.com/?content_string=$queryComponent'),
        ]),
      );
    });

    test('with contentParameter', () async {
      final contentParameter = ContentString<BuiltMap<String, JsonObject>>(
        (final b) => b..content = BuiltMap<String, JsonObject>({'key': JsonObject('value')}),
      );

      final queryComponent = Uri.encodeQueryComponent(json.encode({'key': 'value'}));

      await client.$get(contentParameter: contentParameter);
      final captured = verify(mockHttpClient.openUrl(captureAny, captureAny)).captured;
      expect(
        captured,
        equals([
          'get',
          Uri.parse('example.com/?content_parameter=$queryComponent'),
        ]),
      );
    });

    test('with empty string', () async {
      await client.$get(string: '');
      final captured = verify(mockHttpClient.openUrl(captureAny, captureAny)).captured;
      expect(
        captured,
        equals([
          'get',
          Uri.parse('example.com/?string='),
        ]),
      );
    });

    test('with multiple query parameters', () async {
      final contentString = ContentString<BuiltMap<String, JsonObject>>(
        (final b) => b..content = BuiltMap<String, JsonObject>({'key': JsonObject('value')}),
      );

      final queryComponent = Uri.encodeQueryComponent(json.encode({'key': 'value'}));

      await client.$get(contentString: contentString, contentParameter: contentString);
      final captured = verify(mockHttpClient.openUrl(captureAny, captureAny)).captured;
      expect(
        captured,
        equals([
          'get',
          Uri.parse('example.com/?content_string=$queryComponent&content_parameter=$queryComponent'),
        ]),
      );
    });
    test('oneOf', () async {
      await client.$get(oneOf: ($bool: true, string: null));
      var captured = verify(mockHttpClient.openUrl(captureAny, captureAny)).captured;
      expect(
        captured,
        equals([
          'get',
          Uri.parse('example.com/?oneOf=true'),
        ]),
      );
      resetMockitoState();

      await client.$get(oneOf: ($bool: null, string: 'value'));
      captured = verify(mockHttpClient.openUrl(captureAny, captureAny)).captured;
      expect(
        captured,
        equals([
          'get',
          Uri.parse('example.com/?oneOf=value'),
        ]),
      );
    });

    test('anyOf', () async {
      await client.$get(anyOf: ($bool: true, string: null));
      var captured = verify(mockHttpClient.openUrl(captureAny, captureAny)).captured;
      expect(
        captured,
        equals([
          'get',
          Uri.parse('example.com/?anyOf=true'),
        ]),
      );
      resetMockitoState();

      await client.$get(anyOf: ($bool: null, string: 'value'));
      captured = verify(mockHttpClient.openUrl(captureAny, captureAny)).captured;
      expect(
        captured,
        equals([
          'get',
          Uri.parse('example.com/?anyOf=value'),
        ]),
      );
      resetMockitoState();

      await client.$get(anyOf: ($bool: true, string: 'value'));
      captured = verify(mockHttpClient.openUrl(captureAny, captureAny)).captured;
      expect(
        captured,
        equals([
          'get',
          Uri.parse('example.com/?anyOf=true'),
        ]),
      );
    });
  });

  group('getPathParameter', () {
    test('empty path', () async {
      await client.getPathParameter(pathParameter: 'parameter');
      final captured = verify(mockHttpClient.openUrl(captureAny, captureAny)).captured;
      expect(
        captured,
        equals([
          'get',
          Uri.parse('example.com/parameter'),
        ]),
      );
    });
  });
}
