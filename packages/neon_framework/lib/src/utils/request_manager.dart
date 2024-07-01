import 'dart:async';
import 'dart:convert';

import 'package:built_value/serializer.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/src/bloc/result.dart';
import 'package:neon_framework/src/models/account.dart';
import 'package:neon_framework/storage.dart';
import 'package:nextcloud/utils.dart';
import 'package:nextcloud/webdav.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:xml/xml.dart' as xml;

final _log = Logger('RequestManager');

/// A callback that unwraps elements of type [R] into [T].
///
/// This is commonly used to get the relevant information from a broader response.
typedef UnwrapCallback<T, R> = T Function(R);

/// A callback to serialize a value of type [T] into a string.
///
/// This is used to store a value in the cache.
@internal
typedef SerializeCallback<T> = Uint8List Function(T);

/// A callback to revive cached values [String] into their original type [T].
@internal
typedef DeserializeCallback<T> = T Function(Uint8List);

/// How often a request will be tried.
///
/// A request will not be retried if the returned status code is in the `500`
/// range or if the request has timed out.
const kMaxTries = 3;

/// The default timeout for requests.
///
/// Requests that take longer than this duration will be canceled.
const kDefaultTimeout = Duration(seconds: 30);

/// A singleton class that handles requests to the Nextcloud API.
///
/// Requests need to be made through the [nextcloud](https://pub.dev/packages/nextcloud)
/// package.
///
/// Requests can be persisted in the local cache if enabled and set up by the [NeonStorage].
class RequestManager {
  RequestManager._();

  /// Mocks the singleton instance for testing.
  @visibleForTesting
  factory RequestManager.mocked(RequestManager requestManager) => _requestManager = requestManager;

  static RequestManager? _requestManager;

  /// Gets the current instance of [RequestManager].
  // ignore: prefer_constructors_over_static_methods
  static RequestManager get instance => _requestManager ??= RequestManager._();

  @visibleForTesting
  static set instance(RequestManager? requestManager) => _requestManager = requestManager;

  final RequestCache? _cache = NeonStorage().requestCache;

  /// Executes a request to a Nextcloud API endpoint.
  ///
  /// Every time [getRequest] is called a new [http.Request] has to be created.
  /// Re-using the same will not work when retrying failed requests.
  Future<void> wrapNextcloud<T, B, H>({
    required Account account,
    required String cacheKey,
    required BehaviorSubject<Result<T>> subject,
    required http.BaseRequest Function() getRequest,
    required DynamiteSerializer<B, H> serializer,
    required UnwrapCallback<T, DynamiteResponse<B, H>> unwrap,
    bool disableTimeout = false,
  }) async =>
      wrap<T, DynamiteResponse<B, H>>(
        account: account,
        cacheKey: cacheKey,
        subject: subject,
        request: () async {
          final response = await account.client.send(getRequest());
          return ResponseConverter<B, H>(serializer).convert(response);
        },
        unwrap: (rawResponse) => unwrap(rawResponse),
        serialize: (data) {
          return const RawResponseEncoder().fuse(JsonUtf8Encoder()).convert(data as DynamiteRawResponse) as Uint8List;
        },
        deserialize: (data) {
          return const Utf8Decoder().fuse(const JsonDecoder()).fuse(RawResponseDecoder<B, H>(serializer)).convert(data);
        },
        disableTimeout: disableTimeout,
      );

  /// Executes a WebDAV request.
  Future<void> wrapWebDav<T>({
    required Account account,
    required String cacheKey,
    required BehaviorSubject<Result<T>> subject,
    required http.BaseRequest Function() getRequest,
    required UnwrapCallback<T, WebDavMultistatus> unwrap,
    bool disableTimeout = false,
  }) =>
      wrap<T, WebDavMultistatus>(
        account: account,
        cacheKey: cacheKey,
        subject: subject,
        request: () async {
          final response = await account.client.webdav.csrfClient.send(getRequest());
          return const WebDavResponseConverter().convert(response);
        },
        unwrap: unwrap,
        serialize: (data) => utf8.encode(data.toXmlElement(namespaces: namespaces).toXmlString()),
        deserialize: (data) => WebDavMultistatus.fromXmlElement(xml.XmlDocument.parse(utf8.decode(data)).rootElement),
        disableTimeout: disableTimeout,
      );

