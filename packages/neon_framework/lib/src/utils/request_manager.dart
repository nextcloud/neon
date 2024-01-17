import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/src/bloc/result.dart';
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

/// A callback that retrieves a value of type [R] from the Nextcloud API.
typedef NextcloudApiCallback<R> = AsyncValueGetter<R>;

/// How often a request will be tried.
///
/// A request will not be retried if the returned status code is in the `500`
/// range or if the request has timed out.
const kMaxRetries = 3;

/// The default timeout for requests.
///
/// Requests that take longer than this duration will be canceled.
const kDefaultTimeout = Duration(seconds: 30);

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
  Future<void> wrapNextcloud<T, B, H>(
    String clientID,
    String k,
    BehaviorSubject<Result<T>> subject,
    DynamiteRawResponse<B, H> rawResponse,
    UnwrapCallback<T, DynamiteResponse<B, H>> unwrap, {
    bool disableTimeout = false,
  }) async =>
      _wrap<T, DynamiteRawResponse<B, H>>(
        clientID,
        k,
        subject,
        () async {
          await rawResponse.future;

          return rawResponse;
        },
        (rawResponse) => unwrap(rawResponse.response),
        (data) => json.encode(data),
        (data) => DynamiteRawResponse<B, H>.fromJson(
          json.decode(data) as Map<String, Object?>,
          serializers: rawResponse.serializers,
          bodyType: rawResponse.bodyType,
          headersType: rawResponse.headersType,
        ),
        disableTimeout,
      );

  /// Executes a WebDAV request.
  Future<void> wrapWebDav<T>(
    String clientID,
    String k,
    BehaviorSubject<Result<T>> subject,
    NextcloudApiCallback<WebDavMultistatus> call,
    UnwrapCallback<T, WebDavMultistatus> unwrap, {
    bool disableTimeout = false,
    bool emitEmptyCache = false,
  }) async =>
      _wrap<T, WebDavMultistatus>(
        clientID,
        k,
        subject,
        call,
        unwrap,
        (data) => data.toXmlElement(namespaces: namespaces).toXmlString(),
        (data) => WebDavMultistatus.fromXmlElement(xml.XmlDocument.parse(data).rootElement),
        disableTimeout,
        emitEmptyCache,
      );

  Future<void> _wrap<T, R>(
    String clientID,
    String k,
    BehaviorSubject<Result<T>> subject,
    NextcloudApiCallback<R> call,
    UnwrapCallback<T, R> unwrap,
    SerializeCallback<R> serialize,
    DeserializeCallback<R> deserialize, [
    bool disableTimeout = false,
    bool emitEmptyCache = false,
    int retries = 0,
  ]) async {
    // emit loading state with the current value if present
    final value = subject.valueOrNull?.asLoading() ?? Result.loading();
    subject.add(value);

    final key = '$clientID-$k';

    unawaited(
      _emitCached(
        key,
        subject,
        unwrap,
        deserialize,
        emitEmptyCache,
      ),
    );

    try {
      final response = await timeout(call, disableTimeout: disableTimeout);
      subject.add(Result.success(unwrap(response)));

      final serialized = serialize(response);
      await _cache?.set(key, serialized);
    } on TimeoutException catch (e, s) {
      debugPrint('Request timed out ...');
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s, maxFrames: 5);

      _emitError<T>(e, subject);
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s, maxFrames: 5);

      if (e is DynamiteApiException && e.statusCode >= 500 && retries < kMaxRetries) {
        debugPrint('Retrying...');
        await _wrap(
          clientID,
          k,
          subject,
          call,
          unwrap,
          serialize,
          deserialize,
          disableTimeout,
          emitEmptyCache,
          retries + 1,
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

  Future<bool> _emitCached<T, R>(
    String key,
    BehaviorSubject<Result<T>> subject,
    UnwrapCallback<T, R> unwrap,
    DeserializeCallback<R> deserialize,
    bool emitEmptyCache,
  ) async {
    try {
      final cacheValue = await _cache?.get(key);
      if (cacheValue != null) {
        final cached = unwrap(deserialize(cacheValue));

        // If the network fetch is faster than fetching the cached value the
        // subject can be closed before emitting.
        if (subject.value.hasUncachedData) {
          return true;
        }

        subject.add(
          subject.value.copyWith(
            data: cached,
            isCached: true,
          ),
        );

        return true;
      }
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s, maxFrames: 5);
    }

    if (emitEmptyCache && !subject.value.hasUncachedData) {
      subject.add(
        subject.value.copyWith(
          isCached: true,
        ),
      );

      return true;
    }

    return false;
  }

  /// Calls a [callback] that is canceled after a given [timeout].
  ///
  /// If the callback completes in time the resulting value is returned.
  /// Otherwise the returned future will be completed with a [TimeoutException].
  /// If the timeout is disabled through [disableTimeout] the future of the
  /// callback is returned immediately.
  Future<T> timeout<T>(
    NextcloudApiCallback<T> callback, {
    bool disableTimeout = false,
    Duration timeout = kDefaultTimeout,
  }) {
    if (disableTimeout) {
      return callback();
    }

    return callback().timeout(timeout);
  }
}

@internal
class Cache {
  Database? _database;

  Future<void> init() async {
    if (_database != null) {
      return;
    }

    final cacheDir = await getApplicationCacheDirectory();
    _database = await openDatabase(
      p.join(cacheDir.path, 'cache.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('CREATE TABLE cache (id INTEGER PRIMARY KEY, key TEXT, value TEXT, UNIQUE(key))');
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

  Future<String?> get(String key) async {
    final result = await _requireDatabase.rawQuery('SELECT value FROM cache WHERE key = ?', [key]);

    return result.firstOrNull?['value'] as String?;
  }

  Future<void> set(String key, String value) async {
    // UPSERT is only available since SQLite 3.24.0 (June 4, 2018).
    // Using a manual solution from https://stackoverflow.com/a/38463024
    final batch = _requireDatabase.batch()
      ..update('cache', {'key': key, 'value': value}, where: 'key = ?', whereArgs: [key])
      ..rawInsert('INSERT INTO cache (key, value) SELECT ?, ? WHERE (SELECT changes() = 0)', [key, value]);
    await batch.commit(noResult: true);
  }
}
