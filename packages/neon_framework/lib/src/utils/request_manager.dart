import 'dart:async';
import 'dart:convert';

import 'package:built_value/serializer.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/src/bloc/result.dart';
import 'package:neon_framework/src/models/account.dart';
import 'package:neon_framework/storage.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:xml/xml.dart' as xml;

/// A callback that unwraps elements of type [R] into [T].
///
/// This is commonly used to get the relevant information from a broader response.
typedef UnwrapCallback<T, R> = T Function(R);

/// A callback to serialize a value of type [T] into a string.
///
/// This is used to store a value in the cache.
@internal
typedef SerializeCallback<T> = String Function(T);

/// A callback to revive cached values [String] into their original type [T].
@internal
typedef DeserializeCallback<T> = T Function(String);

/// How often a request will be tried.
///
/// A request will not be retried if the returned status code is in the `500`
/// range or if the request has timed out.
const kMaxRetries = 3;

/// The default timeout for requests.
///
/// Requests that take longer than this duration will be canceled.
const kDefaultTimeout = Duration(seconds: 30);

/// Implements https://www.rfc-editor.org/rfc/rfc9110#name-date-time-formats
@visibleForTesting
final httpDateFormat = DateFormat('E, d MMM yyyy HH:mm:ss v', 'en_US');

