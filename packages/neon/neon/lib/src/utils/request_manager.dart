part of '../../neon.dart';

class RequestManager {
  RequestManager([
    this.cache,
  ]);

  final Cache? cache;

  Future wrapNextcloud<T, R>(
    final String clientID,
    final String k,
    final BehaviorSubject<Result<T>> subject,
    final Future<R> Function() call,
    final T Function(R) unwrap, {
    final bool disableTimeout = false,
    final bool emitEmptyCache = false,
  }) async =>
      _wrap<T, R>(
        clientID,
        k,
        subject,
        call,
        unwrap,
        (final data) => json.encode(serializeNextcloud<R>(data)),
        (final data) => deserializeNextcloud<R>(json.decode(data) as Object),
        disableTimeout,
        emitEmptyCache,
        0,
      );

  Future wrapWebDav<T>(
    final String clientID,
    final String k,
    final BehaviorSubject<Result<T>> subject,
    final Future<WebDavMultistatus> Function() call,
    final T Function(WebDavMultistatus) unwrap, {
    final bool disableTimeout = false,
    final bool emitEmptyCache = false,
  }) async =>
      _wrap<T, WebDavMultistatus>(
        clientID,
        k,
        subject,
        call,
        unwrap,
        (final data) => data.toXmlElement(namespaces: namespaces).toXmlString(),
        (final data) => WebDavMultistatus.fromXmlElement(xml.XmlDocument.parse(data).rootElement),
        disableTimeout,
        emitEmptyCache,
        0,
      );

  Future _wrap<T, R>(
    final String clientID,
    final String k,
    final BehaviorSubject<Result<T>> subject,
    final Future<R> Function() call,
    final T Function(R) unwrap,
    final String Function(R) serialize,
    final R Function(String) deserialize,
    final bool disableTimeout,
    final bool emitEmptyCache,
    final int retries,
  ) async {
    if (subject.valueOrNull?.hasData ?? false) {
      subject.add(
        Result(
          subject.value.data,
          null,
          isLoading: true,
          isCached: true,
        ),
      );
    } else {
      subject.add(Result.loading());
    }

    final key = '$clientID-$k';

    await _emitCached(
      key,
      subject,
      unwrap,
      deserialize,
      emitEmptyCache,
      true,
      null,
    );

    try {
      final response = await (disableTimeout ? call() : timeout(call));
      await cache?.set(key, await compute(serialize, response));
      subject.add(Result.success(unwrap(response)));
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      if (e is DynamiteApiException && e.statusCode >= 500 && retries < 3) {
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
        return;
      }
      if (!(await _emitCached(
        key,
        subject,
        unwrap,
        deserialize,
        emitEmptyCache,
        false,
        e,
      ))) {
        subject.add(Result.error(e));
      }
    }
  }

  Future<bool> _emitCached<T, R>(
    final String key,
    final BehaviorSubject<Result<T>> subject,
    final T Function(R) unwrap,
    final R Function(String) deserialize,
    final bool emitEmptyCache,
    final bool loading,
    final Object? error,
  ) async {
    T? cached;
    try {
      if (cache != null && await cache!.has(key)) {
        cached = unwrap(await compute(deserialize, (await cache!.get(key))!));
      }
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
    }
    if (cached != null || emitEmptyCache) {
      subject.add(
        Result(
          cached,
          error,
          isLoading: loading,
          isCached: true,
        ),
      );
      return true;
    }
    return false;
  }

  static Future<T> timeout<T>(
    final Future<T> Function() call,
  ) =>
      call().timeout(const Duration(seconds: 30));
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
