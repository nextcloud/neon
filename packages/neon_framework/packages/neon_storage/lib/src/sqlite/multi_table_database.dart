import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:neon_storage/src/sqlite/sqlite.dart';
import 'package:sqflite_common/sqflite.dart';

/// A wrapper for the SQLite [Database] managing multiple tables.
abstract class MultiTableDatabase {
  /// Creates a new database for the given [tables].
  ///
  /// The provided tables must have distinct names or an `ArgumentError` is thrown.
  MultiTableDatabase({
    required Iterable<Table> tables,
  }) : _tables = BuiltList.from(tables) {
    final names = _tables.map((t) => t.name).toSet();

    if (names.length != _tables.length || names.contains(_metaTable)) {
      throw ArgumentError.value(_tables, 'tables', 'contains conflicting table names');
    }
  }

  /// The full storage path of the database.
  @protected
  FutureOr<String> get path;

  /// The name of the database without any file extension.
  @protected
  String get name;

  /// When `true` all open parameters are ignored and the database is opened as-is.
  @protected
  bool get readOnly => false;

  /// When `true` (the default), a single database instance is opened for a
  /// given path. Subsequent calls to [init] with the same path will
  /// return the same instance, and will discard all other parameters such as
  /// callbacks for that invocation.
  @protected
  bool get singleInstance => true;

  static bool _sqfliteInitialized = false;

  late final _metaTable = '_${name}_meta';

  final BuiltList<Table> _tables;

  Database? _database;

  /// Throws a `StateError` if [init] has not been called or completed before.
  @visibleForTesting
  @protected
  void assertInitialized() {
    if (_database == null) {
      throw StateError(
        'The database "$name" has not been set up. Make sure init() has been called before and completed.',
      );
    }
  }

  /// The database instance.
  ///
  /// Throws a `StateError` if [init] has not been called or completed before.
  Database get database {
    assertInitialized();

    return _database!;
  }

  /// Closes the database.
  ///
  /// A closed database must be initialized again by calling [init].
  @visibleForTesting
  Future<void> close() async {
    await _database?.close();
    _database = null;
  }

  /// Initializes the database and all tables.
  ///
  /// This must called and completed before accessing other methods.
  Future<void> init() async {
    if (_database != null) {
      return;
    }

    if (!_sqfliteInitialized) {
      setupDatabase();
      _sqfliteInitialized = true;
    }

    final database = await openDatabase(
      await path,
      version: 1,
      onCreate: _createMetaTable,
      readOnly: readOnly,
      singleInstance: singleInstance,
    );

    await _createTables(database);

    for (final table in _tables) {
      table.controller = this;
    }
    await Future.wait(
      _tables.map((t) => t.onOpen()),
    );

    _database = database;
  }

  Future<void> _createMetaTable(Database db, int version) async {
    await db.execute('''
CREATE TABLE IF NOT EXISTS "$_metaTable" (
	"name"		TEXT NOT NULL,
	"version"	INTEGER NOT NULL,
	PRIMARY KEY("name")
);
''');
  }

  Future<void> _createTables(Database db) async {
    final rows = await db.query(_metaTable);

    final versions = <String, int>{};
    for (final row in rows) {
      final name = row['name']! as String;
      final version = row['version']! as int;

      versions[name] = version;
    }

    final batch = db.batch();

    for (final table in _tables) {
      final oldVersion = versions[table.name];
      final newVersion = table.version;

      if (oldVersion == null) {
        table.onCreate(batch, newVersion);
        batch.insert(
          _metaTable,
          {
            'name': table.name,
            'version': newVersion,
          },
        );
        continue;
      } else if (oldVersion == newVersion) {
        continue;
      } else if (oldVersion > newVersion) {
        table.onDowngrade(batch, oldVersion, newVersion);
      } else if (oldVersion < newVersion) {
        table.onUpgrade(batch, oldVersion, newVersion);
      }

      batch.update(
        _metaTable,
        {
          'name': table.name,
          'version': newVersion,
        },
        where: 'name = ?',
        whereArgs: [table.name],
      );
    }

    await batch.commit(noResult: true);
  }
}
