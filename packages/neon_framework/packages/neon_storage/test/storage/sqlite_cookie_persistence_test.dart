import 'dart:io' show Cookie;

import 'package:cookie_store/cookie_store.dart';
import 'package:cookie_store_conformance_tests/cookie_store_conformance_tests.dart' as cookie_jar_conformance;
import 'package:neon_storage/src/storage/storage.dart';
import 'package:neon_storage/testing.dart';
import 'package:test/test.dart';

void main() {
  group(SQLiteCookiePersistence, () {
    late TestTableDatabase database;

    setUp(() async {
      database = TestTableDatabase(SQLiteCookiePersistence.table);
      await database.init();
    });

    tearDown(() async {
      await database.close();
    });

    test('Uninitialized', () async {
      await database.close();

      final persistence = SQLiteCookiePersistence(accountID: 'accountID');
      expect(() async => persistence.loadAll(), throwsA(isA<StateError>()));
    });

    cookie_jar_conformance.testAll(
      () async {
        final persistence = SQLiteCookiePersistence(accountID: 'accountID');
        return DefaultCookieStore(persistence);
      },
      canDeleteAll: false,
      canDeleteByTest: false,
    );

    group('Restrict allowedBaseUri', () {
      late CookieStore cookieStore;

      setUpAll(() async {
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
}
