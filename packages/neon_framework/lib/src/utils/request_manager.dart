// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/src/bloc/result.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sqflite/sqflite.dart';
import 'package:xml/xml.dart' as xml;

typedef UnwrapCallback<T, R> = T Function(R);
typedef SerializeCallback<T> = String Function(T);
typedef DeserializeCallback<T> = T Function(String);
typedef NextcloudApiCallback<T> = AsyncValueGetter<T>;

const maxRetries = 3;
const defaultTimeout = Duration(seconds: 30);

class RequestManager {
  RequestManager();

  @visibleForTesting
  factory RequestManager.mocked(RequestManager requestManager) => _requestManager = requestManager;

  static RequestManager? _requestManager;

  /// Gets the current instance of [RequestManager].
  // ignore: prefer_constructors_over_static_methods
  static RequestManager get instance => _requestManager ??= RequestManager();

  Future<void> initCache() async {
    final cache = Cache();
    await cache.init();

    _cache = cache;
  }

  Cache? _cache;

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

      if (e is DynamiteApiException && e.statusCode >= 500 && retries < maxRetries) {
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
    if (_cache != null && await _cache!.has(key)) {
      try {
        final cacheValue = await _cache!.get(key);
        final cached = unwrap(deserialize(cacheValue!));

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
      } catch (e, s) {
        debugPrint(e.toString());
        debugPrintStack(stackTrace: s, maxFrames: 5);
      }
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

  Future<T> timeout<T>(
    NextcloudApiCallback<T> call, {
    bool disableTimeout = false,
    Duration timeout = const Duration(seconds: 30),
  }) {
    if (disableTimeout) {
      return call();
    }

    return call().timeout(timeout);
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

  Future<bool> has(String key) async =>
      Sqflite.firstIntValue(await _requireDatabase.rawQuery('SELECT COUNT(*) FROM cache WHERE key = ?', [key])) == 1;

  Future<String?> get(String key) async =>
      (await _requireDatabase.rawQuery('SELECT value FROM cache WHERE key = ?', [key]))[0]['value'] as String?;

  Future<void> set(String key, String value) async => _requireDatabase.rawQuery(
        'INSERT INTO cache (key, value) VALUES (?, ?) ON CONFLICT(key) DO UPDATE SET value = excluded.value',
        [key, value],
      );
}
