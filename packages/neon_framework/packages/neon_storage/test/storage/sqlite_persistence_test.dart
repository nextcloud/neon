// ignore_for_file: inference_failure_on_instance_creation, strict_raw_type, inference_failure_on_collection_literal

import 'package:built_collection/built_collection.dart';
import 'package:neon_storage/src/storage/storage.dart';
import 'package:neon_storage/testing.dart';
import 'package:test/test.dart';

void main() {
  group('SQLitePersistence', () {
    late TestTableDatabase database;

    setUp(() async {
      database = TestTableDatabase(SQLiteCachedPersistence.table);
      await database.init();
    });

    tearDown(() async {
      SQLiteCachedPersistence.globalCache.clear();
      await database.close();
    });

    test('Uninitialized', () async {
      await database.close();

      expect(() async => SQLiteCachedPersistence().clear(), throwsA(isA<StateError>()));
    });

    test('init reloads all values', () async {
      await SQLiteCachedPersistence().setValue('key', 'value');

      SQLiteCachedPersistence(prefix: 'garbage').setCache('key2', 'value2');
      SQLiteCachedPersistence(prefix: 'garbage2').setCache('key2', 'value2');

      await SQLiteCachedPersistence.getAll();
      expect(
        SQLiteCachedPersistence.globalCache,
        equals(
          {
            '': {'key': 'value'},
          },
        ),
      );
    });

    test('reload unrelated persistence', () async {
      await SQLiteCachedPersistence().setValue('key', 'value');

      SQLiteCachedPersistence().setCache('key2', 'value2');
      SQLiteCachedPersistence(prefix: 'garbage').setCache('key2', 'value2');

      await SQLiteCachedPersistence().reload();
      expect(
        SQLiteCachedPersistence.globalCache,
        equals(
          {
            '': {'key': 'value'},
            'garbage': {'key2': 'value2'},
          },
        ),
      );
    });

    test('remove unrelated persistence', () async {
      await SQLiteCachedPersistence().setValue('key', 'value');
      await SQLiteCachedPersistence(prefix: 'prefix').setValue('pKey', 'pValue');

      await SQLiteCachedPersistence().remove('key');
      expect(
        SQLiteCachedPersistence.globalCache,
        equals(
          {
            '': {},
            'prefix': {'pKey': 'pValue'},
          },
        ),
      );

      await SQLiteCachedPersistence().reload();
      expect(
        SQLiteCachedPersistence.globalCache,
        equals(
          {
            '': {},
            'prefix': {'pKey': 'pValue'},
          },
        ),
      );
    });

    test('persist built_collection', () async {
      await SQLiteCachedPersistence().setValue('string-key', 'value');
      await SQLiteCachedPersistence().setValue('num-key', 4);
      await SQLiteCachedPersistence().setValue('bool-key', false);
      await SQLiteCachedPersistence().setValue('built-list-key', BuiltList(['hi', 'there']));
      await SQLiteCachedPersistence().setValue('built-map-key', BuiltMap({'hi': 'again'}));

      await SQLiteCachedPersistence().reload();
      expect(
        SQLiteCachedPersistence().cache,
        equals({
          'bool-key': false,
          'built-list-key': BuiltList(['hi', 'there']),
          'built-map-key': BuiltMap({'hi': 'again'}),
          'num-key': 4,
          'string-key': 'value',
        }),
      );
      expect(SQLiteCachedPersistence().getValue('built-list-key'), isA<BuiltList>());
      expect(SQLiteCachedPersistence().getValue('built-map-key'), isA<BuiltMap>());
    });

    test('clear unrelated persistence', () async {
      await SQLiteCachedPersistence().setValue('key', 'value');
      await SQLiteCachedPersistence(prefix: 'prefix').setValue('pKey', 'pValue');

      await SQLiteCachedPersistence(prefix: 'prefix').clear();
      expect(SQLiteCachedPersistence(prefix: 'prefix').cache, isEmpty);
      expect(SQLiteCachedPersistence().cache, isNotEmpty);

      await SQLiteCachedPersistence(prefix: 'prefix').reload();
      expect(SQLiteCachedPersistence(prefix: 'prefix').cache, isEmpty);
      expect(SQLiteCachedPersistence().cache, isNotEmpty);
    });

    test('contains key', () async {
      SQLiteCachedPersistence().setCache('key', 'value');
      expect(SQLiteCachedPersistence().containsKey('key'), isTrue);
      expect(SQLiteCachedPersistence(prefix: 'prefix').containsKey('key'), isFalse);
    });
  });
}
