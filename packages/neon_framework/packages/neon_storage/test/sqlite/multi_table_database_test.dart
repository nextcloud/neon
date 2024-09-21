import 'dart:async';

import 'package:mocktail/mocktail.dart';
import 'package:neon_storage/neon_sqlite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:test/test.dart';

abstract class _DatabaseController {
  String get name;

  FutureOr<String> get path;

  Iterable<Table> get tables;
}

class _DatabaseControllerMock extends Mock implements _DatabaseController {}

class _TestDatabase extends MultiTableDatabase {
  _TestDatabase(this.controller) : super(tables: controller.tables);

  final _DatabaseController controller;

  @override
  String get name => controller.name;

  @override
  FutureOr<String> get path => controller.path;
}

class _FakeMultiTableDatabase extends Fake implements MultiTableDatabase {}

class _TableMock extends Mock implements Table {}

class _FakeBatch extends Fake implements Batch {}

void main() {
  group(MultiTableDatabase, () {
    late _DatabaseController controller;
    late MultiTableDatabase database;

    setUpAll(() {
      registerFallbackValue(_FakeBatch());
      registerFallbackValue(_FakeMultiTableDatabase());
    });

    setUp(() {
      controller = _DatabaseControllerMock();
      when(() => controller.tables).thenReturn([]);
      when(() => controller.path).thenReturn(inMemoryDatabasePath);
      when(() => controller.name).thenReturn('database');

      database = _TestDatabase(controller);
      resetMocktailState();
    });

    tearDown(() async {
      await database.close();
    });

    test('init initializes the database', () async {
      await database.init();

      expect(
        database.database,
        isA<Database>(),
      );
    });

    test('throws if not initialized', () async {
      expect(
        () => database.database,
        throwsStateError,
      );
    });

    test('returns the same instance once initialized', () async {
      await database.init();

      expect(
        identical(database.database, database.database),
        isTrue,
      );
    });

    group('conflicting table names', () {
      setUp(() {
        controller = _DatabaseControllerMock();
        when(() => controller.name).thenReturn('database');
      });

      test('throws an ArgumentError for duplicate table names', () {
        final table = _TableMock();
        when(() => table.name).thenReturn('cache_table');

        final table2 = _TableMock();
        when(() => table2.name).thenReturn('cache_table');

        when(() => controller.tables).thenReturn([table, table2]);

        expect(
          () => _TestDatabase(controller),
          throwsArgumentError,
        );
      });

      test('throws a TableNameError for conflicting table names', () {
        final table = _TableMock();
        when(() => table.name).thenReturn('_database_meta');

        when(() => controller.tables).thenReturn([table]);

        expect(
          () => _TestDatabase(controller),
          throwsArgumentError,
        );
      });
    });

    group('table versioning', () {
      late Table table;
      setUp(() async {
        table = _TableMock();
        when(() => table.name).thenReturn('table');
        when(() => table.version).thenReturn(2);
        when(() => table.onOpen()).thenAnswer((_) async {});

        controller = _DatabaseControllerMock();
        when(() => controller.path).thenReturn(inMemoryDatabasePath);
        when(() => controller.name).thenReturn('database');
        when(() => controller.tables).thenReturn([table]);

        database = _TestDatabase(controller);

        await database.init();
        clearInteractions(table);
      });

      tearDown(() {
        verify(table.onOpen).called(1);

        verify(() => table.name);
        verify(() => table.version);
        verify(() => table.controller = any()).called(1);

        verifyNoMoreInteractions(table);
      });

      test('calls onCreate when table is not present', () async {
        when(() => table.name).thenReturn('table2');
        when(() => table.version).thenReturn(1);

        database = _TestDatabase(controller);
        await database.init();

        verify(() => table.onCreate(any(), 1)).called(1);
      });

      test('does not call onCreate when table version did not change', () async {
        database = _TestDatabase(controller);
        await database.init();

        verifyNever(() => table.onCreate(any(), any()));
      });

      test('calls onUpgrade when table version is higher', () async {
        when(() => table.version).thenReturn(3);

        database = _TestDatabase(controller);
        await database.init();

        verify(() => table.onUpgrade(any(), 2, 3)).called(1);
      });

      test('calls onDowngrade when table version is lower', () async {
        when(() => table.version).thenReturn(1);

        database = _TestDatabase(controller);
        await database.init();

        verify(() => table.onDowngrade(any(), 2, 1)).called(1);
      });
    });
  });
}
