import 'package:dynamite_runtime/http_client.dart';
import 'package:http/http.dart' as http;

// ignore: do_not_use_environment
const bool _kIsWeb = bool.fromEnvironment('dart.library.js_util');

/// A [http.Client] that sends the Nextcloud CSRF token.
///
/// {@template WebDavCSRFClient}
/// On web we need to send a CSRF token because we also send the cookies.  In theory this should not be required as
/// long as we send the OCS-APIRequest header, but the server has a bug that only triggers when you also send the
/// cookies. On non-web platforms we don't send the cookies so we are fine, but on web the browser always does it
/// and therefore we need this workaround.
/// {@endtemplate}
final class WebDavCSRFClient with http.BaseClient {
  /// Creates a new CSRF client that executes requests through the given [DynamiteClient].
  WebDavCSRFClient(this._inner);

  final DynamiteClient _inner;

  /// The request token sent by the [WebDavCSRFClient].
  String? _token;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    if (_kIsWeb) {
      if (_token == null) {
        final response = await _inner.get(Uri.parse('${_inner.baseURL}/index.php'));
        if (response.statusCode >= 300) {
          throw DynamiteStatusCodeException(
            response.statusCode,
          );
        }

        _token = RegExp('data-requesttoken="([^"]*)"').firstMatch(response.body)!.group(1);
      }

      request.headers.addAll({
        'OCS-APIRequest': 'true',
        'requesttoken': _token!,
      });
    }

    final response = await _inner.send(request);

    if (response.statusCode >= 300) {
      throw DynamiteStatusCodeException(
        response.statusCode,
      );
    }

    return response;
  }
}
