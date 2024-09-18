import 'package:http/http.dart' as http;
import 'package:interceptor_http_client/interceptor_http_client.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud/webdav.dart' as webdav;

/// A HttpInterceptor that works around a Nextcloud CSRF bug when cookies are sent.
///
/// A fix is proposed in: https://github.com/nextcloud/server/pull/43699
///
///
/// Because cookies are always sent when run on web this interceptor will acquire
/// a token from the server and attach it to the request headers.
/// If the response is has a `401` status code the token is cleared so a future
/// request will acquire a new one.
///
/// On non web platforms the interceptor will simply remove the `cookies` header
/// for requests to the webdav endpoint.
@internal
final class CSRFInterceptor implements HttpInterceptor {
  /// Creates a new csrf interceptor.
  CSRFInterceptor({
    required http.Client client,
    required Uri baseURL,
  })  : _client = core
            .$Client(
              baseURL,
              httpClient: client,
            )
            .csrfToken,
        _baseURL = baseURL;

  final core.$CsrfTokenClient _client;

  final Uri _baseURL;

  /// The request token sent by the [CSRFInterceptor].
  @visibleForTesting
  String? token;

  static final _log = Logger('CSRFInterceptor');

  @override
  bool shouldInterceptRequest(http.BaseRequest request) {
    if (request.url.host != _baseURL.host || !request.url.path.startsWith('${_baseURL.path}${webdav.webdavBase}')) {
      return false;
    }

    return true;
  }

  @override
  Future<http.BaseRequest> interceptRequest({required http.BaseRequest request}) async {
    assert(
      shouldInterceptRequest(request),
      'Request should not be intercepted.',
    );

    if (token == null) {
      _log.fine('Acquiring new CSRF token for WebDAV');

      final response = await _client.index();
      token = response.body.token;
    }

    request.headers.addAll({
      'OCS-APIRequest': 'true',
      'requesttoken': token!,
    });

    return request;
  }

  @override
  bool shouldInterceptResponse(http.StreamedResponse response) {
    return response.statusCode == 401;
  }

  @override
  http.StreamedResponse interceptResponse({required http.StreamedResponse response, required Uri url}) {
    assert(
      shouldInterceptResponse(response),
      'Response should not be intercepted.',
    );

    // Clear the token just in case it expired and lead to the failure.
    _log.fine('Clearing CSRF token for WebDAV');
    token = null;
    return response;
  }
}
