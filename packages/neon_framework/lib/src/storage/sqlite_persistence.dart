import 'dart:async';
import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart' show internal;
import 'package:neon_framework/platform.dart';
import 'package:neon_framework/src/storage/persistence.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

final _log = Logger('SQLitePersistence');

/// An SQLite backed cached persistence for preferences.
///
/// There is only one cache backing all `SQLitePersistence` instances.
/// Use the [prefix] to separate different storages.
/// Keys within a storage must be unique.
///
/// The persistence must be initialized with by calling `SQLitePersistence().init()`
/// and awaiting it's completion. If it has not yet initialized a `StateError`
/// will be thrown.
@internal
final class SQLiteCachedPersistence extends CachedPersistence {
  /// Creates a new sqlite persistence.
  SQLiteCachedPersistence({this.prefix = ''});

  /// The prefix of this persistence.
  ///
  /// Keys within it must be unique.
  final String prefix;

  @override
  Map<String, Object> get cache => globalCache[prefix] ??= {};

  @visibleForTesting
  static final Map<String, Map<String, Object>> globalCache = {};

  @visibleForTesting
  static Database? database;

  /// Initializes all persistences by setting up the backing SQLite database
  /// and priming the global cache.
  ///
  /// This must be called and completed before accessing any other methods of
  /// the sqlite persistence.
  static Future<void> init() async {
    if (database != null) {
      return;
    }

    var path = 'preferences.db';
    if (NeonPlatform.instance.canUsePaths) {
      final appDir = await getApplicationSupportDirectory();
      path = p.join(appDir.path, path);
    }

    database = await openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
    );

    await getAll();
  }

  @visibleForTesting
  static Future<void> onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE "preferences" (
	"prefix"  TEXT NOT NULL,
	"key"     TEXT NOT NULL,
	"value"   TEXT NOT NULL,
	PRIMARY KEY("prefix","key"),
	UNIQUE("key","prefix")
);
''');
  }

  static Database get _requireDatabase {
    if (database == null) {
      throw StateError(
        'Persistence has not been set up yet. Please make sure SQLitePersistence.init() has been called before and completed.',
      );
    }

    return database!;
  }

  @visibleForTesting
  static Future<void> getAll() async {
    try {
      final results = await _requireDatabase.rawQuery('''
SELECT prefix, key, value
FROM preferences
''');

      globalCache.clear();
      for (final result in results) {
        final prefix = result['prefix']! as String;
        final key = result['key']! as String;
        final value = result['value']! as String;

        final cache = globalCache[prefix] ??= {};
        cache[key] = _decode(value) as Object;
      }
    } on DatabaseException catch (error) {
      _log.warning(
        'Error fetching all values from the SQLite persistence.',
        error,
      );
    }
  }

  @override
  Future<bool> clear() async {
    try {
      await _requireDatabase.rawDelete(
        '''
DELETE FROM preferences
WHERE prefix = ?
''',
        [prefix],
      );
      cache.clear();
    } on DatabaseException catch (error) {
      _log.warning(
        'Error clearing the SQLite persistence.',
        error,
      );

      return false;
    }

    return true;
  }

  @override
  Future<void> reload() async {
    try {
      final fromSystem = <String, Object>{};

      final results = await _requireDatabase.rawQuery(
        '''
SELECT key, value
FROM preferences
WHERE prefix = ?
''',
        [prefix],
      );
      for (final result in results) {
        final key = result['key']! as String;
        final value = result['value']! as String;

        fromSystem[key] = _decode(value) as Object;
      }

      cache
        ..clear()
        ..addAll(fromSystem);
    } on DatabaseException catch (error) {
      _log.warning(
        'Error reloading the SQLite persistence.',
        error,
      );
    }
  }

  @override
  Future<bool> remove(String key) async {
    try {
      await _requireDatabase.rawDelete(
        '''
DELETE FROM preferences
WHERE 
  prefix = ?
  AND key = ?
''',
        [prefix, key],
      );

      cache.remove(key);
    } on DatabaseException catch (error) {
      _log.warning(
        'Error removing the value from the SQLite persistence.',
        error,
      );
      return false;
    }

    return true;
  }

  @override
  Future<bool> setValue(String key, Object value) async {
    final serialized = _encode(value);

    try {
      // UPSERT is only available since SQLite 3.24.0 (June 4, 2018).
      // Using a manual solution from https://stackoverflow.com/a/38463024
      final batch = _requireDatabase.batch()
        ..update(
          'preferences',
          {
            'prefix': prefix,
            'key': key,
            'value': serialized,
          },
          where: 'prefix = ? AND key = ?',
          whereArgs: [prefix, key],
        )
        ..rawInsert(
          '''
INSERT INTO preferences (prefix, key, value)
SELECT ?, ?, ?
WHERE (SELECT changes() = 0)
''',
          [prefix, key, serialized],
        );
      await batch.commit(noResult: true);

      cache[key] = value;
    } on DatabaseException catch (error) {
      _log.warning(
        'Error updating the storage value.',
        error,
      );

      return false;
    }

    return true;
  }

  static dynamic _decode(String source) => json.decode(
        source,
        reviver: (key, value) {
          switch (value) {
            case List():
              return BuiltList<dynamic>.from(value);
            case Map():
              return BuiltMap<dynamic, dynamic>.from(value);
            case _:
              return value;
          }
        },
      );

  static String _encode(dynamic object) => json.encode(
        object,
        toEncodable: (nonEncodable) {
          switch (nonEncodable) {
            case BuiltList():
              return nonEncodable.toList();
            case BuiltMap():
              return nonEncodable.toMap();
            case _:
              return nonEncodable;
          }
        },
      );
}
