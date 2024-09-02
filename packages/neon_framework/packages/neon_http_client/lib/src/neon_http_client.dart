import 'dart:async';
import 'dart:io' show HttpHeaders;

import 'package:built_collection/built_collection.dart';
import 'package:cookie_store/cookie_store.dart';
import 'package:http/http.dart' as http;
import 'package:interceptor_http_client/interceptor_http_client.dart';
import 'package:neon_http_client/src/interceptors/interceptors.dart';
import 'package:neon_http_client/src/utils/utils.dart';

/// An exception caused by a timed out http request.
final class HttpTimeoutException extends InterceptorHttpClientException {
  /// Creates a new exception that the request has timed out.
  HttpTimeoutException(super.message, [super.uri]);
}

/// A http client for the Neon framework.
final class NeonHttpClient extends InterceptorHttpClient {
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

      builder.add(AuthorizationThrottlingInterceptor(baseURL: baseURL));

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
    required super.baseClient,
    required super.interceptors,
    Duration? timeLimit,
  }) : _timeLimit = timeLimit;

  /// Stop waiting for a response after timeLimit has passed.
  final Duration? _timeLimit;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    try {
      return await super.send(request).maybeTimeout(_timeLimit);
    } on TimeoutException catch (error) {
      throw HttpTimeoutException(error.toString(), request.url);
    }
  }
}
