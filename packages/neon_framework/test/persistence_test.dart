// ignore_for_file: unnecessary_lambdas, inference_failure_on_instance_creation, strict_raw_type
// ignore_for_file: inference_failure_on_collection_literal

import 'package:built_collection/built_collection.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neon_framework/src/storage/request_cache.dart';
import 'package:neon_framework/src/storage/secure_persistence.dart';
import 'package:neon_framework/src/storage/shared_preferences_persistence.dart';
import 'package:neon_framework/src/storage/sqlite_persistence.dart';
import 'package:neon_framework/src/utils/request_manager.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_platform_interface.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('Persistences', () {
    group('SharedPreferencesPersistence', () {
      late InMemorySharedPreferencesStore sharedPreferences;

      setUp(() async {
        sharedPreferences = InMemorySharedPreferencesStore.withData({
          'flutter.no_prefix': 56,
          'flutter.prefix-key': 0.8263038168331953,
          'flutter.another-prefix': true,
        });
        SharedPreferencesStorePlatform.instance = sharedPreferences;

        await SharedPreferencesPersistence.init();
      });

      tearDown(() {
        SharedPreferencesPersistence.resetStatic();
      });

      test('with prefix', () async {
        const persistence = SharedPreferencesPersistence(prefix: 'prefix');

        expect(persistence.containsKey('key'), isTrue);
        expect(persistence.containsKey('random-key'), isFalse);

        await persistence.remove('key');
        expect(persistence.containsKey('key'), isFalse);

        // String
        Object value = 'some new value';
        await persistence.setValue('key', value);
        expect(persistence.getValue('key'), equals(value));
        expect(await sharedPreferences.getAll(), equals(persistence.cache));

        // int
        value = 20;
        await persistence.setValue('key_bool', value);
        expect(persistence.getValue('key_bool'), equals(value));
        expect(await sharedPreferences.getAll(), equals(persistence.cache));

        // double
        value = 0.3196889951920666;
        await persistence.setValue('key-double', value);
        expect(persistence.getValue('key-double'), equals(value));
        expect(await sharedPreferences.getAll(), equals(persistence.cache));

        // bool
        value = false;
        await persistence.setValue('key/int', value);
        expect(persistence.getValue('key/int'), equals(value));
        expect(await sharedPreferences.getAll(), equals(persistence.cache));

        // BuiltList<String>
        value = BuiltList<String>(['76', 'true', '0.8633290067560915']);
        await persistence.setValue('key.StringList', value);
        expect(persistence.getValue('key.StringList'), equals(value));
        expect(await sharedPreferences.getAll(), equals(persistence.cache));

        // Invalid type
        expect(() => persistence.setValue('key.StringList', {}), throwsA(isA<ArgumentError>()));

        persistence.setCache('key.StringListCache', value);
        expect(persistence.getValue('key.StringListCache'), equals(value));
        var stored = await sharedPreferences.getAll();
        expect(stored.containsKey('key.StringListCache'), isFalse);

        await persistence.clear();
        stored = await sharedPreferences.getAll();
        expect(
          stored,
          equals({
            'flutter.neon-version': kSharedPreferenceVersion,
            'flutter.no_prefix': 56,
            'flutter.another-prefix': true,
          }),
          reason: 'only clears withing the prefix',
        );

        await sharedPreferences.setValue('valueType', 'flutter.prefix-key', 'value');
        await persistence.reload();
        expect(persistence.containsKey('key'), isTrue);
      });

      test('no prefix', () async {
        const persistence = SharedPreferencesPersistence();

        expect(persistence.containsKey('no_prefix'), isTrue);
        expect(persistence.containsKey('random-key'), isFalse);

        await persistence.remove('no_prefix');
        expect(persistence.containsKey('no_prefix'), isFalse);

        // String
        Object value = 'some new value';
        await persistence.setValue('no_prefix', value);
        expect(persistence.getValue('no_prefix'), equals(value));
        expect(await sharedPreferences.getAll(), equals(persistence.cache));

        // int
        value = 20;
        await persistence.setValue('no_prefix_bool', value);
        expect(persistence.getValue('no_prefix_bool'), equals(value));
        expect(await sharedPreferences.getAll(), equals(persistence.cache));

        // double
        value = 0.3196889951920666;
        await persistence.setValue('no_prefix-double', value);
        expect(persistence.getValue('no_prefix-double'), equals(value));
        expect(await sharedPreferences.getAll(), equals(persistence.cache));

        // bool
        value = false;
        await persistence.setValue('no_prefix/int', value);
        expect(persistence.getValue('no_prefix/int'), equals(value));
        expect(await sharedPreferences.getAll(), equals(persistence.cache));

        // BuiltList<String>
        value = BuiltList<String>(['76', 'true', '0.8633290067560915']);
        await persistence.setValue('no_prefix.StringList', value);
        expect(persistence.getValue('no_prefix.StringList'), equals(value));
        expect(await sharedPreferences.getAll(), equals(persistence.cache));

        // Invalid type
        expect(() => persistence.setValue('no_prefix.StringList', {}), throwsA(isA<ArgumentError>()));

        persistence.setCache('no_prefix.StringListCache', value);
        expect(persistence.getValue('no_prefix.StringListCache'), equals(value));
        var stored = await sharedPreferences.getAll();
        expect(stored.containsKey('no_prefix.StringListCache'), isFalse);

        await persistence.clear();
        stored = await sharedPreferences.getAll();
        expect(
          stored,
          isEmpty,
          reason: 'An empty prefix matches every non empty one. Clearing everything.',
        );

        await sharedPreferences.setValue('valueType', 'flutter.key', 'value');
        await persistence.reload();
        expect(persistence.containsKey('key'), isTrue);
      });
    });

    test('FlutterSecureStorage', () async {
      FlutterSecureStorage.setMockInitialValues({
        'key2': 'value2',
      });

      const persistence = SecurePersistence();

      dynamic result = await persistence.containsKey('key');
      expect(result, isFalse);

      result = await persistence.setValue('key', 'value');
      expect(result, isTrue);
      result = await persistence.getValue('key');
      expect(result, equals('value'));

      result = await persistence.remove('key');
      expect(result, isTrue);
      result = await persistence.containsKey('key');
      expect(result, isFalse);

      result = await persistence.clear();
      expect(result, isTrue);
      result = await persistence.containsKey('key2');
      expect(result, isFalse);
    });

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
        expires: DateTime.fromMillisecondsSinceEpoch(DateTime.now().microsecondsSinceEpoch),
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
        SQLitePersistence.database = await openDatabase(
          inMemoryDatabasePath,
          version: 1,
          onCreate: SQLitePersistence.onCreate,
          singleInstance: false,
        );
      });

      tearDown(() {
        SQLitePersistence.globalCache.clear();
        SQLitePersistence.database = null;
      });

      test('Uninitialized', () {
        SQLitePersistence.database = null;

        expect(() async => SQLitePersistence().clear(), throwsA(isA<StateError>()));
      });

      test('init reloads all values', () async {
        await SQLitePersistence().setValue('key', 'value');

        SQLitePersistence(prefix: 'garbage').setCache('key2', 'value2');
        SQLitePersistence(prefix: 'garbage2').setCache('key2', 'value2');

        await SQLitePersistence.getAll();
        expect(
          SQLitePersistence.globalCache,
          equals(
            {
              '': {'key': 'value'},
            },
          ),
        );
      });

      test('reload unrelated persistence', () async {
        await SQLitePersistence().setValue('key', 'value');

        SQLitePersistence().setCache('key2', 'value2');
        SQLitePersistence(prefix: 'garbage').setCache('key2', 'value2');

        await SQLitePersistence().reload();
        expect(
          SQLitePersistence.globalCache,
          equals(
            {
              '': {'key': 'value'},
              'garbage': {'key2': 'value2'},
            },
          ),
        );
      });

      test('remove unrelated persistence', () async {
        await SQLitePersistence().setValue('key', 'value');
        await SQLitePersistence(prefix: 'prefix').setValue('pKey', 'pValue');

        await SQLitePersistence().remove('key');
        expect(
          SQLitePersistence.globalCache,
          equals(
            {
              '': {},
              'prefix': {'pKey': 'pValue'},
            },
          ),
        );

        await SQLitePersistence().reload();
        expect(
          SQLitePersistence.globalCache,
          equals(
            {
              '': {},
              'prefix': {'pKey': 'pValue'},
            },
          ),
        );
      });

      test('persist built_collection', () async {
        await SQLitePersistence().setValue('string-key', 'value');
        await SQLitePersistence().setValue('num-key', 4);
        await SQLitePersistence().setValue('bool-key', false);
        await SQLitePersistence().setValue('built-list-key', BuiltList(['hi', 'there']));
        await SQLitePersistence().setValue('built-map-key', BuiltMap({'hi': 'again'}));

        await SQLitePersistence().reload();
        expect(
          SQLitePersistence().cache,
          equals({
            'bool-key': false,
            'built-list-key': BuiltList(['hi', 'there']),
            'built-map-key': BuiltMap({'hi': 'again'}),
            'num-key': 4,
            'string-key': 'value',
          }),
        );
        expect(SQLitePersistence().getValue('built-list-key'), isA<BuiltList>());
        expect(SQLitePersistence().getValue('built-map-key'), isA<BuiltMap>());
      });

      test('clear unrelated persistence', () async {
        await SQLitePersistence().setValue('key', 'value');
        await SQLitePersistence(prefix: 'prefix').setValue('pKey', 'pValue');

        await SQLitePersistence(prefix: 'prefix').clear();
        expect(SQLitePersistence(prefix: 'prefix').cache, isEmpty);
        expect(SQLitePersistence().cache, isNotEmpty);

        await SQLitePersistence(prefix: 'prefix').reload();
        expect(SQLitePersistence(prefix: 'prefix').cache, isEmpty);
        expect(SQLitePersistence().cache, isNotEmpty);
      });

      test('contains key', () async {
        SQLitePersistence().setCache('key', 'value');
        expect(SQLitePersistence().containsKey('key'), isTrue);
        expect(SQLitePersistence(prefix: 'prefix').containsKey('key'), isFalse);
      });
    });
  });
}
