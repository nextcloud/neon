import 'dart:convert';

import 'package:dynamite_runtime/http_client.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

/// A [http.Client] that sends the Nextcloud CSRF token.
///
/// {@template WebDavCSRFClient}
/// When sending a request with cookies a CSRF token is also needed. In theory this should not be required as
/// long as we send the OCS-APIRequest header, but the server has a bug that only triggers when you also send the
/// cookies.
/// {@endtemplate}
@internal
final class WebDavCSRFClient with http.BaseClient {
  /// Creates a new CSRF client that executes requests through the given [DynamiteClient].
  WebDavCSRFClient(
    Uri baseURL, {
    http.Client? httpClient,
  })  : _baseURL = baseURL,
        _inner = httpClient ?? http.Client();

  final http.Client _inner;

  final Uri _baseURL;

  final _log = Logger('WebDavCSRFClient');

  /// The request token sent by the [WebDavCSRFClient].
  String? _token;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    if (request.url.host != _baseURL.host || !request.url.path.startsWith(_baseURL.path)) {
      return _inner.send(request);
    }

    if (_token == null) {
      _log.fine('Acquiring new CSRF token for WebDAV');

      final streamedResponse = await _inner.send(http.Request('GET', Uri.parse('$_baseURL/index.php/csrftoken')));
      final response = await http.Response.fromStream(streamedResponse);
      if (streamedResponse.statusCode >= 300) {
        throw DynamiteStatusCodeException(response);
      }

      _token = (json.decode(response.body) as Map<String, dynamic>)['token']! as String;
    }

    request.headers.addAll({
      'OCS-APIRequest': 'true',
      'requesttoken': _token!,
    });

    final streamedResponse = await _inner.send(request);

    if (streamedResponse.statusCode >= 300) {
      if (streamedResponse.statusCode == 401) {
        // Clear the token just in case it expired and lead to the failure.
        _log.fine('Clearing CSRF token for WebDAV');
        _token = null;
      }

      final response = await http.Response.fromStream(streamedResponse);

      throw DynamiteStatusCodeException(response);
    }

    return streamedResponse;
  }

  @override
  void close() {
    _inner.close();

    super.close();
  }
}
