import 'dart:async';

import 'package:cookie_store/cookie_store.dart';
import 'package:cookie_store_conformance_tests/src/utils.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart';

/// Tests that the store does correctly handle cookie expiration.
///
/// This also tests the eviction of session-cookies after calling
/// [CookieStore.endSession].
@isTestGroup
void expiration(FutureOr<CookieStore> Function() cookieStoreFactory) {
  late CookieStore cookieStore;

  setUp(() async {
    cookieStore = await cookieStoreFactory();
  });

  group('expiration,', () {
    test('do not store already expired', () async {
      final uri = Uri();

      const duration = Duration(seconds: 1);
      final expiration = DateTime.timestamp().subtract(duration);
      final cookies = [
        TestCookie('expired0', 'value')..expires = expiration,
        TestCookie('expired1', 'value')..maxAge = -duration.inSeconds,
        TestCookie('not-expired0', 'value'),
        TestCookie('not-expired1', 'value'),
      ];

      await cookieStore.saveFromResponse(uri, cookies);
      final stored = await cookieStore.loadAll();
      expect(
        toSortedStringList(stored),
        equals([
          'not-expired0=value',
          'not-expired1=value',
        ]),
      );
    });

    test('expiration at a later point', () async {
      final uri = Uri();

      const duration = Duration(seconds: 2);
      final expiration = DateTime.timestamp().add(duration);
      final cookies = [
        TestCookie('will-expire0', 'value')..expires = expiration,
        TestCookie('will-expire1', 'value')..maxAge = duration.inSeconds,
        TestCookie('not-expired0', 'value'),
        TestCookie('not-expired1', 'value'),
      ];

      await cookieStore.saveFromResponse(uri, cookies);
      var stored = await cookieStore.loadForRequest(uri);
      expect(
        toSortedStringList(stored),
        equals([
          'not-expired0=value',
          'not-expired1=value',
          'will-expire0=value',
          'will-expire1=value',
        ]),
      );

      await Future<void>.delayed(duration * 2);
      stored = await cookieStore.loadForRequest(uri);
      expect(
        toSortedStringList(stored),
        equals([
          'not-expired0=value',
          'not-expired1=value',
        ]),
      );
    });

    test('session cookies', () async {
      final uri = Uri();

      const duration = Duration(days: 1);
      final expiration = DateTime.timestamp().add(duration);
      final cookies = [
        TestCookie('will-expire0', 'value')..expires = expiration,
        TestCookie('will-expire1', 'value')..maxAge = duration.inSeconds,
        TestCookie('session-cookie1', 'value'),
        TestCookie('session-cookie2', 'value'),
      ];

      await cookieStore.saveFromResponse(uri, cookies);
      var stored = await cookieStore.loadForRequest(uri);
      expect(
        toSortedStringList(stored),
        equals([
          'session-cookie1=value',
          'session-cookie2=value',
          'will-expire0=value',
          'will-expire1=value',
        ]),
      );

      await cookieStore.endSession();
      stored = await cookieStore.loadForRequest(uri);
      expect(
        toSortedStringList(stored),
        equals([
          'will-expire0=value',
          'will-expire1=value',
        ]),
      );
    });
  });
}
