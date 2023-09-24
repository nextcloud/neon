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

/// Response returned by operations of a [DynamiteClient].
///
/// See:
///   * [DynamiteApiException] as the exception that can be thrown in operations
///   * [DynamiteAuthentication] for providing authentication methods.
///   * [DynamiteClient] for the client providing operations.
class DynamiteResponse<B, H> {
  /// Creates a new dynamite response.
  const DynamiteResponse(
    this.statusCode,
    this.body,
    this.headers,
  );

  /// The status code of the response.
  final int statusCode;

  /// The decoded body of the response.
  final B body;

  /// The decoded headers of the response.
  final H headers;

  @override
  String toString() => 'DynamiteResponse(data: $body, headers: $headers, statusCode: $statusCode)';
}

/// The exception thrown by operations of a [DynamiteClient].
///
///
/// See:
///   * [DynamiteResponse] as the response returned by an operation.
///   * [DynamiteAuthentication] for providing authentication methods.
///   * [DynamiteClient] for the client providing operations.
@immutable
class DynamiteApiException implements Exception {
  /// Creates a new dynamite exception with the given information.
  const DynamiteApiException(
    this.statusCode,
    this.headers,
    this.body,
  );

  /// Creates a new Exception from the given [response].
  ///
  /// Tries to decode the `response` into a string.
  static Future<DynamiteApiException> fromResponse(final HttpClientResponse response) async {
    String body;
    try {
      body = await response.body;
    } on FormatException {
      body = 'binary';
    }

    return DynamiteApiException(
      response.statusCode,
      response.responseHeaders,
      body,
    );
  }

  /// The returned status code when the exception was thrown.
  final int statusCode;

  /// The returned headers when the exception was thrown.
  final Map<String, String> headers;

  /// The returned body code when the exception was thrown.
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

/// A client for making network requests.
///
/// See:
///   * [DynamiteResponse] as the response returned by an operation.
///   * [DynamiteApiException] as the exception that can be thrown in operations
///   * [DynamiteAuthentication] for providing authentication methods.
class DynamiteClient {
  /// Creates a new dynamite network client.
  ///
  /// If [httpClient] is not provided a default one will be created.
  /// The [baseURL] will be normalized, removing any trailing `/`.
  DynamiteClient(
    final Uri baseURL, {
    this.baseHeaders,
    final String? userAgent,
    final HttpClient? httpClient,
    this.cookieJar,
    this.authentications = const [],
  })  : httpClient = (httpClient ?? HttpClient())..userAgent = userAgent,
        baseURL = baseURL.normalizeEmptyPath();

  /// The base server url used to build the request uri.
  ///
  /// See `https://swagger.io/docs/specification/api-host-and-base-path` for
  /// further information.
  final Uri baseURL;

  /// The base headers added to each request.
  final Map<String, String>? baseHeaders;

  /// The base http client.
  final HttpClient httpClient;

  /// The optional cookie jar to persist the response cookies.
  final CookieJar? cookieJar;

  /// The available authentications for this client.
  ///
  /// The first one matching the required authentication type will be used.
  final List<DynamiteAuthentication> authentications;

  /// Makes a request against a given [path].
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
