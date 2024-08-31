import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:cookie_store/cookie_store.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:neon_http_client/src/interceptors/interceptors.dart';
import 'package:neon_http_client/src/utils/utils.dart';
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

/// An exception caused by a timed out http request.
final class HttpTimeoutException extends NeonHttpClientException {
  /// Creates a new exception that the request has timed out.
  HttpTimeoutException(super.message, [super.uri]);
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
  factory NeonHttpClient({
    required Uri baseURL,
    http.Client? client,
    Iterable<HttpInterceptor>? interceptors,
    String? userAgent,
    CookieStore? cookieStore,
    Duration? timeLimit,
  }) {
    final baseClient = client ?? http.Client();
    final builtInterceptors = BuiltList<HttpInterceptor>.build((builder) {
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

      builder.add(
        CSRFInterceptor(client: baseClient, baseURL: baseURL),
      );
    });

    return NeonHttpClient._(
      baseClient: baseClient,
      interceptors: builtInterceptors,
      timeLimit: timeLimit,
    );
  }

  const NeonHttpClient._({
    required http.Client baseClient,
    required this.interceptors,
    Duration? timeLimit,
  })  : _baseClient = baseClient,
        _timeLimit = timeLimit;

  final http.Client _baseClient;

  /// The list of enabled interceptors.
  @visibleForTesting
  final BuiltList<HttpInterceptor> interceptors;

  /// Stop waiting for a response after timeLimit has passed.
  final Duration? _timeLimit;

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

    http.StreamedResponse interceptedResponse;
    try {
      interceptedResponse = await _baseClient.send(interceptedRequest).maybeTimeout(_timeLimit);
    } on TimeoutException catch (error) {
      throw HttpTimeoutException(error.toString(), request.url);
    }

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
