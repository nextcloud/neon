import 'package:http/http.dart';
import 'package:interceptor_http_client/interceptor_http_client.dart';
import 'package:meta/meta.dart';
import 'package:nextcloud/nextcloud.dart';

@internal
final class AuthorizationThrottlingInterceptor implements HttpInterceptor {
  AuthorizationThrottlingInterceptor({
    required this.baseURL,
  });

  final Uri baseURL;
  var _blocked = false;

  bool _matchesBaseURL(Uri uri) => uri.toString().startsWith(baseURL.toString());

  @override
  bool shouldInterceptRequest(BaseRequest request) {
    if (!_matchesBaseURL(request.url)) {
      return false;
    }

    final authorization = request.headers['authorization'];
    return authorization != null && authorization.isNotEmpty && _blocked;
  }

  @override
  Never interceptRequest({required BaseRequest request}) {
    assert(
      shouldInterceptRequest(request),
      'Request should not be intercepted.',
    );

    throw DynamiteStatusCodeException(Response('', 401));
  }

  @override
  bool shouldInterceptResponse(StreamedResponse response) {
    final request = response.request;
    if (request == null) {
      return false;
    }

    if (!_matchesBaseURL(request.url)) {
      return false;
    }

    return true;
  }

  @override
  StreamedResponse interceptResponse({required StreamedResponse response, required Uri url}) {
    assert(
      shouldInterceptResponse(response),
      'Response should not be intercepted.',
    );

    final authorization = response.request!.headers['authorization'];
    if (authorization != null && authorization.isNotEmpty && response.statusCode == 401) {
      _blocked = true;
    } else if (response.statusCode == 200 && response.request!.url.path.endsWith('/index.php/login/v2/poll')) {
      _blocked = false;
    }

    return response;
  }
}