  /// Executes a HTTP request for binary content.
  ///
  /// Every time [getRequest] is called a new [http.Request] has to be created.
  /// Re-using the same will not work when retrying failed requests.
  Future<void> wrapBinary({
    required Account account,
    required String cacheKey,
    required AsyncValueGetter<CacheParameters> getCacheParameters,
    required http.BaseRequest Function() getRequest,
    required UnwrapCallback<Uint8List, Uint8List>? unwrap,
    required BehaviorSubject<Result<Uint8List>> subject,
    bool disableTimeout = false,
  }) async {
    final serializer = DynamiteSerializer<Uint8List, Map<String, String>>(
      bodyType: const FullType(Uint8List),
      headersType: const FullType(Map, [FullType(String), FullType(String)]),
      serializers: Serializers(),
      validStatuses: const {200, 201},
    );

    return wrap<Uint8List, DynamiteResponse<Uint8List, dynamic>>(
      account: account,
      cacheKey: cacheKey,
      subject: subject,
      request: () async {
        final response = await account.client.send(getRequest());

        return ResponseConverter<Uint8List, Map<String, String>>(serializer).convert(response);
      },
      unwrap: (rawResponse) {
        var data = rawResponse.body;
        if (unwrap != null) {
          data = unwrap(data);
        }

        return data;
      },
      serialize: (response) => response.body,
      deserialize: (data) => DynamiteResponse(
        200,
        data,
        null,
      ),
      getCacheParameters: getCacheParameters,
      disableTimeout: disableTimeout,
    );
  }

  /// Executes a HTTP request for binary content using a simplified [uri] based approach.
  Future<void> wrapUri({
    required Account account,
    required Uri uri,
    required UnwrapCallback<Uint8List, Uint8List>? unwrap,
    required BehaviorSubject<Result<Uint8List>> subject,
  }) {
    final headers = account.getAuthorizationHeaders(uri);

    return wrapBinary(
      account: account,
      cacheKey: uri.toString(),
      getCacheParameters: () async {
        final response = await account.client.head(
          uri,
          headers: headers,
        );

        return CacheParameters.parseHeaders(response.headers);
      },
      getRequest: () {
        final request = http.Request('GET', uri);
        if (headers != null) {
          request.headers.addAll(headers);
        }

        return request;
      },
      unwrap: unwrap,
      subject: subject,
    );
  }

