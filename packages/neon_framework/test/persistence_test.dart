// ignore_for_file: unnecessary_lambdas, inference_failure_on_instance_creation, strict_raw_type
// ignore_for_file: inference_failure_on_collection_literal

import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neon_framework/src/storage/request_cache.dart';
import 'package:neon_framework/src/storage/sqlite_persistence.dart';
import 'package:neon_framework/src/utils/request_manager.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:timezone/timezone.dart' as tz;

void main() {
  group('Persistences', () {
    test('RequestCache', () async {
      final cache = DefaultRequestCache();
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;

      expect(() async => cache.get('key'), throwsA(isA<StateError>()));

      cache.database = await openDatabase(
        inMemoryDatabasePath,
        version: 1,
        onCreate: DefaultRequestCache.onCreate,
      );

      dynamic result = await cache.get('key');
      expect(result, isNull);

      await cache.set('key', 'value', null);
      result = await cache.get('key');
      expect(result, equals('value'));

      await cache.set('key', 'upsert', null);
      result = await cache.get('key');
      expect(result, equals('upsert'));

      var parameters = const CacheParameters(etag: null, expires: null);
      result = await cache.getParameters('newKey');
      expect(result, equals(parameters));

      await cache.set('key', 'value', parameters);
      result = await cache.getParameters('key');
      expect(result, equals(parameters));

      parameters = CacheParameters(
        etag: 'etag',
        expires: tz.TZDateTime.fromMillisecondsSinceEpoch(
          tz.UTC,
          tz.TZDateTime.now(tz.UTC).millisecondsSinceEpoch,
        ),
      );
      await cache.updateParameters('key', parameters);
      result = await cache.getParameters('key');
      expect(result, equals(parameters));
    });

    group('SQLitePersistence', () {
      setUpAll(() {
        sqfliteFfiInit();
        databaseFactory = databaseFactoryFfi;
      });

      setUp(() async {
        SQLiteCachedPersistence.database = await openDatabase(
          inMemoryDatabasePath,
          version: 1,
          onCreate: SQLiteCachedPersistence.onCreate,
          singleInstance: false,
        );
      });

      tearDown(() {
        SQLiteCachedPersistence.globalCache.clear();
        SQLiteCachedPersistence.database = null;
      });

      test('Uninitialized', () {
        SQLiteCachedPersistence.database = null;

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
  });
}
