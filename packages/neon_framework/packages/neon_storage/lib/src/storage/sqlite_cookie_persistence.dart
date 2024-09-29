import 'dart:io' show Cookie;

import 'package:cookie_store/cookie_store.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:neon_storage/neon_sqlite.dart';
import 'package:nextcloud/utils.dart' show DateTimeUtils;
import 'package:sqflite_common/sqlite_api.dart';

final _log = Logger('SQLiteCookiePersistence');

const String _unsupportedCookieManagementMessage =
    'The neon project does not plan to support individual cookie management.';

const String _lastAccessMaxDuration = "STRFTIME('%s', 'now', '-1 years')";

final class _SQLiteCookiePersistenceTable extends Table {
  @override
  String get name => 'cookies';

  @override
  int get version => 1;

  @override
  void onCreate(Batch db, int version) {
    // https://httpwg.org/specs/rfc6265.html#storage-model with an extra account key.
    db.execute('''
CREATE TABLE "cookies" (
  "account"           TEXT NOT NULL,
  "name"              TEXT NOT NULL,
  "value"             TEXT NOT NULL,
  "expiry-time"       INTEGER NOT NULL,
  "domain"            TEXT NOT NULL,
  "path"              TEXT NOT NULL,
  "creation-time"     INTEGER NOT NULL,
  "last-access-time"  INTEGER NOT NULL,
  "persistent-flag"   BOOLEAN NOT NULL,
  "host-only-flag"    BOOLEAN NOT NULL,
  "secure-only-flag"  BOOLEAN NOT NULL,
  "http-only-flag"    BOOLEAN NOT NULL,
  PRIMARY KEY("account", "name", "domain", "path")
);

CREATE TRIGGER cookies_delete_outdated
   AFTER UPDATE
   ON cookies
BEGIN
 DELETE FROM cookies
 WHERE
   "expiry-time" <= STRFTIME('%s')
   OR "last-access-time" <= $_lastAccessMaxDuration;
END;
''');
  }
}

/// An SQLite backed cookie persistence.
///
/// No maximum cookie age is set as mentioned in [RFC6265 section 7.3](https://httpwg.org/specs/rfc6265.html#rfc.section.7.3).
///
/// This persistence does not support cookie management through the [deleteAll]
/// and [deleteWhere] methods. Calling them will throw a [UnsupportedError].
final class SQLiteCookiePersistence implements CookiePersistence {
  /// Creates a new SQLite backed cookie persistence for the given account.
  ///
  /// Optionally [allowedBaseUri] can be used to restrict storage and loading of cookies to a certain domain and path.
  SQLiteCookiePersistence({
    required this.accountID,
    Uri? allowedBaseUri,
  }) : allowedBaseUri = switch (allowedBaseUri) {
          null => null,
          Uri(:final path) when path.endsWith('/') => Uri(
              host: allowedBaseUri.host,
              path: path.substring(0, path.length - 1),
            ),
          _ => allowedBaseUri,
        };

  /// The allowed cookie base uri.
  ///
  /// When not null, only cookies  domain and path matching this uri will be
  /// persisted.
  ///
  /// See:
  ///   * domain matching [RFC6265 section 5.1.3](https://httpwg.org/specs/rfc6265.html#rfc.section.5.1.3)
  ///   * path matching [RFC6265 section 5.1.4](https://httpwg.org/specs/rfc6265.html#rfc.section.5.1.4)
  final Uri? allowedBaseUri;

  /// The id of the requesting account.
  final String accountID;

  /// The sqlite table backing this storage.
  static final Table table = _SQLiteCookiePersistenceTable();

  static Database get _database => table.controller.database;

  @override
  Future<List<Cookie>> loadForRequest(Uri uri) async {
    final requestHost = uri.host;
    var requestPath = uri.path;
    if (requestPath.isEmpty) {
      requestPath = '/';
    }

    if (!_isAllowedUri(requestHost, requestPath)) {
      return [];
    }

    final isHttpRequest = isHttpUri(uri);
    final isSecureRequest = isSecureUri(uri);

    // domain and patch matching is error prone in SQL;
    // use the dart helpers for now.
    try {
      final results = await _database.rawQuery(
        '''
SELECT "name", "domain", "path", "value"
FROM "cookies"
WHERE "account" = ?
  AND ("domain" = ? OR "host-only-flag" = 0)
  AND ("secure-only-flag" = 0 OR ?)
  AND ("http-only-flag" = 0 OR ?)
  AND "expiry-time" >= STRFTIME('%s')
  AND "last-access-time" >= $_lastAccessMaxDuration
ORDER BY 
  length("path") DESC,
  "creation-time" ASC
''',
        [
          accountID,
          requestHost,
          if (isSecureRequest) 1 else 0,
          if (isHttpRequest) 1 else 0,
        ],
      );

      final list = <Cookie>[];
      final batch = _database.batch();

      for (final result in results) {
        final name = result['name']! as String;
        final domain = result['domain']! as String;
        final path = result['path']! as String;
        final value = result['value']! as String;

        if (!isDomainMatch(requestHost, domain) || !isPathMatch(requestPath, path)) {
          continue;
        }

        final cookie = Cookie(name, value);
        list.add(cookie);

        batch.rawUpdate(
          '''
UPDATE "cookies"
SET "last-access-time" = STRFTIME('%s')
WHERE "account" = ?
  AND "name" = ?
  AND "domain" = ?
  AND "path" = ?
''',
          [
            accountID,
            name,
            domain,
            path,
          ],
        );
      }

      if (batch.length >= 1) {
        await batch.commit(noResult: true);
      }

      return list;
    } on DatabaseException catch (error, stackTrace) {
      _log.warning(
        'Error loading cookies.',
        error,
        stackTrace,
      );
    }

    return [];
  }

