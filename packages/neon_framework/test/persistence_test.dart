// ignore_for_file: inference_failure_on_instance_creation, strict_raw_type, inference_failure_on_collection_literal

import 'package:built_collection/built_collection.dart';
import 'package:cookie_store/cookie_store.dart';
import 'package:cookie_store_conformance_tests/cookie_store_conformance_tests.dart' as cookie_jar_conformance;
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:neon_framework/src/storage/request_cache.dart';
import 'package:neon_framework/src/storage/sqlite_cookie_persistence.dart';
import 'package:neon_framework/src/storage/sqlite_persistence.dart';
import 'package:neon_framework/testing.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:universal_io/io.dart' show Cookie;

void main() {
  group('Persistences', () {
    group('RequestCache', () {
      final account = MockAccount();

      final cache = DefaultRequestCache();

      setUpAll(() {
        sqfliteFfiInit();
        databaseFactory = databaseFactoryFfi;
      });

      setUp(() async {
        cache.database = await openDatabase(
          inMemoryDatabasePath,
          version: 1,
          onCreate: DefaultRequestCache.onCreate,
          singleInstance: false,
        );
      });

      test('init', () {
        cache.database = null;
        expect(() async => cache.get(account, http.Request('GET', Uri())), throwsA(isA<StateError>()));
      });

      test('RequestCache', () async {
        final request = http.Request('GET', Uri(host: 'example.com'))
          ..headers.addAll({'a': 'b'})
          ..body = 'c';

        var result = await cache.get(account, request);
        expect(result, isNull);

        await cache.set(account, request, http.Response('value', 200, headers: {'key': 'value'}));
        result = await cache.get(account, request);
        expect(result?.statusCode, 200);
        expect(result?.body, 'value');
        expect(result?.headers, {'key': 'value'});

        for (final modifiedRequest in [
          http.Request('POST', Uri(host: 'example.com'))
            ..headers.addAll({'a': 'b'})
            ..body = 'c',
          http.Request('GET', Uri(host: 'example.org'))
            ..headers.addAll({'a': 'b'})
            ..body = 'c',
          http.Request('GET', Uri(host: 'example.com'))
            ..headers.addAll({'a': 'd'})
            ..body = 'c',
          http.Request('GET', Uri(host: 'example.com'))
            ..headers.addAll({'a': 'b'})
            ..body = 'e',
        ]) {
          result = await cache.get(account, modifiedRequest);
          expect(result, isNull);
        }

        await cache.set(account, request, http.Response('upsert', 201, headers: {'key': 'updated'}));
        result = await cache.get(account, request);
        expect(result?.statusCode, 201);
        expect(result?.body, 'upsert');
        expect(result?.headers, {'key': 'updated'});

        await cache.set(account, request, http.Response('value', 200, headers: {'key': 'value'}));
        result = await cache.get(account, request);
        expect(result?.statusCode, 200);
        expect(result?.body, 'value');
        expect(result?.headers, {'key': 'value'});

        await cache.updateHeaders(account, request, {'key': 'updated'});
        result = await cache.get(account, request);
        expect(result?.statusCode, 200);
        expect(result?.body, 'value');
        expect(result?.headers, {'key': 'updated'});
      });
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

    group(SQLiteCookiePersistence, () {
      setUpAll(() {
        sqfliteFfiInit();
        databaseFactory = databaseFactoryFfi;
      });

      tearDown(() {
        SQLiteCookiePersistence.database = null;
      });

      test('Uninitialized', () {
        SQLiteCookiePersistence.database = null;

        final persistence = SQLiteCookiePersistence(accountID: 'accountID');
        expect(() async => persistence.loadAll(), throwsA(isA<StateError>()));
      });

      cookie_jar_conformance.testAll(
        () async {
          SQLiteCookiePersistence.database = await openDatabase(
            inMemoryDatabasePath,
            version: 1,
            onCreate: SQLiteCookiePersistence.onCreate,
            singleInstance: false,
          );

          final persistence = SQLiteCookiePersistence(accountID: 'accountID');
          return DefaultCookieStore(persistence);
        },
        canDeleteAll: false,
        canDeleteByTest: false,
      );

      group('Restrict allowedBaseUri', () {
        late CookieStore cookieStore;

        setUpAll(() async {
          SQLiteCookiePersistence.database = await openDatabase(
            inMemoryDatabasePath,
            version: 1,
            onCreate: SQLiteCookiePersistence.onCreate,
            singleInstance: false,
          );

          cookieStore = DefaultCookieStore(
            SQLiteCookiePersistence(
              accountID: 'accountID',
              allowedBaseUri: Uri(host: 'example.com', path: '/subpath/'),
            ),
          );
        });

        for (final element in [
          (Uri(host: 'example.com', path: '/subpath/other'), isNotEmpty),
          (Uri(host: 'example.com', path: '/subpath'), isNotEmpty),
          (Uri(host: 'example.com', path: '/subpathTest'), isEmpty),
          (Uri(host: 'example.com', path: '/'), isEmpty),
          (Uri(host: 'test.com', path: '/subpath/other'), isEmpty),
        ]) {
          final uri = element.$1;
          test(uri, () async {
            final cookies = [
              Cookie(uri.host, 'value')
                ..domain = uri.host
                ..path = uri.path
                ..httpOnly = false
                ..secure = false,
            ];

            await cookieStore.saveFromResponse(uri, cookies);
            expect(
              await cookieStore.loadForRequest(uri),
              element.$2,
            );
          });
        }
      });
    });
  });
}
