import 'dart:async';

import 'package:cookie_store/cookie_store.dart';
import 'package:cookie_store_conformance_tests/src/utils.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart';

/// Tests that the store can store and update cookies.
@isTestGroup
void persistCookies(FutureOr<CookieStore> Function() cookieStoreFactory) {
  late CookieStore cookieStore;

  setUp(() async {
    cookieStore = await cookieStoreFactory();
  });

  group('persist cookie,', () {
    test('plain cookie', () async {
      final uri = Uri();

      final cookies = [
        TestCookie('name0', 'value'),
        TestCookie('name1', 'other-value'),
        TestCookie('name2', 'value'),
        TestCookie('name3', ''),
      ];

      await cookieStore.saveFromResponse(uri, cookies);
      final stored = await cookieStore.loadAll();
      expect(
        toSortedStringList(stored),
        equals([
          'name0=value',
          'name1=other-value',
          'name2=value',
          'name3=',
        ]),
      );
    });

    test('update cookie', () async {
      final uri = Uri();

      var cookies = [
        TestCookie('name0', 'value'),
        TestCookie('name1', 'value'),
        TestCookie('name2', 'value'),
        TestCookie('name3', 'value'),
      ];

      await cookieStore.saveFromResponse(uri, cookies);
      var stored = await cookieStore.loadAll();
      expect(
        toSortedStringList(stored),
        equals([
          'name0=value',
          'name1=value',
          'name2=value',
          'name3=value',
        ]),
      );

      cookies = [
        TestCookie('name0', 'value2'),
      ];

      await cookieStore.saveFromResponse(uri, cookies);
      stored = await cookieStore.loadAll();
      expect(
        toSortedStringList(stored),
        equals([
          'name0=value2',
          'name1=value',
          'name2=value',
          'name3=value',
        ]),
      );
    });
  });
}
