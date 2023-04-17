part of '../neon.dart';

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
  }) async {
    if (subject.valueOrNull?.data != null) {
      subject.add(
        Result(
          subject.value.data,
          null,
          loading: true,
          cached: true,
        ),
      );
    } else {
      subject.add(Result.loading());
    }

    final key = '$clientID-$k';

    if (cache != null && await cache!.has(key)) {
      try {
        subject.add(
          Result(
            unwrap(deserializeNextcloud<R>(json.decode((await cache!.get(key))!) as Object)),
            null,
            loading: true,
            cached: true,
          ),
        );
      } catch (e, s) {
        debugPrint(e.toString());
        debugPrint(s.toString());
      }
    }

    try {
      final response = await (disableTimeout ? call() : timeout(call));
      await cache?.set(key, json.encode(response, toEncodable: serializeNextcloud));
      subject.add(Result.success(unwrap(response)));
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      if (cache != null && await cache!.has(key)) {
        try {
          subject.add(
            Result(
              unwrap(deserializeNextcloud<R>(json.decode((await cache!.get(key))!) as Object)),
              null,
              loading: false,
              cached: true,
            ),
          );
          return;
        } catch (e, s) {
          debugPrint(e.toString());
          debugPrint(s.toString());
        }
      }
      subject.add(Result.error(e));
    }
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
