// ignore_for_file: cascade_invocations

import 'dart:async';
import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart' show internal;
import 'package:neon_framework/src/storage/persistence.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

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
final class SQLitePersistence extends CachedPersistence {
  /// Creates a new sqlite persistence.
  SQLitePersistence({this.prefix = ''});

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
  /// This must be called and completed before any sqlite persistence.
  static Future<void> init(String encryptionKey) async {
    if (database != null) {
      return;
    }

    final appDir = await getApplicationSupportDirectory();
    database = await openDatabase(
      p.join(appDir.path, 'preferences.db'),
      version: 1,
      onConfigure: (db) async {
        final cipherVersion = await db.rawQuery('PRAGMA cipher_version');
        if (cipherVersion.isEmpty) {
          // Make sure that we're actually using SQLCipher, since the pragma used to encrypt
          // databases just fails silently with regular sqlite3 (meaning that we'd accidentally
          // use plaintext databases).
          throw StateError('SQLCipher library is not available, please check your dependencies!');
        }

        // Set the encryption key for the database
        await db.execute("PRAGMA KEY=\"x'$encryptionKey'\"");
      },
      onCreate: onCreate,
    );

    await getAll();
  }

  @visibleForTesting
  static Future<void> onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE "preferences" (
	"prefix"	TEXT NOT NULL,
	"key"	TEXT NOT NULL,
	"value"	TEXT NOT NULL,
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
      final results = await _requireDatabase.rawQuery('SELECT * FROM preferences');

      globalCache.clear();
      for (final result in results) {
        final prefix = result['prefix']! as String;
        final key = result['key']! as String;
        final value = result['value']! as String;

        final cache = globalCache[prefix] ??= {};
        cache[key] = _decode(value) as Object;
      }
    } on DatabaseException catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<bool> clear() async {
    try {
      await _requireDatabase.rawDelete('DELETE FROM preferences WHERE prefix = ?', [prefix]);
      cache.clear();
    } on DatabaseException catch (e) {
      debugPrint(e.toString());
      return false;
    }

    return true;
  }

  @override
  Future<void> reload() async {
    try {
      final fromSystem = <String, Object>{};

      final results = await _requireDatabase.rawQuery('SELECT key, value FROM preferences WHERE prefix = ?', [prefix]);
      for (final result in results) {
        final key = result['key']! as String;
        final value = result['value']! as String;

        fromSystem[key] = _decode(value) as Object;
      }

      cache.clear();
      cache.addAll(fromSystem);
    } on DatabaseException catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<bool> remove(String key) async {
    cache.remove(key);

    try {
      await _requireDatabase.rawDelete('DELETE FROM preferences WHERE prefix = ? AND key = ?', [prefix, key]);
    } on DatabaseException catch (e) {
      debugPrint(e.toString());
      return false;
    }

    return true;
  }

  @override
  Future<bool> setValue(String key, Object value) async {
    cache[key] = value;

    final serialized = _encode(value);

    try {
      await _requireDatabase.execute(
        '''
INSERT INTO preferences (prefix, key, value)
VALUES (?, ?, ?)
ON CONFLICT (prefix, key) DO UPDATE 
SET value = excluded.value
''',
        [prefix, key, serialized],
      );
    } on DatabaseException catch (e) {
      debugPrint(e.toString());
      return false;
    }

    return true;
  }

  static dynamic _decode(String source) => jsonDecode(
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

  static String _encode(Object? object) => jsonEncode(
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
