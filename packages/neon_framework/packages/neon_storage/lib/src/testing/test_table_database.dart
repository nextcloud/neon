import 'package:meta/meta.dart';
import 'package:neon_storage/neon_sqlite.dart';
import 'package:sqflite_common/sqlite_api.dart';

/// A test implementation for testing a [Table].
@visibleForTesting
final class TestTableDatabase extends MultiTableDatabase {
  /// Creates a test database for the given [table].
  TestTableDatabase(Table table)
      : _table = table,
        super(tables: [table]);

  final Table _table;

  @override
  String get name => '${_table.name}_database';

  @override
  String get path => inMemoryDatabasePath;
}
