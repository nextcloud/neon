import 'dart:async';

import 'package:cookie_store/cookie_store.dart';
import 'package:cookie_store_conformance_tests/src/utils.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart';

/// Tests that the store correctly implements the optional cookie management interface.
@isTestGroup
void deletionTests(
  FutureOr<CookieStore> Function() cookieStoreFactory, {
  bool canDeleteAll = true,
  bool canDeleteByTest = true,
}) {
  late CookieStore cookieStore;

  setUp(() async {
    cookieStore = await cookieStoreFactory();
  });

  group('delete cookies,', () {
    test(
      'delete all',
      () async {
        final uri = Uri();

        final cookies = [
          TestCookie('name0', 'value'),
          TestCookie('name1', 'other-value'),
          TestCookie('name2', 'value'),
          TestCookie('name3', ''),
        ];

        await cookieStore.saveFromResponse(uri, cookies);
        var stored = await cookieStore.loadAll();
        expect(
          toSortedStringList(stored),
          equals([
            'name0=value',
            'name1=other-value',
            'name2=value',
            'name3=',
          ]),
        );

        await cookieStore.deleteAll();
        stored = await cookieStore.loadAll();
        expect(
          toSortedStringList(stored),
          equals([]),
        );
      },
      skip: canDeleteAll ? false : 'does not support deleting all cookies',
    );

    test(
      'delete by test',
      () async {
        final uri = Uri();

        final cookies = [
          TestCookie('name0', 'value'),
          TestCookie('name1', 'other-value'),
          TestCookie('name2', 'value'),
          TestCookie('name3', ''),
        ];

        await cookieStore.saveFromResponse(uri, cookies);
        var stored = await cookieStore.loadAll();
        expect(
          toSortedStringList(stored),
          equals([
            'name0=value',
            'name1=other-value',
            'name2=value',
            'name3=',
          ]),
        );

        await cookieStore.deleteWhere((cookie) {
          return cookie.name == 'name1' || cookie.value.isEmpty;
        });
        stored = await cookieStore.loadAll();
        expect(
          toSortedStringList(stored),
          equals([
            'name0=value',
            'name2=value',
          ]),
        );
      },
      skip: canDeleteByTest ? false : 'does not support deleting by test',
    );
  });
}
