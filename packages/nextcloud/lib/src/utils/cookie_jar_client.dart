import 'package:built_collection/built_collection.dart';
import 'package:cookie_jar/cookie_jar.dart' as cookie_jar;
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';

/// An [http.Client] that persists cookies in the given [cookieJar].
///
/// The [baseHeaders] will be attached to every request.
/// The headers of a request will override any header in the `baseHeaders`.
@internal
class CookieJarClient with http.BaseClient {
  /// Creates a new http client with a [cookieJar] persisting cookies.
  CookieJarClient({
    this.baseHeaders,
    this.cookieJar,
    http.Client? httpClient,
  }) : httpClient = httpClient ?? http.Client();

  /// The base http client.
  final http.Client httpClient;

  /// The optional cookie jar to persist the response cookies.
  final cookie_jar.CookieJar? cookieJar;

  /// The base headers added to each request.
  final BuiltMap<String, String>? baseHeaders;

  /// Sends an HTTP request and asynchronously returns the response.
  ///
  /// Cookies are persisted in the [cookieJar] and loaded for requests.
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    if (cookieJar != null) {
      final cookies = await cookieJar!.loadForRequest(request.url);
      if (cookies.isNotEmpty) {
        final buffer = StringBuffer();

        for (final entry in cookies.indexed) {
          final cookie = entry.$2;

          buffer
            ..write(cookie.name)
            ..write('=')
            ..write(cookie.value);

          if (entry.$1 < cookies.length - 1) {
            buffer.write('; ');
          }
        }

        request.headers['cookie'] = buffer.toString();
      }
    }

    // Do not overwrite request headers to avoid invalid requests.
    baseHeaders?.forEach((key, value) {
      request.headers.putIfAbsent(key, () => value);
    });

    final response = await httpClient.send(request);

    final cookieHeader = response.headersSplitValues['set-cookie'];
    if (cookieHeader != null && cookieJar != null) {
      final cookies = cookieHeader.map(Cookie.fromSetCookieValue).toList();
      await cookieJar!.saveFromResponse(request.url, cookies);
    }

    return response;
  }
}
