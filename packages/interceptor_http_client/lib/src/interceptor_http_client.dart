import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:http/http.dart' as http;
import 'package:interceptor_http_client/src/interceptors/interceptors.dart';
import 'package:meta/meta.dart';

/// An exception caused by an error in a [InterceptorHttpClient].
abstract class InterceptorHttpClientException extends http.ClientException {
  /// An exception caused by an error in a [InterceptorHttpClient].
  InterceptorHttpClientException(super.message, [super.uri]);
}

/// An exception caused by a [HttpInterceptor].
final class InterceptionException extends InterceptorHttpClientException {
  /// Creates a new interceptor failure exception.
  InterceptionException(super.message, [super.uri]);
}

/// A http client for intercepting requests and responses.
class InterceptorHttpClient with http.BaseClient {
  /// Creates a new interceptor http client.
  const InterceptorHttpClient({
    required http.Client baseClient,
    required this.interceptors,
  }) : _baseClient = baseClient;

  /// The underlying HTTP client.
  final http.Client _baseClient;

  /// The list of enabled interceptors.
  @visibleForTesting
  @protected
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
        } catch (error, stackTrace) {
          if (error is http.ClientException) {
            rethrow;
          }

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
        } catch (error, stackTrace) {
          if (error is http.ClientException) {
            rethrow;
          }
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
