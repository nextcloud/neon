part of '../neon.dart';

class RequestManager {
  RequestManager([
    this.cache,
  ]);

  final Cache? cache;

  final bool _enablePrinting = false;

  void _print(final String input) {
    if (_enablePrinting) {
      debugPrint(input);
    }
  }

  Stream<Result<T>> wrapWithoutCache<T>(
    final Future<T> Function() call, {
    final bool disableTimeout = false,
  }) async* {
    yield Result.loading();
    try {
      yield Result.success(await _timeout(disableTimeout, call));
    } on Exception catch (e) {
      debugPrint(e.toString());
      yield Result.error(e);
    }
  }

  Stream<Result<T>> wrapNextcloud<T, R>(
    final String clientID,
    final String k,
    final Future<R> Function() call,
    final T Function(R) unwrap, {
    final bool preloadCache = false,
    final bool preferCache = false,
    final bool disableTimeout = false,
    final T? previousData,
  }) async* {
    yield* _wrap<T, R>(
      clientID,
      k,
      (final s) => json.encode(serialize<R>(s)),
      (final d) => deserialize<R>(json.decode(d)),
      call,
      unwrap: unwrap,
      preloadCache: preloadCache,
      preferCache: preferCache,
      previousData: previousData,
      disableTimeout: disableTimeout,
    );
  }

  Stream<Result<Uint8List>> wrapBytes(
    final String clientID,
    final String k,
    final Future<Uint8List> Function() call, {
    final bool preloadCache = false,
    final bool preferCache = false,
    final bool disableTimeout = false,
    final Uint8List? previousData,
  }) =>
      _wrap<Uint8List, Uint8List>(
        clientID,
        k,
        (final s) => base64.encode(s),
        (final d) => base64.decode(d),
        call,
        preloadCache: preloadCache,
        preferCache: preferCache,
        previousData: previousData,
        disableTimeout: disableTimeout,
      );

  Stream<Result<String>> wrapString(
    final String clientID,
    final String k,
    final Future<String> Function() call, {
    final bool preloadCache = false,
    final bool preferCache = false,
    final bool disableTimeout = false,
    final String? previousData,
  }) =>
      _wrap<String, String>(
        clientID,
        k,
        (final s) => s,
        (final d) => d,
        call,
        preloadCache: preloadCache,
        preferCache: preferCache,
        previousData: previousData,
        disableTimeout: disableTimeout,
      );
  Stream<Result<T>> _wrap<T, R>(
    final String clientID,
    final String k,
    final String Function(R) serialize,
    final R Function(String) deserialize,
    final Future<R> Function() call, {
    final bool preloadCache = false,
    final bool preferCache = false,
    final bool disableTimeout = false,
    T Function(R)? unwrap,
    final T? previousData,
  }) async* {
    unwrap ??= (final a) => a as T;

    if (previousData != null) {
      yield ResultCached(previousData, loading: true);
    } else {
      yield Result.loading();
    }

    final key = '$clientID-$k';

    _print('[Request]: $k');

    if ((preferCache || preloadCache) && cache != null && await cache!.has(key)) {
      _print('[Cache]: $k');
      final s = unwrap(deserialize((await cache!.get(key))!));
      if (preloadCache) {
        yield ResultCached(s, loading: true);
      } else {
        yield Result.success(s);
        return;
      }
    }

    try {
      final response = await _timeout(disableTimeout, call);

      final s = serialize(response);
      _print('[Response]: $k');
      await cache?.set(key, s);

      yield Result.success(unwrap(response));
    } on Exception catch (e) {
      if (cache != null && await cache!.has(key)) {
        _print('[Cache]: $k');
        debugPrint(e.toString());
        yield ResultCached(unwrap(deserialize((await cache!.get(key))!)), error: e);
        return;
      }
      _print('[Failure]: $k');
      debugPrint(e.toString());
      yield Result.error(e);
    }
  }

  Future<T> _timeout<T>(
    final bool disable,
    final Future<T> Function() call,
  ) =>
      disable ? call() : call().timeout(const Duration(seconds: 30));
}

class Cache {
  Cache(this._platform);

  final NeonPlatform _platform;
  Database? _database;

  Future init() async {
    if (_database != null) {
      return;
    }

    _database = await openDatabase(
      p.join(
        await _platform.getApplicationCachePath(),
        'cache.db',
      ),
      version: 1,
      onCreate: (final db, final version) async {
        await db.execute('CREATE TABLE cache (id INTEGER PRIMARY KEY, key TEXT, value TEXT, UNIQUE(key))');
      },
    );
  }

  Future<bool> has(final String key) async =>
      Sqflite.firstIntValue(await _database!.rawQuery('SELECT COUNT(*) FROM cache WHERE key = ?', [key])) == 1;

  Future<String?> get(final String key) async =>
      (await _database!.rawQuery('SELECT value FROM cache WHERE key = ?', [key]))[0]['value'] as String?;

  Future set(final String key, final String value) async => _database!.rawQuery(
        'INSERT INTO cache (key, value) VALUES (?, ?) ON CONFLICT(key) DO UPDATE SET value = excluded.value',
        [key, value],
      );
}

class ResultCached<T> implements Result<T> {
  ResultCached(
    this.data, {
    this.error,
    this.loading = false,
    this.tag = '',
  });

  final T data;

  final Exception? error;

  final bool loading;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(final dynamic other) {
    if (other is! ResultCached<T>) {
      return false;
    }

    // Compare list
    if (other.data is List && data is List) {
      // ignore: no_leading_underscores_for_local_identifiers
      final _otherData = other.data as List;
      // ignore: no_leading_underscores_for_local_identifiers
      final _data = data as List;

      return other.tag == tag && const ListEquality().equals(_otherData, _data);
    }

    return other.tag == tag && other.data == data && other.error.toString() == error.toString();
  }

  @override
  String toString() => 'ResultCached(data: $data, tag: $tag)';

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode => T.hashCode ^ tag.hashCode;

  @override
  String tag;
}

extension ResultDataError<T> on Result<T> {
  T? get data {
    if (this is ResultSuccess<T>) {
      return (this as ResultSuccess<T>).data;
    }

    if (this is ResultCached<T>) {
      return (this as ResultCached<T>).data;
    }

    return null;
  }

  Exception? get error {
    if (this is ResultError<T>) {
      return (this as ResultError<T>).error;
    }

    if (this is ResultCached<T>) {
      return (this as ResultCached<T>).error;
    }

    return null;
  }
}
