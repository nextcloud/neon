import 'dart:async';

import 'package:neon_storage/neon_sqlite.dart';
import 'package:neon_storage/neon_storage.dart';
import 'package:path_provider/path_provider.dart';

/// Database holding the neon data.
final class NeonDataDB extends MultiTableDatabase {
  /// Creates a new database with the given [tables].
  factory NeonDataDB({
    Iterable<Table>? tables,
  }) {
    return NeonDataDB._(
      tables: [
        ...?tables,
        SQLiteCachedPersistence.table,
      ],
    );
  }

  NeonDataDB._({
    required super.tables,
  });

  @override
  String get name => 'preferences';

  @override
  Future<String> get path async {
    final cacheDir = await getApplicationSupportDirectory();

    return buildDatabasePath(cacheDir.path, name);
  }
}
