import 'package:built_collection/built_collection.dart';
import 'package:cookie_store/cookie_store.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:neon_http_client/src/interceptors/interceptors.dart';
import 'package:universal_io/io.dart';

/// An exception caused by an error in a [NeonHttpClient].
sealed class NeonHttpClientException extends http.ClientException {
  NeonHttpClientException(super.message, [super.uri]);
}

/// An exception caused by a [HttpInterceptor].
final class InterceptionException extends NeonHttpClientException {
  /// Creates a new interceptor failure exception.
  InterceptionException(super.message, [super.uri]);
}

/// A http client for the Neon framework.
final class NeonHttpClient with http.BaseClient {
  /// Creates a new Neon http client.
  ///
  ///
  /// It is good practice to set the [userAgent] to allow server admins to identify clients.
  /// A custom HTTP client can be provided through [client].
  /// Additionally a [cookieStore] can be specified to save cookies across requests.
  /// Some endpoints require the use of a cookies persistence.
  NeonHttpClient({
    http.Client? client,
    Iterable<HttpInterceptor>? interceptors,
    String? userAgent,
    CookieStore? cookieStore,
  })  : _baseClient = client ?? http.Client(),
        interceptors = BuiltList.build((builder) {
          if (interceptors != null) {
            builder.addAll(interceptors);
          }

          if (cookieStore != null) {
            builder.add(
              CookieStoreInterceptor(cookieStore: cookieStore),
            );
          }

          if (userAgent != null) {
            builder.add(
              BaseHeaderInterceptor(
                baseHeaders: {
                  HttpHeaders.userAgentHeader: userAgent,
                },
              ),
            );
          }
        });

  final http.Client _baseClient;

  /// The list of enabled interceptors.
  @visibleForTesting
  final BuiltList<HttpInterceptor> interceptors;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    var interceptedRequest = request;
    for (final interceptor in interceptors) {
      if (interceptor.shouldInterceptRequest(interceptedRequest)) {
        try {
          interceptedRequest = await interceptor.interceptRequest(
            request: interceptedRequest,
          );
        } catch (_, stackTrace) {
          Error.throwWithStackTrace(
            InterceptionException('Failed to intercept request', request.url),
            stackTrace,
          );
        }
      }
    }

    var interceptedResponse = await _baseClient.send(interceptedRequest);

    Uri url;
    if (interceptedResponse case http.BaseResponseWithUrl(url: final responseUrl)) {
      url = responseUrl;
    } else {
      url = interceptedRequest.url;
    }

    for (final interceptor in interceptors) {
      if (interceptor.shouldInterceptResponse(interceptedResponse)) {
        try {
          interceptedResponse = await interceptor.interceptResponse(
            response: interceptedResponse,
            url: url,
          );
        } catch (_, stackTrace) {
          Error.throwWithStackTrace(
            InterceptionException('Failed to intercept response', request.url),
            stackTrace,
          );
        }
      }
    }

    return interceptedResponse;
  }

  @override
  void close() {
    _baseClient.close();

    super.close();
  }
}
