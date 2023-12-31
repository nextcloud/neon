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

  group(r'$get', () {
    test('no parameters', () async {
      await client.$get();
      final captured = verify(headers.add(captureAny, captureAny)).captured;
      expect(captured, equals(['Accept', 'application/json']));
    });

    test('with contentString', () async {
      final contentString = ContentString<BuiltMap<String, JsonObject>>(
        (b) => b..content = BuiltMap<String, JsonObject>({'key': JsonObject('value')}),
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
        (b) => b..content = BuiltMap<String, JsonObject>({'key': JsonObject('value')}),
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
        (b) => b..content = BuiltMap<String, JsonObject>({'key': JsonObject('value')}),
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

  group('getHeaders', () {
    test('no parameters', () async {
      await client.getHeaders();
      final captured = verify(mockHttpClient.openUrl(captureAny, captureAny)).captured;
      expect(
        captured,
        equals([
          'get',
          Uri.parse('example.com/headers'),
        ]),
      );

      final capturedHeaders = verify(headers.add(captureAny, captureAny)).captured;
      expect(capturedHeaders, ['Accept', 'application/json']);
    });

    test('all parameters', () async {
      await client.getHeaders(
        contentString: ContentString<BuiltMap<String, JsonObject>>(
          (b) => b..content = BuiltMap<String, JsonObject>({'key': JsonObject('value')}),
        ),
        contentParameter: ContentString<BuiltMap<String, JsonObject>>(
          (b) => b..content = BuiltMap<String, JsonObject>({'key': JsonObject('value')}),
        ),
        array: BuiltList<JsonObject>([
          JsonObject(107),
          JsonObject(0.20416125852587397),
          JsonObject(false),
          JsonObject(r'Value$'),
        ]),
        arrayString: BuiltList<String>([
          'Value1',
          'Value2',
          r'Value$',
        ]),
        $bool: false,
        string: r'$String',
        stringBinary: utf8.encode('StringValue'),
        $int: 126,
        $double: 0.5370671089544252,
        $num: 107,
        object: JsonObject(0.20416125852587397),
        oneOf: ($bool: null, string: r'$String'),
        anyOf: ($bool: false, string: r'$String'),
        enumPattern: GetHeadersEnumPattern.a,
      );

      var captured = verify(mockHttpClient.openUrl(captureAny, captureAny)).captured;
      expect(
        captured,
        equals([
          'get',
          Uri.parse('example.com/headers'),
        ]),
      );

      captured = verify(headers.add(captureAny, captureAny)).captured;
      final capturedHeaders = <Object?, Object?>{};
      for (var i = 0; i < captured.length; i += 2) {
        capturedHeaders[captured[i]] = captured[i + 1];
      }

      expect(capturedHeaders, {
        'Accept': 'application/json',
        'content_string': '{"key":"value"}',
        'content_parameter': '{"key":"value"}',
        'array': r'107,0.20416125852587397,false,Value$',
        'array_string': r'Value1,Value2,Value$',
        'bool': 'false',
        'string': r'$String',
        'string_binary': 'U3RyaW5nVmFsdWU=',
        'int': '126',
        'double': '0.5370671089544252',
        'num': '107',
        'object': '0.20416125852587397',
        'oneOf': r'$String',
        'anyOf': 'false',
        'enum_pattern': 'a',
      });
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

  group('PatternCheck', () {
    test('enum', () async {
      expect(() => client.$get(enumPattern: GetEnumPattern.$0), throwsA(isA<FormatException>()));
      expect(() => client.getHeaders(enumPattern: GetHeadersEnumPattern.$0), throwsA(isA<FormatException>()));
    });
  });

  test('Naming Collisions', () async {
    await client.getNamingCollisions(
      jsonSerializers: r'jsonSerializers value$',
      serializers: r'serializers$ value',
      body: r'$body value',
      parameters: r'parameters value$$$',
      headers: r'headers$',
    );

    final captured = verify(headers.add(captureAny, captureAny)).captured;
    final capturedHeaders = <Object?, Object?>{};
    for (var i = 0; i < captured.length; i += 2) {
      capturedHeaders[captured[i]] = captured[i + 1];
    }
    final capturedUrl = verify(mockHttpClient.openUrl(captureAny, captureAny)).captured;

    expect(capturedHeaders, {
      'Accept': 'application/json',
      '%24serializers': r'serializers$ value',
      '_body': r'$body value',
      '_parameters': r'parameters value$$$',
      '_headers': r'headers$',
    });

    expect(
      capturedUrl,
      equals([
        'get',
        Uri.parse('example.com/naming_collisions?%24jsonSerializers=jsonSerializers%20value%24'),
      ]),
    );
  });
}
