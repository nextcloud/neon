import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dynamite_runtime/src/uri.dart';
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';

export 'package:cookie_jar/cookie_jar.dart';

extension DynamiteHttpClientResponseBody on HttpClientResponse {
  Future<Uint8List> get bodyBytes async {
    final buffer = BytesBuilder();

    await forEach(buffer.add);

    return buffer.toBytes();
  }

  Future<String> get body => transform(utf8.decoder).join();

  Future<dynamic> get jsonBody => transform(utf8.decoder).transform(json.decoder).first;

  Map<String, String> get responseHeaders {
    final responseHeaders = <String, String>{};
    headers.forEach((final name, final values) {
      responseHeaders[name] = values.last;
    });

    return responseHeaders;
  }
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

class DynamiteApiException implements Exception {
  DynamiteApiException(
    this.statusCode,
    this.headers,
    this.body,
  );

  final int statusCode;

  final Map<String, String> headers;

  final String body;

  @override
  String toString() => 'DynamiteApiException(statusCode: $statusCode, headers: $headers, body: $body)';
}

/// Base dynamite authentication.
///
/// See:
///   * [DynamiteResponse] as the response returned by an operation.
///   * [DynamiteApiException] as the exception that can be thrown in operations
///   * [DynamiteClient] for the client providing operations.
@immutable
sealed class DynamiteAuthentication {
  /// Creates a new authentication.
  const DynamiteAuthentication({
    required this.type,
    required this.scheme,
  });

  /// The base type of the authentication.
  final String type;

  /// The used authentication scheme.
  final String scheme;

  /// The authentication headers added to a request.
  Map<String, String> get headers;
}

/// Basic http authentication with username and password.
class DynamiteHttpBasicAuthentication extends DynamiteAuthentication {
  /// Creates a new http basic authentication.
  const DynamiteHttpBasicAuthentication({
    required this.username,
    required this.password,
  }) : super(
          type: 'http',
          scheme: 'basic',
        );

  /// The username.
  final String username;

  /// The password.
  final String password;

  @override
  Map<String, String> get headers => {
        'Authorization': 'Basic ${base64.encode(utf8.encode('$username:$password'))}',
      };
}

/// Http bearer authentication with a token.
class DynamiteHttpBearerAuthentication extends DynamiteAuthentication {
  /// Creates a new http bearer authentication.
  const DynamiteHttpBearerAuthentication({
    required this.token,
  }) : super(
          type: 'http',
          scheme: 'bearer',
        );

  /// The authentication token.
  final String token;

  @override
  Map<String, String> get headers => {
        'Authorization': 'Bearer $token',
      };
}

class DynamiteClient {
  DynamiteClient(
    final Uri baseURL, {
    this.baseHeaders,
    final String? userAgent,
    final HttpClient? httpClient,
    this.cookieJar,
    this.authentications = const [],
  })  : httpClient = (httpClient ?? HttpClient())..userAgent = userAgent,
        baseURL = baseURL.normalizeEmptyPath();

  final Uri baseURL;

  final Map<String, String>? baseHeaders;

  final HttpClient httpClient;

  final CookieJar? cookieJar;

  final List<DynamiteAuthentication> authentications;

  Future<HttpClientResponse> doRequest(
    final String method,
    final Uri path,
    final Map<String, String> headers,
    final Uint8List? body,
  ) async {
    final uri = baseURL.replace(
      path: '${baseURL.path}${path.path}',
      queryParameters: {
        ...baseURL.queryParameters,
        ...path.queryParameters,
      },
    );

    final request = await httpClient.openUrl(method, uri);
    for (final header in {...?baseHeaders, ...headers}.entries) {
      request.headers.add(header.key, header.value);
    }
    if (body != null) {
      request.add(body);
    }
    if (cookieJar != null) {
      request.cookies.addAll(await cookieJar!.loadForRequest(uri));
    }

    final response = await request.close();
    if (cookieJar != null) {
      await cookieJar!.saveFromResponse(uri, response.cookies);
    }

    return response;
  }
}
