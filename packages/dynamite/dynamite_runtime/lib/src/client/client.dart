import 'dart:async';
import 'dart:typed_data';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dynamite_runtime/src/client/authentication.dart';
import 'package:dynamite_runtime/src/client/exception.dart';
import 'package:dynamite_runtime/src/client/response.dart';
import 'package:dynamite_runtime/src/utils/uri.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

/// A client for making network requests.
///
/// See:
///   * [DynamiteResponse] as the response returned by an operation.
///   * [DynamiteRawResponse] as the raw response that can be serialized.
///   * [DynamiteApiException] as the exception that can be thrown in operations
///   * [DynamiteAuthentication] for providing authentication methods.
class DynamiteClient with http.BaseClient {
  /// Creates a new dynamite network client.
  ///
  /// If [httpClient] is not provided a default one will be created.
  /// The [baseURL] will be normalized, removing any trailing `/`.
  DynamiteClient(
    Uri baseURL, {
    this.baseHeaders,
    http.Client? httpClient,
    this.cookieJar,
    this.authentications,
  })  : httpClient = httpClient ?? http.Client(),
        baseURL = baseURL.normalizeEmptyPath() {
    if (baseURL.queryParametersAll.isNotEmpty) {
      throw UnsupportedError(
        'Dynamite can not work with a baseURL containing query parameters.',
      );
    }
  }

  /// The base server url used to build the request uri.
  ///
  /// See `https://swagger.io/docs/specification/api-host-and-base-path` for
  /// further information.
  final Uri baseURL;

  /// The base headers added to each request.
  final Map<String, String>? baseHeaders;

  /// The base http client.
  @protected
  final http.Client httpClient;

  /// The optional cookie jar to persist the response cookies.
  final CookieJar? cookieJar;

  /// The available authentications for this client.
  ///
  /// The first one matching the required authentication type will be used.
  final List<DynamiteAuthentication>? authentications;

  /// Makes a request against a given [path].
  ///
  /// The query parameters of the [baseURL] are added.
  /// The [path] is resolved against the path of the [baseURL].
  /// All [baseHeaders] are added to the request.
  Future<http.StreamedResponse> executeRequest(
    String method,
    String path, {
    Map<String, String>? headers,
    Uint8List? body,
  }) {
    final uri = Uri.parse('$baseURL$path');

    return executeRawRequest(
      method,
      uri,
      headers: headers,
      body: body,
    );
  }

  /// Executes a HTTP request against give full [uri].
  Future<http.StreamedResponse> executeRawRequest(
    String method,
    Uri uri, {
    Map<String, String>? headers,
    Uint8List? body,
  }) async {
    final request = http.Request(method, uri);

    if (headers != null) {
      request.headers.addAll(headers);
    }

    if (body != null) {
      request.bodyBytes = body;
    }

    return sendWithCookies(request);
  }

  /// Sends an HTTP request and asynchronously returns the response.
  ///
  /// Cookies are persisted in the [cookieJar] and loaded for requests.
  Future<http.StreamedResponse> sendWithCookies(
    http.BaseRequest request,
  ) async {
    if (cookieJar != null) {
      final cookies = await cookieJar!.loadForRequest(request.url);
      if (cookies.isNotEmpty) {
        request.headers['cookie'] = cookies.join('; ');
      }
    }

    final response = await send(request);

    final cookieHeader = response.headersSplitValues['set-cookie'];
    if (cookieHeader != null && cookieJar != null) {
      final cookies = cookieHeader.map(Cookie.fromSetCookieValue).toList();
      await cookieJar!.saveFromResponse(request.url, cookies);
    }

    return response;
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    // Do not overwrite request headers to avoid invalid requests.
    baseHeaders?.forEach((key, value) {
      request.headers.putIfAbsent(key, () => value);
    });

    return httpClient.send(request);
  }
}
