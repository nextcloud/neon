import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:built_value/serializer.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dynamite_runtime/src/http_extensions.dart';
import 'package:dynamite_runtime/src/uri.dart';
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';

/// Response returned by operations of a [DynamiteClient].
///
/// See:
///   * [DynamiteRawResponse] for an experimental implementation that can be serialized.
///   * [DynamiteApiException] as the exception that can be thrown in operations
///   * [DynamiteAuthentication] for providing authentication methods.
///   * [DynamiteClient] for the client providing operations.
@immutable
class DynamiteResponse<B, H> {
  /// Creates a new dynamite response.
  const DynamiteResponse(
    this.statusCode,
    this._body,
    this._headers,
  );

  /// The status code of the response.
  final int statusCode;

  final B? _body;

  final H? _headers;

  /// The decoded body of the response.
  B get body => _body!;

  /// The decoded headers of the response.
  H get headers => _headers!;

  @override
  String toString() => 'DynamiteResponse(data: $body, headers: $headers, statusCode: $statusCode)';
}

/// Raw response returned by operations of a [DynamiteClient].
///
/// This type itself is serializable.
///
/// The api of this type might change without a major bump.
/// Use methods that return a [DynamiteResponse] instead.
///
/// See:
///   * [DynamiteResponse] as the response returned by an operation.
///   * [DynamiteApiException] as the exception that can be thrown in operations
///   * [DynamiteAuthentication] for providing authentication methods.
///   * [DynamiteClient] for the client providing operations.
@experimental
class DynamiteRawResponse<B, H> {
  /// Creates a new raw dynamite response.
  ///
  /// The [response] will be awaited and deserialized.
  /// After [future] completes the deserialized response can be accessed
  /// through [response].
  DynamiteRawResponse({
    required final Future<HttpClientResponse> response,
    required this.bodyType,
    required this.headersType,
    required this.serializers,
  }) {
    final completer = Completer<DynamiteResponse<B, H>>();
    future = completer.future;

    // ignore: discarded_futures
    response.then(
      (final response) async {
        _rawBody = switch (bodyType) {
          const FullType(Uint8List) => await response.bytes,
          const FullType(String) => await response.string,
          _ => await response.json,
        };
        _rawHeaders = response.responseHeaders;

        final body = deserializeBody<B>(_rawBody, serializers, bodyType);
        final headers = deserializeHeaders<H>(_rawHeaders, serializers, headersType);

        _response = DynamiteResponse<B, H>(
          response.statusCode,
          body,
          headers,
        );

        completer.complete(_response);
      },
      onError: completer.completeError,
    );
  }

  /// Decodes a raw dynamite response from json data.
  ///
  /// The [future] must not be awaited and the  deserialized response can be
  /// accessed immediately through [response].
  factory DynamiteRawResponse.fromJson(
    final Map<String, Object?> json, {
    required final Serializers serializers,
    final FullType? bodyType,
    final FullType? headersType,
  }) {
    final statusCode = json['statusCode']! as int;
    final body = deserializeBody<B>(json['body'], serializers, bodyType);
    final headers = deserializeHeaders<H>(json['headers'], serializers, headersType);

    final response = DynamiteResponse<B, H>(
      statusCode,
      body,
      headers,
    );

    return DynamiteRawResponse._fromJson(
      response,
      bodyType: bodyType,
      headersType: headersType,
      serializers: serializers,
    );
  }

  DynamiteRawResponse._fromJson(
    this._response, {
    required this.bodyType,
    required this.headersType,
    required this.serializers,
  }) : future = Future.value(_response);

  /// The serializers for the header and body.
  final Serializers serializers;

  /// The full type of the body.
  ///
  /// This is `null` if the body type is void.
  final FullType? bodyType;

  /// The full type of the headers.
  ///
  /// This is `null` if the headers type is void.
  final FullType? headersType;

  /// Future of the deserialized response.
  ///
  /// After this future completes the response can be accessed synchronously
  /// through [response].
  late final Future<DynamiteResponse<B, H>> future;

  /// Caches the serialized response body for later serialization in [toJson].
  ///
  /// Responses revived with [DynamiteRawResponse.fromJson] are not cached as
  /// they are not expected to be serialized again.
  Object? _rawBody;

  /// Caches the serialized response headers for later serialization in [toJson].
  ///
  /// Responses revived with [DynamiteRawResponse.fromJson] are not cached as
  /// they are not expected to be serialized again.
  Map<String, String>? _rawHeaders;

  DynamiteResponse<B, H>? _response;

  /// Returns the deserialized response synchronously.
  ///
  /// Throws a `StateError` if [future] has not completed yet and `this` has
  /// not been instantiated through [DynamiteRawResponse.fromJson].
  DynamiteResponse<B, H> get response {
    final response = _response;

    if (response == null) {
      throw StateError('The response did not finish yet. Make sure to await `this.future`.');
    }

    return response;
  }

  /// Deserializes the body.
  ///
  /// Most efficient if the [serialized] value is already the correct type.
  /// The [bodyType] should represent the return type [B].
  static B? deserializeBody<B>(final Object? serialized, final Serializers serializers, final FullType? bodyType) {
    // If we use the more efficient helpers from BytesStreamExtension the serialized value can already be correct.
    if (serialized is B) {
      return serialized;
    }

    if (bodyType != null) {
      return serializers.deserialize(serialized, specifiedType: bodyType) as B?;
    }

    return null;
  }

  /// Serializes the body.
  Object? serializeBody(final B? object) {
    if (bodyType != null && object != null) {
      return serializers.serialize(object, specifiedType: bodyType!);
    }

    return null;
  }

  /// Deserializes the headers.
  ///
  /// Most efficient if the [serialized] value is already the correct type.
  /// The [headersType] should represent the return type [H].
  static H? deserializeHeaders<H>(
    final Object? serialized,
    final Serializers serializers,
    final FullType? headersType,
  ) {
    // If we use the more efficient helpers from BytesStreamExtension the serialized value can already be correct.
    if (serialized is H) {
      return serialized;
    }

    if (headersType != null) {
      return serializers.deserialize(serialized, specifiedType: headersType) as H?;
    }

    return null;
  }

  /// Serializes the headers.
  Object? serializeHeaders(final H? object) {
    if (headersType != null && object != null) {
      return serializers.serialize(object, specifiedType: headersType!);
    }

    return null;
  }

  /// Serializes this response into json.
  ///
  /// To revive it again use [DynamiteRawResponse.fromJson] with the same
  /// serializer and `FullType`s as this.
  Map<String, Object?> toJson() => {
        'statusCode': response.statusCode,
        'body': _rawBody ?? serializeBody(response._body),
        'headers': _rawHeaders ?? serializeHeaders(response._headers),
      };

  @override
  String toString() => 'DynamiteResponse(${toJson()})';
}

/// The exception thrown by operations of a [DynamiteClient].
///
///
/// See:
///   * [DynamiteResponse] as the response returned by an operation.
///   * [DynamiteRawResponse] as the raw response that can be serialized.
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
      body = await response.string;
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
///   * [DynamiteRawResponse] as the raw response that can be serialized.
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
///   * [DynamiteRawResponse] as the raw response that can be serialized.
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
    final Set<int>? validStatuses,
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

    if (validStatuses?.contains(response.statusCode) ?? true) {
      return response;
    } else {
      throw await DynamiteApiException.fromResponse(response);
    }
  }
}
