import 'package:dynamite_runtime/http_client.dart';
import 'package:http/http.dart' as http;
import 'package:nextcloud/nextcloud.dart';

/// A [http.Client] that sends the Nextcloud CSRF token.
///
/// {@template WebDavCSRFClient}
/// When sending a request with cookies a CSRF token is also needed. In theory this should not be required as
/// long as we send the OCS-APIRequest header, but the server has a bug that only triggers when you also send the
/// cookies.
/// {@endtemplate}
final class WebDavCSRFClient with http.BaseClient {
  /// Creates a new CSRF client that executes requests through the given [DynamiteClient].
  WebDavCSRFClient(this._inner);

  final NextcloudClient _inner;

  /// The request token sent by the [WebDavCSRFClient].
  String? _token;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    if (_token == null) {
      final streamedResponse = await _inner.send(http.Request('GET', Uri.parse('${_inner.baseURL}/index.php')));
      final response = await http.Response.fromStream(streamedResponse);
      if (streamedResponse.statusCode >= 300) {
        throw DynamiteStatusCodeException(response);
      }

      _token = RegExp('data-requesttoken="([^"]*)"').firstMatch(response.body)!.group(1);
    }

    request.headers.addAll({
      'OCS-APIRequest': 'true',
      'requesttoken': _token!,
    });

    final streamedResponse = await _inner.send(request);

    if (streamedResponse.statusCode >= 300) {
      final response = await http.Response.fromStream(streamedResponse);

      throw DynamiteStatusCodeException(response);
    }

    return streamedResponse;
  }
}
