import 'dart:convert';
import 'dart:typed_data';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:universal_io/io.dart';

export 'package:cookie_jar/cookie_jar.dart';

extension DynamiteHttpClientResponseBody on HttpClientResponse {
  Future<Uint8List> get bodyBytes async {
    final data = await expand((final element) => element).toList();

    return Uint8List.fromList(data);
  }

  Future<String> get body => transform(utf8.decoder).join();
}

class DynamiteResponse<T, U> {
  DynamiteResponse(
    this.data,
    this.headers,
  );

  final T data;

  final U headers;

  @override
  String toString() => 'DynamiteResponse(data: $data, headers: $headers)';
}

class RawResponse {
  RawResponse(
    this.statusCode,
    this.headers,
    this.body,
  );

  final int statusCode;

  final Map<String, String> headers;

  final Uint8List body;

  @override
  String toString() => 'RawResponse(statusCode: $statusCode, headers: $headers, body: ${utf8.decode(body)})';
}

class DynamiteApiException extends RawResponse implements Exception {
  DynamiteApiException(
    super.statusCode,
    super.headers,
    super.body,
  );

  @override
  String toString() =>
      'DynamiteApiException(statusCode: ${super.statusCode}, headers: ${super.headers}, body: ${utf8.decode(super.body)})';
}

abstract class DynamiteAuthentication {
  String get id;
  Map<String, String> get headers;
}

class DynamiteHttpBasicAuthentication extends DynamiteAuthentication {
  DynamiteHttpBasicAuthentication({
    required this.username,
    required this.password,
  });

  final String username;

  final String password;

  @override
  String get id => 'basic_auth';
  @override
  Map<String, String> get headers => {
        'Authorization': 'Basic ${base64.encode(utf8.encode('$username:$password'))}',
      };
}

class DynamiteClient {
  DynamiteClient(
    this.baseURL, {
    final Map<String, String>? baseHeaders,
    final String? userAgent,
    final HttpClient? httpClient,
    this.cookieJar,
    this.authentications = const [],
  }) {
    this.baseHeaders = {
      ...?baseHeaders,
    };
    this.httpClient = (httpClient ?? HttpClient())..userAgent = userAgent;
  }

  final String baseURL;

  late final Map<String, String> baseHeaders;

  late final HttpClient httpClient;

  final CookieJar? cookieJar;

  final List<DynamiteAuthentication> authentications;

  Future<RawResponse> doRequest(
    final String method,
    final String path,
    final Map<String, String> headers,
    final Uint8List? body,
  ) async {
    final uri = Uri.parse('$baseURL$path');
    final request = await httpClient.openUrl(method, uri);
    for (final header in {...baseHeaders, ...headers}.entries) {
      request.headers.add(header.key, header.value);
    }
    if (body != null) {
      request.add(body.toList());
    }
    if (cookieJar != null) {
      request.cookies.addAll(await cookieJar!.loadForRequest(uri));
    }

    final response = await request.close();
    if (cookieJar != null) {
      await cookieJar!.saveFromResponse(uri, response.cookies);
    }
    final responseHeaders = <String, String>{};
    response.headers.forEach((final name, final values) {
      responseHeaders[name] = values.last;
    });
    return RawResponse(
      response.statusCode,
      responseHeaders,
      await response.bodyBytes,
    );
  }
}