/// A singleton class that handles requests to the Nextcloud API.
///
/// Requests need to be made through the [nextcloud](https://pub.dev/packages/nextcloud)
/// package.
///
/// Requests can be persisted in the local cache if enabled. The local cache
/// must be initialized through [initCache]. A network request is always made,
/// even if a value already exists in the cache. The cached value will only be
/// emitted when the network request has not yet finished.
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

  /// Initializes the cache.
  ///
  /// Requests made before this method has completed will not be persisted in the cache.
  Future<void> initCache() async {
    final cache = Cache();
    await cache.init();

    _cache = cache;
  }

  Cache? _cache;

  /// Executes a request to a Nextcloud API endpoint.
  Future<void> wrapNextcloud<T, B, H>({
    required Account account,
    required String cacheKey,
    required BehaviorSubject<Result<T>> subject,
    required DynamiteRawResponse<B, H> rawResponse,
    required UnwrapCallback<T, DynamiteResponse<B, H>> unwrap,
    bool disableTimeout = false,
  }) async =>
      wrap<T, DynamiteRawResponse<B, H>>(
        account: account,
        cacheKey: cacheKey,
        subject: subject,
        request: () async {
          await rawResponse.future;

          return rawResponse;
        },
        unwrap: (rawResponse) => unwrap(rawResponse.response),
        serialize: (data) => json.encode(data),
        deserialize: (data) => DynamiteRawResponse<B, H>.fromJson(
          json.decode(data) as Map<String, Object?>,
          serializers: rawResponse.serializers,
          bodyType: rawResponse.bodyType,
          headersType: rawResponse.headersType,
        ),
        disableTimeout: disableTimeout,
      );

  /// Executes a WebDAV request.
  Future<void> wrapWebDav<T>({
    required Account account,
    required String cacheKey,
    required BehaviorSubject<Result<T>> subject,
    required AsyncValueGetter<WebDavMultistatus> request,
    required UnwrapCallback<T, WebDavMultistatus> unwrap,
    bool disableTimeout = false,
  }) async =>
      wrap<T, WebDavMultistatus>(
        account: account,
        cacheKey: cacheKey,
        subject: subject,
        request: request,
        unwrap: unwrap,
        serialize: (data) => data.toXmlElement(namespaces: namespaces).toXmlString(),
        deserialize: (data) => WebDavMultistatus.fromXmlElement(xml.XmlDocument.parse(data).rootElement),
        disableTimeout: disableTimeout,
      );

  /// Executes a HTTP request for binary content.
  Future<void> wrapBinary({
    required Account account,
    required String cacheKey,
    required AsyncValueGetter<CacheParameters> getCacheParameters,
    required DynamiteRawResponse<Uint8List, dynamic> rawResponse,
    required UnwrapCallback<Uint8List, Uint8List>? unwrap,
    required BehaviorSubject<Result<Uint8List>> subject,
    bool disableTimeout = false,
  }) async =>
      wrap<Uint8List, DynamiteRawResponse<Uint8List, dynamic>>(
        account: account,
        cacheKey: cacheKey,
        subject: subject,
        request: () async {
          await rawResponse.future;
          return rawResponse;
        },
        unwrap: (rawResponse) {
          var data = rawResponse.response.body;
          if (unwrap != null) {
            data = unwrap(data);
          }

          return data;
        },
        serialize: (rawResponse) => base64.encode(rawResponse.response.body),
        deserialize: (data) => DynamiteRawResponse<Uint8List, Map<String, String>>.fromJson(
          {
            'statusCode': 200,
            'body': base64.decode(data),
            'headers': <String, String>{},
          },
          bodyType: const FullType(Uint8List),
          headersType: const FullType(Map, [FullType(String), FullType(String)]),
          serializers: Serializers(),
        ),
        getCacheParameters: getCacheParameters,
        disableTimeout: disableTimeout,
      );

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
        final response = await account.client.executeRawRequest(
          'HEAD',
          uri,
          headers: headers,
        );

        return CacheParameters.parseHeaders(response.headers);
      },
      rawResponse: DynamiteRawResponse<Uint8List, Map<String, String>>(
        response: account.client.executeRawRequest(
          'GET',
          uri,
          headers: headers,
          validStatuses: const {200, 201},
        ),
        bodyType: const FullType(Uint8List),
        headersType: const FullType(Map, [FullType(String), FullType(String)]),
        serializers: Serializers(),
      ),
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
    int retries = 0,
  }) async {
    final key = '${account.id}-$cacheKey';

    if (retries == 0) {
      // emit loading state with the current value if present
      final value = subject.valueOrNull?.asLoading() ?? Result.loading();
      subject.add(value);

      final cachedParameters = await _cache?.getParameters(key);

      if (cachedParameters != null) {
        if (cachedParameters.expires != null && !cachedParameters.isExpired) {
          final cachedValue = await _cache?.get(key);
          if (cachedValue != null) {
            subject.add(Result(unwrap(deserialize(cachedValue)), null, isLoading: false, isCached: true));
            return;
          }
        }

        if (cachedParameters.etag != null) {
          final cacheParameters = await timeout(
            () async => getCacheParameters?.call(),
            timeLimit: timeLimit,
          );
          if (cacheParameters != null && cacheParameters.etag == cachedParameters.etag) {
            final cachedValue = await _cache?.get(key);
            if (cachedValue != null) {
              unawaited(
                _cache?.updateParameters(
                  key,
                  cacheParameters,
                ),
              );
              subject.add(Result(unwrap(deserialize(cachedValue)), null, isLoading: false, isCached: true));
              return;
            }
          }
        }
      }

      final cachedValue = await _cache?.get(key);
      if (cachedValue != null) {
        subject.add(
          subject.value.copyWith(
            data: unwrap(deserialize(cachedValue)),
            isLoading: true,
            isCached: true,
          ),
        );
      }
    }

    try {
      final response = await timeout(
        request,
        disableTimeout: disableTimeout,
        timeLimit: timeLimit,
      );
      subject.add(Result.success(unwrap(response)));

      final serialized = serialize(response);

      CacheParameters? cacheParameters;
      if (response is DynamiteRawResponse && response.rawHeaders != null) {
        cacheParameters = CacheParameters.parseHeaders(response.rawHeaders!);
      }

      await _cache?.set(key, serialized, cacheParameters);
    } on TimeoutException catch (e, s) {
      debugPrint('Request timed out ...');
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s, maxFrames: 5);

      _emitError<T>(e, subject);
    } on http.ClientException catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s, maxFrames: 5);

      if (e is DynamiteStatusCodeException && e.statusCode >= 500 && retries < kMaxRetries) {
        debugPrint('Retrying...');
        await wrap(
          account: account,
          cacheKey: cacheKey,
          subject: subject,
          request: request,
          unwrap: unwrap,
          serialize: serialize,
          deserialize: deserialize,
          disableTimeout: disableTimeout,
          timeLimit: timeLimit,
          retries: retries + 1,
        );
      } else {
        _emitError<T>(e, subject);
      }
    }
  }

  /// Re emits the current result with the given [error].
  ///
  /// Defaults to a [Result.error] if none has been emitted yet.
  void _emitError<T>(
    Object error,
    BehaviorSubject<Result<T>> subject,
  ) {
    final value = subject.valueOrNull?.copyWith(error: error, isLoading: false) ?? Result.error(error);
    subject.add(value);
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

@internal
class Cache implements CacheInterface {
  factory Cache() => instance ??= Cache._();

  Cache._();

  @visibleForTesting
  factory Cache.mocked(Cache mocked) => instance = mocked;

  @visibleForTesting
  static Cache? instance;

  Database? _database;

  Future<void> init() async {
    if (_database != null) {
      return;
    }

    final cacheDir = await getApplicationCacheDirectory();
    _database = await openDatabase(
      p.join(cacheDir.path, 'cache.db'),
      version: 2,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE cache (id INTEGER PRIMARY KEY, key TEXT, value TEXT, etag TEXT, expires INTEGER, UNIQUE(key))',
        );
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        final batch = db.batch();
        if (oldVersion == 1) {
          batch
            ..execute('ALTER TABLE cache ADD COLUMN etag TEXT')
            ..execute('ALTER TABLE cache ADD COLUMN expires INTEGER');
        }
        await batch.commit();
      },
    );
  }

  Database get _requireDatabase {
    final database = _database;
    if (database == null) {
      throw StateError(
        'Cache has not been set up yet. Please make sure Cache.init() has been called before and completed.',
      );
    }

    return database;
  }

  @override
  Future<String?> get(String key) async {
    List<Map<String, Object?>>? result;
    try {
      result = await _requireDatabase.rawQuery('SELECT value FROM cache WHERE key = ?', [key]);
    } on DatabaseException catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s, maxFrames: 5);
    }

    return result?.firstOrNull?['value'] as String?;
  }

  @override
  Future<void> set(String key, String value, CacheParameters? parameters) async {
    try {
      // UPSERT is only available since SQLite 3.24.0 (June 4, 2018).
      // Using a manual solution from https://stackoverflow.com/a/38463024
      final batch = _requireDatabase.batch()
        ..update(
          'cache',
          {
            'key': key,
            'value': value,
            'etag': parameters?.etag,
            'expires': parameters?.expires?.millisecondsSinceEpoch,
          },
          where: 'key = ?',
          whereArgs: [key],
        )
        ..rawInsert(
          'INSERT INTO cache (key, value, etag, expires) SELECT ?, ?, ?, ? WHERE (SELECT changes() = 0)',
          [key, value, parameters?.etag, parameters?.expires?.millisecondsSinceEpoch],
        );
      await batch.commit(noResult: true);
    } on DatabaseException catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s, maxFrames: 5);
    }
  }

  @override
  Future<CacheParameters> getParameters(String key) async {
    List<Map<String, Object?>>? result;
    try {
      result = await _requireDatabase.rawQuery('SELECT etag, expires FROM cache WHERE key = ?', [key]);
    } on DatabaseException catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s, maxFrames: 5);
    }

    final row = result?.firstOrNull;

    final expires = row?['expires'] as int?;
    return CacheParameters(
      etag: row?['etag'] as String?,
      expires: expires != null ? DateTime.fromMillisecondsSinceEpoch(expires) : null,
    );
  }

  @override
  Future<void> updateParameters(String key, CacheParameters? parameters) async {
    try {
      await _requireDatabase.update(
        'cache',
        {
          'etag': parameters?.etag,
          'expires': parameters?.expires?.millisecondsSinceEpoch,
        },
        where: 'key = ?',
        whereArgs: [key],
      );
    } on DatabaseException catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s, maxFrames: 5);
    }
  }
}

/// Parameters for values in [Cache].
@immutable
class CacheParameters {
  /// Creates new cache parameters.
  const CacheParameters({
    required this.etag,
    required this.expires,
  });

  /// Parse the cache parameters from HTTP response headers.
  factory CacheParameters.parseHeaders(Map<String, dynamic> headers) {
    final expiry = headers.containsKey('expires') ? httpDateFormat.parse(headers['expires']! as String) : null;
    return CacheParameters(
      etag: headers['etag'] as String?,
      expires: _isExpired(expiry) ? null : expiry,
    );
  }

  /// `ETag` of the resource.
  final String? etag;

  /// `Expires` of the resource.
  final DateTime? expires;

  /// Whether the resource has expired based on [expires].
  bool get isExpired => _isExpired(expires);

  static bool _isExpired(DateTime? date) => date?.isBefore(DateTime.now()) ?? true;

  @override
  bool operator ==(Object other) => other is CacheParameters && other.etag == etag && other.expires == expires;

  @override
  int get hashCode => Object.hashAll([etag, expires]);

  @override
  String toString() => 'CacheParameters(etag: $etag, expires: $expires)';
}