  @override
  Future<bool> saveFromResponse(Set<StorableCookie> cookies, {required bool isHttpRequest}) async {
    if (cookies.isEmpty) {
      return true;
    }

    final batch = _database.batch();

    for (final cookie in cookies) {
      batch
        ..update(
          table.name,
          {
            '"name"': cookie.name,
            '"value"': cookie.value,
            '"expiry-time"': cookie.expiryTime.secondsSinceEpoch,
            '"domain"': cookie.domain,
            '"path"': cookie.path,
            // DO NOT update the creation time
            '"last-access-time"': cookie.lastAccessTime.secondsSinceEpoch,
            '"persistent-flag"': cookie.persistentFlag ? 1 : 0,
            '"host-only-flag"': cookie.hostOnlyFlag ? 1 : 0,
            '"secure-only-flag"': cookie.secureOnlyFlag ? 1 : 0,
            '"http-only-flag"': cookie.httpOnlyFlag ? 1 : 0,
          },
          where: '''
"account" = ?
AND "name" = ?
AND "domain" = ?
AND "path" = ?
AND ("http-only-flag" = 0 OR ? = 1)
''',
          whereArgs: [
            accountID,
            cookie.name,
            cookie.domain,
            cookie.path,
            if (isHttpRequest) 1 else 0,
          ],
        )
        // Ignore already present records.
        // This happens when the cookie was not updated because of the http-only-flag
        ..rawInsert(
          '''
INSERT OR IGNORE INTO cookies ("account", "name", "value", "expiry-time", "domain", "path", "creation-time", "last-access-time", "persistent-flag", "host-only-flag", "secure-only-flag", "http-only-flag")
SELECT ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?
WHERE (SELECT changes() = 0)
''',
          [
            accountID,
            cookie.name,
            cookie.value,
            cookie.expiryTime.secondsSinceEpoch,
            cookie.domain,
            cookie.path,
            cookie.creationTime.secondsSinceEpoch,
            cookie.lastAccessTime.secondsSinceEpoch,
            if (cookie.persistentFlag) 1 else 0,
            if (cookie.hostOnlyFlag) 1 else 0,
            if (cookie.secureOnlyFlag) 1 else 0,
            if (cookie.httpOnlyFlag) 1 else 0,
          ],
        );
    }

    try {
      await batch.commit(noResult: true);
    } on DatabaseException catch (error, stackTrace) {
      _log.warning(
        'Error persisting cookies.',
        error,
        stackTrace,
      );

      return false;
    }

    return true;
  }

  @override
  Future<bool> endSession() async {
    try {
      await _database.execute(
        '''
DELETE FROM cookies
WHERE
  "account" = ?
  AND ("persistent-flag" = 0
    OR "expiry-time" <= STRFTIME('%s'))
''',
        [accountID],
      );

      return true;
    } on DatabaseException catch (error, stackTrace) {
      _log.warning(
        'Error removing session cookies.',
        error,
        stackTrace,
      );

      return false;
    }
  }

  /// Not implemented by this persistence.
  @override
  bool deleteWhere(bool Function(Cookie cookie) test) {
    throw UnsupportedError(_unsupportedCookieManagementMessage);
  }

  /// Not implemented by this persistence.
  @override
  bool deleteAll() {
    throw UnsupportedError(_unsupportedCookieManagementMessage);
  }

  /// This method is only meant for testing.
  @visibleForTesting
  @override
  Future<List<Cookie>> loadAll() async {
    final list = <Cookie>[];

    try {
      final results = await _database.rawQuery(
        '''
SELECT "name", "value"
FROM "cookies"
WHERE "account" = ?
''',
        [accountID],
      );

      for (final result in results) {
        final cookie = Cookie(
          result['name']! as String,
          result['value']! as String,
        );

        list.add(cookie);
      }
    } on DatabaseException catch (error, stackTrace) {
      _log.warning(
        'Error loading cookies.',
        error,
        stackTrace,
      );
    }

    return list;
  }

  bool _isAllowedUri(String domain, String path) {
    final allowedBaseUri = this.allowedBaseUri;
    if (allowedBaseUri == null) {
      return true;
    }

    if (allowedBaseUri.host != domain) {
      return false;
    }

    if (allowedBaseUri.path.isNotEmpty && !isPathMatch(path, allowedBaseUri.path)) {
      return false;
    }

    return true;
  }
}
