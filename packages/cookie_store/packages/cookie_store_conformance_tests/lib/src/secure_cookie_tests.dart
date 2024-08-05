import 'dart:async';

import 'package:cookie_store/cookie_store.dart';
import 'package:cookie_store_conformance_tests/src/utils.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart';

/// Tests that the store does not load cookies with the secure flag on insecure
/// requests.
///
/// Tested with the following Uris.
/// ```dart
///   var insecure = Uri(host: 'example.com');
///   var secure = Uri(scheme: 'ftps', host: 'example.com');
/// ```
///
/// An implementation might not consider the `ftps` uri as secure.
@isTestGroup
void secure(FutureOr<CookieStore> Function() cookieStoreFactory) {
  late CookieStore cookieStore;

  setUp(() async {
    cookieStore = await cookieStoreFactory();
  });

  group('secure cookies,', () {
    test('do not load secure cookies in insecure requests', () async {
      final uri = Uri(host: 'example.com');

      final cookies = [
        TestCookie('not-secure0', 'value'),
        TestCookie('secure0', 'value')..secure = true,
        TestCookie('not-secure1', 'value'),
        TestCookie('secure1', 'value')..secure = true,
      ];

      await cookieStore.saveFromResponse(uri, cookies);
      var stored = await cookieStore.loadAll();
      expect(
        toSortedStringList(stored),
        equals([
          'not-secure0=value',
          'not-secure1=value',
          'secure0=value',
          'secure1=value',
        ]),
      );

      stored = await cookieStore.loadForRequest(uri);
      expect(
        toSortedStringList(stored),
        equals([
          'not-secure0=value',
          'not-secure1=value',
        ]),
      );

      stored = await cookieStore.loadForRequest(Uri(scheme: 'ftps', host: 'example.com'));
      expect(
        toSortedStringList(stored),
        equals([
          'not-secure0=value',
          'not-secure1=value',
          'secure0=value',
          'secure1=value',
        ]),
      );
    });
  });
}
