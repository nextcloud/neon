// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dynamite_runtime/http_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:universal_io/io.dart';

// ignore: public_member_api_docs
class MockHttpClient extends Mock implements HttpClient {}

// ignore: public_member_api_docs
class MockHttpRequest extends Mock implements HttpClientRequest {}

// ignore: public_member_api_docs
class MockHttpResponse extends Mock implements HttpClientResponse {}

// ignore: public_member_api_docs
class ByteStreamFake extends Fake implements Stream<List<int>> {}

/// Gets a mocked [HttpClient] that proxies the request to a real [HttpClient].
/// For every requests it calls [onRequest] which contains the formatted request.
HttpClient getProxyHttpClient({
  required final void Function(String data) onRequest,
}) {
  registerFallbackValue(Uri());
  registerFallbackValue(ByteStreamFake());

  final mockClient = MockHttpClient();
  final realClient = HttpClient();

  // ignore: discarded_futures
  when(() => mockClient.openUrl(any(), any())).thenAnswer((final invocation) async {
    final mockRequest = MockHttpRequest();
    final realRequest = await realClient.openUrl(
      invocation.positionalArguments[0]! as String,
      invocation.positionalArguments[1]! as Uri,
    );

    final bodyBytes = BytesBuilder();

    when(() => mockRequest.headers).thenReturn(realRequest.headers);
    when(() => mockRequest.cookies).thenReturn(realRequest.cookies);
    when(() => mockRequest.add(any())).thenAnswer((final invocation) {
      final chunk = invocation.positionalArguments[0] as List<int>;
      bodyBytes.add(chunk);
      return realRequest.add(chunk);
    });
    when(() => mockRequest.addStream(any())).thenAnswer((final invocation) {
      final stream = invocation.positionalArguments[0] as Stream<List<int>>;
      return realRequest.addStream(
        stream.map((final chunk) {
          bodyBytes.add(chunk);
          return chunk;
        }),
      );
    });
    when(mockRequest.close).thenAnswer((final invocation) async {
      onRequest(_formatHttpRequest(realRequest, bodyBytes.toBytes()));

      final mockResponse = MockHttpResponse();
      final realResponse = await realRequest.close();

      when(() => mockResponse.headers).thenReturn(realResponse.headers);
      when(() => mockResponse.cookies).thenReturn(realResponse.cookies);
      when(() => mockResponse.contentLength).thenReturn(realResponse.contentLength);
      when(() => mockResponse.statusCode).thenReturn(realResponse.statusCode);
      when(() => mockResponse.forEach(any())).thenAnswer(
        (final invocation) async =>
            realResponse.forEach(invocation.positionalArguments[0]! as void Function(List<int>)),
      );
      when(() => mockResponse.listen(any())).thenAnswer(
        (final invocation) => realResponse.listen(invocation.positionalArguments[0]! as void Function(List<int>)),
      );
      when(() => mockResponse.transform(utf8.decoder)).thenAnswer(
        (final _) => realResponse.transform(utf8.decoder),
      );
      when(() => mockResponse.transform(jsonBytesConverter)).thenAnswer(
        (final _) => realResponse.transform(jsonBytesConverter),
      );
      when(() => mockResponse.transform(xmlBytesConverter)).thenAnswer(
        (final _) => realResponse.transform(xmlBytesConverter),
      );

      return mockResponse;
    });

    return mockRequest;
  });

  return mockClient;
}

String _formatHttpRequest(final HttpClientRequest request, final Uint8List body) {
  final buffer = StringBuffer('${request.method} ${request.uri.replace(port: 80)}');

  request.headers.forEach((final name, final values) {
    if (name == HttpHeaders.hostHeader) {
      return;
    }

    for (var value in values) {
      if (name == HttpHeaders.authorizationHeader) {
        value = '${value.split(' ').first} mock';
      }
      if (name == 'destination') {
        value = Uri.parse(value).replace(port: 80).toString();
      }

      buffer.write('\n$name: $value');
    }
  });

  if (body.isNotEmpty) {
    try {
      buffer.write('\n${utf8.decode(body)}');
    } catch (_) {
      buffer.write('\n${base64.encode(body)}');
    }
  }

  return buffer.toString();
}
