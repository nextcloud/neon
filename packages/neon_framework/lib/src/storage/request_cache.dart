import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/src/platform/platform.dart';
import 'package:neon_framework/src/utils/request_manager.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

/// A storage used to cache a key value pair.
abstract interface class RequestCache {
  /// Get's the cached value for the given [key].
  ///
  /// Use [getParameters] if you only need to check whether the cache is still
  /// valid.
  Future<String?> get(String key);

  /// Set's the cached [value] at the given [key].
  ///
  /// If a value is already present it will be updated with the new one.
  Future<void> set(String key, String value, CacheParameters? parameters);

  /// Retrieves the cache parameters for the given [key].
  Future<CacheParameters> getParameters(String key);

  /// Updates the cache [parameters] for a given [key] without modifying the `value`.
  Future<void> updateParameters(String key, CacheParameters? parameters);
}

/// Default implementation of the [RequestCache].
///
/// Values are persisted locally in an SQLite database in the application cache
/// directory.
///
/// The database must be initialized with by calling `DefaultRequestCache().init()`
/// and awaiting it's completion. If the database is not yet initialized a
/// `StateError` will be thrown.
@internal
final class DefaultRequestCache implements RequestCache {
  /// Creates a new request cache instance.
  ///
  /// There should be no need to create multiple instances.
  DefaultRequestCache();

  @visibleForTesting
  Database? database;

  /// Initializes this request cache by setting up the backing SQLite database.
  ///
  /// This must called and completed before accessing other methods of the cache.
  Future<void> init(String encryptionKey) async {
    if (database != null) {
      return;
    }

    assert(
      NeonPlatform.instance.canUsePaths,
      'Tried to initialize DefaultRequestCache on a platform without support for paths',
    );
    final cacheDir = await getApplicationCacheDirectory();
    database = await openDatabase(
      p.join(cacheDir.path, 'cache.db'),
      version: 2,
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

  @visibleForTesting
  static Future<void> onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE "cache" (
	"id"	INTEGER UNIQUE,
	"key"	TEXT,
	"value"	TEXT,
	"etag"	TEXT,
	"expires"	INTEGER,
	PRIMARY KEY("id")
);
''');
  }

  Database get _requireDatabase {
    final database = this.database;
    if (database == null) {
      throw StateError(
        'Cache has not been set up yet. Please make sure DefaultRequestCache.init() has been called before and completed.',
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
