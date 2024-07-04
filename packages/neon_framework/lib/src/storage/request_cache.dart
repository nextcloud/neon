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
  /// Gets the cached status code, body and headers for the [request].
  Future<http.Response?> get(Account account, http.Request request);

  /// Sets the cached [response] for the [request].
  ///
  /// If a request is already present it will be updated with the new one.
  Future<void> set(Account account, http.Request request, http.Response response);

  /// Updates the cache [headers] for the [request] without modifying anything else.
  Future<void> updateHeaders(Account account, http.Request request, Map<String, String> headers);
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
      version: 7,
      onCreate: onCreate,
      onUpgrade: (db, oldVersion, newVersion) async {
        // We can safely drop the table as it only contains cached data.
        // Non breaking migrations should not drop the cache. The next
        // breaking change should remove all non breaking migrations before it.
        await db.transaction((txn) async {
          if (oldVersion <= 6) {
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
	"account"              TEXT NOT NULL,
	"request_method"       TEXT NOT NULL,
	"request_url"          TEXT NOT NULL,
	"request_headers"      TEXT NOT NULL,
	"request_body"         BLOB NOT NULL,
	"response_status_code" INTEGER NOT NULL,
	"response_headers"     TEXT NOT NULL,
	"response_body"        BLOB NOT NULL,
	PRIMARY KEY("account", "request_method", "request_url", "request_headers", "request_body")
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
  Future<http.Response?> get(Account account, http.Request request) async {
    List<Map<String, Object?>>? result;
    try {
      result = await _requireDatabase.rawQuery(
        '''
SELECT response_status_code,
       response_headers,
       response_body
FROM cache
WHERE account = ?
  AND request_method = ?
  AND request_url = ?
  AND request_headers = ?
  AND request_body = ?
''',
        [
          account.id,
          request.method.toUpperCase(),
          request.url.toString(),
          json.encode(sanitizeRequestHeaders(request.headers)),
          request.bodyBytes,
        ],
      );
    } on DatabaseException catch (error, stackTrace) {
      _log.severe(
        'Error while getting `$request` from cache.',
        error,
        stackTrace,
      );
    }

    final row = result?.singleOrNull;
    if (row == null) {
      return null;
    }

    return http.Response.bytes(
      row['response_body']! as Uint8List,
      row['response_status_code']! as int,
      headers: (json.decode(row['response_headers']! as String) as Map<String, dynamic>).cast<String, String>(),
    );
  }

  @override
  Future<void> set(Account account, http.Request request, http.Response response) async {
    final encodedRequestHeaders = json.encode(sanitizeRequestHeaders(request.headers));
    final encodedResponseHeaders = json.encode(response.headers);

    try {
      // UPSERT is only available since SQLite 3.24.0 (June 4, 2018).
      // Using a manual solution from https://stackoverflow.com/a/38463024
      final batch = _requireDatabase.batch()
        ..update(
          'cache',
          {
            'account': account.id,
            'request_method': request.method.toUpperCase(),
            'request_url': request.url.toString(),
            'request_headers': encodedRequestHeaders,
            'request_body': request.bodyBytes,
            'response_status_code': response.statusCode,
            'response_headers': encodedResponseHeaders,
            'response_body': response.bodyBytes,
          },
          where: 'account = ? AND request_method = ? AND request_url = ? AND request_headers = ? AND request_body = ?',
          whereArgs: [
            account.id,
            request.method.toUpperCase(),
            request.url.toString(),
            encodedRequestHeaders,
            request.bodyBytes,
          ],
        )
        ..rawInsert(
          '''
INSERT INTO cache (
  account,
  request_method,
  request_url,
  request_headers,
  request_body,
  response_status_code,
  response_headers,
  response_body
)
SELECT ?, ?, ?, ?, ?, ?, ?, ?
WHERE (SELECT changes() = 0)
''',
          [
            account.id,
            request.method.toUpperCase(),
            request.url.toString(),
            encodedRequestHeaders,
            request.bodyBytes,
            response.statusCode,
            encodedResponseHeaders,
            response.bodyBytes,
          ],
        );
      await batch.commit(noResult: true);
    } on DatabaseException catch (error, stackTrace) {
      _log.severe(
        'Error while setting `$request` in the cache.',
        error,
        stackTrace,
      );
    }
  }

  @override
  Future<void> updateHeaders(Account account, http.Request request, Map<String, String> headers) async {
    try {
      await _requireDatabase.update(
        'cache',
        {
          'account': account.id,
          'response_headers': json.encode(headers),
        },
        where: 'account = ? AND request_method = ? AND request_url = ? AND request_headers = ? AND request_body = ?',
        whereArgs: [
          account.id,
          request.method.toUpperCase(),
          request.url.toString(),
          json.encode(sanitizeRequestHeaders(request.headers)),
          request.bodyBytes,
        ],
      );
    } on DatabaseException catch (error, stackTrace) {
      _log.severe(
        'Error while updating headers at `$request`.',
        error,
        stackTrace,
      );
    }
  }

  /// Ensures header names are case-insensitive and removes headers that would potentially prevent caching.
  Map<String, String> sanitizeRequestHeaders(Map<String, String> headers) {
    return headers.map((key, value) => MapEntry(key.toLowerCase(), value))
      ..remove('authorization')
      ..remove('cookie')
      ..remove('user-agent');
  }
}
