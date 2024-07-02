import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/src/platform/platform.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

final _log = Logger('RequestCache');

/// A storage used to cache HTTP requests.
abstract interface class RequestCache {
  /// Gets the cached status code, body and headers for the given [key].
  Future<http.Response?> get(Account account, String key);

  /// Sets the cached [response] at the given [key].
  ///
  /// If a request is already present it will be updated with the new one.
  Future<void> set(Account account, String key, http.Response response);

  /// Updates the cache [headers] for a given [key] without modifying anything else.
  Future<void> updateHeaders(Account account, String key, Map<String, String> headers);
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
  Future<void> init() async {
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
      version: 6,
      onCreate: onCreate,
      onUpgrade: (db, oldVersion, newVersion) async {
        // We can safely drop the table as it only contains cached data.
        // Non breaking migrations should not drop the cache. The next
        // breaking change should remove all non breaking migrations before it.
        await db.transaction((txn) async {
          if (oldVersion <= 5) {
            await txn.execute('DROP TABLE cache');
            await onCreate(txn);
          }
        });
      },
    );
  }

  @visibleForTesting
  static Future<void> onCreate(DatabaseExecutor db, [int? version]) async {
    await db.execute('''
CREATE TABLE "cache" (
	"account"    TEXT NOT NULL,
	"key"        TEXT NOT NULL,
	"statusCode" INTEGER NOT NULL,
	"body"       BLOB NOT NULL,
	"headers"    TEXT NOT NULL,
	PRIMARY KEY("key", "account")
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
  Future<http.Response?> get(Account account, String key) async {
    List<Map<String, Object?>>? result;
    try {
      result = await _requireDatabase.rawQuery(
        '''
SELECT statusCode, body, headers
FROM cache
WHERE account = ? AND key = ?
''',
        [account.id, key],
      );
    } on DatabaseException catch (error, stackTrace) {
      _log.severe(
        'Error while getting `$key` from cache.',
        error,
        stackTrace,
      );
    }

    final row = result?.singleOrNull;
    if (row == null) {
      return null;
    }

    return http.Response.bytes(
      row['body']! as Uint8List,
      row['statusCode']! as int,
      headers: (json.decode(row['headers']! as String) as Map<String, dynamic>).cast<String, String>(),
    );
  }

  @override
  Future<void> set(Account account, String key, http.Response response) async {
    final encodedHeaders = json.encode(response.headers);

    try {
      // UPSERT is only available since SQLite 3.24.0 (June 4, 2018).
      // Using a manual solution from https://stackoverflow.com/a/38463024
      final batch = _requireDatabase.batch()
        ..update(
          'cache',
          {
            'account': account.id,
            'key': key,
            'statusCode': response.statusCode,
            'body': response.bodyBytes,
            'headers': encodedHeaders,
          },
          where: 'account = ? AND key = ?',
          whereArgs: [account.id, key],
        )
        ..rawInsert(
          '''
INSERT INTO cache (account, key, statusCode, body, headers)
SELECT ?, ?, ?, ?, ?
WHERE (SELECT changes() = 0)
''',
          [
            account.id,
            key,
            response.statusCode,
            response.bodyBytes,
            encodedHeaders,
          ],
        );
      await batch.commit(noResult: true);
    } on DatabaseException catch (error, stackTrace) {
      _log.severe(
        'Error while setting `$key` in the cache.',
        error,
        stackTrace,
      );
    }
  }

  @override
  Future<void> updateHeaders(Account account, String key, Map<String, String> headers) async {
    try {
      await _requireDatabase.update(
        'cache',
        {
          'account': account.id,
          'headers': json.encode(headers),
        },
        where: 'account = ? AND key = ?',
        whereArgs: [account.id, key],
      );
    } on DatabaseException catch (error, stackTrace) {
      _log.severe(
        'Error while updating headers at `$key`.',
        error,
        stackTrace,
      );
    }
  }
}
