import 'dart:convert';
import 'dart:io' show HttpHeaders;
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:interceptor_http_client/interceptor_http_client.dart';

/// An http interceptor that records every request and adds them to a fixture.
final class FixtureInterceptor implements HttpInterceptor {
  /// Creates a new fixture interceptor.
  const FixtureInterceptor({
    required this.appendFixture,
  });

  /// Callback for adding a recorded request to the fixture.
  final void Function(String fixture) appendFixture;

  @override
  bool shouldInterceptRequest(http.BaseRequest request) {
    // TODO: use resetFixture and intercept all requests
    return request.url.path != '/index.php/csrftoken';
  }

  @override
  Future<http.BaseRequest> interceptRequest({required http.BaseRequest request}) async {
    assert(
      shouldInterceptRequest(request),
      'Request should not be intercepted.',
    );

    final bodyBytes = switch (request) {
      http.Request() => request.bodyBytes,
      _ => await request.finalize().toBytes(),
    };

    final fixture = _formatHttpRequest(request, bodyBytes);
    appendFixture(fixture);

    return switch (request) {
      http.Request() => request,
      _ => http.Request(request.method, request.url)
        ..persistentConnection = request.persistentConnection
        ..followRedirects = request.followRedirects
        ..maxRedirects = request.maxRedirects
        ..headers.addAll(request.headers)
        ..bodyBytes = bodyBytes,
    };
  }

  @override
  bool shouldInterceptResponse(http.StreamedResponse response) {
    return false;
  }

  @override
  Never interceptResponse({required http.StreamedResponse response, required Uri url}) {
    throw UnsupportedError('Fixtures may not intercept responses.');
  }

  static String _formatHttpRequest(http.BaseRequest request, Uint8List body) {
    final buffer = StringBuffer('${request.method.toUpperCase()} ${request.url.replace(port: 80)}');

    final headers = <String>[];
    for (final header in request.headers.entries) {
      final name = header.key.toLowerCase();
      var value = header.value;

      switch (name) {
        case HttpHeaders.hostHeader:
        case HttpHeaders.cookieHeader:
          continue;

        case HttpHeaders.authorizationHeader:
          value = '${value.split(' ').first} mock';

        case 'requesttoken':
          value = 'token';

        case 'destination':
          value = Uri.parse(value).replace(port: 80).toString();
      }

      headers.add('\n$name: $value');
    }

    headers.sort();
    buffer.writeAll(headers);

    if (body.isNotEmpty) {
      try {
        buffer.write('\n${utf8.decode(body)}');
      } on FormatException catch (_) {
        buffer.write('\n${base64.encode(body)}');
      }
    }

    return buffer.toString();
  }
}