  /// Executes a generic request.
  ///
  /// This method is only meant to be used in testing.
  @visibleForTesting
  Future<void> wrap<T, R>({
    required Account account,
    required String cacheKey,
    required BehaviorSubject<Result<T>> subject,
    required AsyncValueGetter<R> request,
    required UnwrapCallback<T, R> unwrap,
    required SerializeCallback<R> serialize,
    required DeserializeCallback<R> deserialize,
    AsyncValueGetter<CacheParameters>? getCacheParameters,
    bool disableTimeout = false,
    Duration timeLimit = kDefaultTimeout,
  }) async {
    if (subject.isClosed) {
      return;
    }
    if (!subject.hasValue) {
      subject.add(Result.loading());
    }

    // Fetch the cached data with the cache parameters.
    final cached = await _cache?.get(account, cacheKey);
    if (subject.isClosed) {
      return;
    }

    if (cached != null) {
      final unwrapped = unwrap(deserialize(cached.value));

      // If the cached data is not expired emit it.
      // Return as the value is up to date.
      if (cached.parameters case CacheParameters(isExpired: false)) {
        subject.add(Result(unwrapped, null, isLoading: false, isCached: true));
        return;
      }

      // Emit the cached data it in a loading state.
      // DO NOT return as new cache parameters or a new value MUST be fetched from the server.
      subject.add(
        subject.value.copyWith(
          data: unwrapped,
          isLoading: true,
          isCached: true,
        ),
      );

      // If the cached data expired and has an etag, try to refresh the cache parameters.
      // If the etag did not change, emit the cached data in a done state.
      // Save the new cache parameters and return.
      if (cached.parameters case CacheParameters(:final etag) when etag != null && getCacheParameters != null) {
        try {
          final newParameters = await timeout(
            getCacheParameters.call,
            timeLimit: timeLimit,
          );
          if (subject.isClosed) {
            return;
          }

          if (newParameters.etag == etag) {
            unawaited(
              _cache?.updateParameters(
                account,
                cacheKey,
                newParameters,
              ),
            );

            subject.add(Result(unwrapped, null, isLoading: false, isCached: true));
            return;
          }
        } on TimeoutException catch (error) {
          _log.info(
            'Fetching cache parameters timed out. Assuming expired.',
            error,
          );
        } on FormatException catch (error) {
          _log.info(
            'Invalid format when parsing cache parameters. Assuming expired.',
            error,
          );
        } on http.ClientException catch (error, stackTrace) {
          _log.warning(
            'Error fetching cache parameters. Assuming expired.',
            error,
            stackTrace,
          );
        }
      }

      // When there was no value in the cache re emit the current result in the subject as loading.
      // DO NOT return as a value MUST be fetched from the server.
    } else if (!subject.value.isLoading) {
      subject.add(subject.value.asLoading());
    }

    for (var i = 0; i < kMaxTries; i++) {
      try {
        final response = await timeout(
          request,
          disableTimeout: disableTimeout,
          timeLimit: timeLimit,
        );
        if (subject.isClosed) {
          return;
        }
        subject.add(Result.success(unwrap(response)));

        final serialized = serialize(response);

        CacheParameters? cacheParameters;
        if (response case DynamiteRawResponse(:final rawHeaders) when rawHeaders != null) {
          try {
            cacheParameters = CacheParameters.parseHeaders(rawHeaders);
          } on FormatException catch (error) {
            _log.info(
              'Invalid format when parsing cache parameters.',
              error,
            );
          }
        }

        await _cache?.set(account, cacheKey, serialized, cacheParameters);
        break;
      } on TimeoutException catch (error, stackTrace) {
        _log.info(
          'Request timeout',
          error,
          stackTrace,
        );

        if (subject.isClosed) {
          return;
        }
        subject.add(
          subject.value.copyWith(
            error: error,
            isLoading: false,
          ),
        );
        break;
      } on http.ClientException catch (error, stackTrace) {
        // Assume the authorization header is from WebDAV if the Content-Type is application/xml,
        // so we can retry with a new CSRF token in case it expired.
        if (error case DynamiteStatusCodeException(statusCode: 401)
            when error.response.headers['content-type']?.split(';').first == 'application/xml') {
          _log.fine('WebDAV authorization error, retrying request with new CSRF token');
          continue;
        }

        if (error is! DynamiteStatusCodeException || error.statusCode < 500) {
          _log.warning(
            'Unexpected status code. The request will not be retried.',
            error,
            stackTrace,
          );

          if (subject.isClosed) {
            return;
          }
          subject.add(
            subject.value.copyWith(
              error: error,
              isLoading: false,
            ),
          );
          break;
        }

        _log.info(
          'Error while executing the request. Retrying ...',
          error,
          stackTrace,
        );
      }
    }
  }

  /// Calls a [callback] that is canceled after a given [timeLimit].
  ///
  /// If the callback completes in time the resulting value is returned.
  /// Otherwise the returned future will be completed with a [TimeoutException].
  /// If the timeout is disabled through [disableTimeout] the future of the
  /// callback is returned immediately.
  Future<T> timeout<T>(
    AsyncValueGetter<T> callback, {
    bool disableTimeout = false,
    Duration timeLimit = kDefaultTimeout,
  }) {
    if (disableTimeout) {
      return callback();
    }

    return callback().timeout(timeLimit);
  }
}

/// Parameters for values in [RequestCache].
@immutable
class CacheParameters {
  /// Creates new cache parameters.
  const CacheParameters({
    required this.etag,
    required this.expires,
  });

  /// Parse the cache parameters from HTTP response headers.
  ///
  /// It will throw a [FormatException] if the expiry date is invalid.
  factory CacheParameters.parseHeaders(Map<String, dynamic> headers) {
    tz.TZDateTime? expiry;
    if (headers.containsKey('expires')) {
      expiry = parseHttpDate(headers['expires']! as String);
    }

    return CacheParameters(
      etag: headers['etag'] as String?,
      expires: _isExpired(expiry) ? null : expiry,
    );
  }

  /// `ETag` of the resource.
  final String? etag;

  /// `Expires` of the resource.
  final tz.TZDateTime? expires;

  /// Whether the resource has expired based on [expires].
  bool get isExpired => _isExpired(expires);

  static bool _isExpired(tz.TZDateTime? date) => date?.isBefore(tz.TZDateTime.now(tz.UTC)) ?? true;

  @override
  bool operator ==(Object other) => other is CacheParameters && other.etag == etag && other.expires == expires;

  @override
  int get hashCode => Object.hashAll([etag, expires]);

  @override
  String toString() => 'CacheParameters(etag: $etag, expires: $expires)';
}
