import 'dart:async';

import 'package:cookie_store/cookie_store.dart';
import 'package:flutter/foundation.dart';
import 'package:neon_storage/neon_sqlite.dart';
import 'package:neon_storage/neon_storage.dart';

import 'package:path_provider/path_provider.dart';

/// Database holding the neon cache.
final class NeonCacheDB extends MultiTableDatabase {
  /// Creates a new database with the given [tables].
  factory NeonCacheDB({
    Iterable<Table>? tables,
  }) {
    return NeonCacheDB._(
      tables: [
        ...?tables,
        if (!kIsWeb) SQLiteRequestCache.table,
        if (!kIsWeb) SQLiteCookiePersistence.table,
      ],
    );
  }

  NeonCacheDB._({
    required super.tables,
  });

  @override
  String get name => 'cache';

  @override
  Future<String> get path async {
    final cacheDir = await getApplicationCacheDirectory();

    return buildDatabasePath(cacheDir.path, name);
  }

  /// The current request cache if available.
  RequestCache? get requestCache {
    if (kIsWeb) {
      return null;
    }

    assertInitialized();

    return const SQLiteRequestCache();
  }

  /// Creates a new `CookieStore` scoped to the given [accountID] and [serverURL].
  ///
  /// Cookies will only be sent to cookies matching the [serverURL].
  CookieStore? cookieStore({required String accountID, required Uri serverURL}) {
    if (kIsWeb) {
      return null;
    }

    assertInitialized();

    final persistence = SQLiteCookiePersistence(
      accountID: accountID,
      allowedBaseUri: serverURL,
    );

    return DefaultCookieStore(persistence);
  }
}
