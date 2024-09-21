import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:neon_storage/neon_sqlite.dart';
import 'package:neon_storage/neon_storage.dart';
import 'package:sqflite_common/sqlite_api.dart';

final _log = Logger('RequestCache');

final class _SQLiteRequestCacheTable extends Table {
  @override
  String get name => 'request_cache';

  @override
  int get version => 7;

  @override
  void onCreate(Batch db, int version) {
    db.execute('''
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
}

/// Default implementation of the [RequestCache].
///
/// Values are persisted locally in an SQLite table.database in the application cache
/// directory.
///
/// The table.database must be initialized with by calling `DefaultRequestCache().init()`
/// and awaiting it's completion. If the table.database is not yet initialized a
/// `StateError` will be thrown.
final class SQLiteRequestCache implements RequestCache {
  /// Creates a new request cache instance.
  ///
  /// There should be no need to create multiple instances.
  const SQLiteRequestCache();

  /// The sqlite table backing this storage.
  static final Table table = _SQLiteRequestCacheTable();

  static Database get _database => table.controller.database;

  @override
  Future<http.Response?> get(String accountID, http.Request request) async {
    List<Map<String, Object?>>? result;
    try {
      result = await _database.rawQuery(
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
          accountID,
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
  Future<void> set(String accountID, http.Request request, http.Response response) async {
    final encodedRequestHeaders = json.encode(sanitizeRequestHeaders(request.headers));
    final encodedResponseHeaders = json.encode(response.headers);

    try {
      // UPSERT is only available since SQLite 3.24.0 (June 4, 2018).
      // Using a manual solution from https://stackoverflow.com/a/38463024
      final batch = _database.batch()
        ..update(
          'cache',
          {
            'account': accountID,
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
            accountID,
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
            accountID,
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
  Future<void> updateHeaders(String accountID, http.Request request, Map<String, String> headers) async {
    try {
      await _database.update(
        'cache',
        {
          'account': accountID,
          'response_headers': json.encode(headers),
        },
        where: 'account = ? AND request_method = ? AND request_url = ? AND request_headers = ? AND request_body = ?',
        whereArgs: [
          accountID,
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
