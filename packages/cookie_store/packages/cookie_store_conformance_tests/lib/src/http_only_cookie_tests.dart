import 'dart:async';

import 'package:cookie_store/cookie_store.dart';
import 'package:cookie_store_conformance_tests/src/utils.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart';

/// Tests that the store does not load cookies with the httpOnly flag on non http
/// requests.
///
/// Tested with the following Uris.
/// ```dart
///   var nonHttp = Uri(host: 'example.com');
///   var http = Uri.http('example.com');
/// ```
///
/// An implementation might not share the same definition of what protocols are `http`.
@isTestGroup
void httpOnly(FutureOr<CookieStore> Function() cookieStoreFactory) {
  late CookieStore cookieStore;

  setUp(() async {
    cookieStore = await cookieStoreFactory();
  });

  group('http only cookies,', () {
    test('do not save when requestUri is not http', () async {
      final uri = Uri(host: 'example.com');
      final httpUri = Uri.http('example.com');

      final cookies = [
        TestCookie('httpOnly0', 'value')..httpOnly = true,
        TestCookie('httpOnly1', 'value')..httpOnly = true,
        TestCookie('not-httpOnly0', 'value'),
        TestCookie('not-httpOnly1', 'value'),
      ];

      await cookieStore.saveFromResponse(uri, cookies);
      var stored = await cookieStore.loadAll();

      expect(
        toSortedStringList(stored),
        equals([
          'not-httpOnly0=value',
          'not-httpOnly1=value',
        ]),
      );

      await cookieStore.saveFromResponse(httpUri, cookies);
      stored = await cookieStore.loadAll();
      expect(
        toSortedStringList(stored),
        equals([
          'httpOnly0=value',
          'httpOnly1=value',
          'not-httpOnly0=value',
          'not-httpOnly1=value',
        ]),
      );
    });

    test('do not retrieve when requestUri is not http', () async {
      final uri = Uri(host: 'example.com');
      final httpUri = Uri.http('example.com');

      final cookies = [
        TestCookie('httpOnly0', 'value')..httpOnly = true,
        TestCookie('httpOnly1', 'value')..httpOnly = true,
        TestCookie('not-httpOnly0', 'value'),
        TestCookie('not-httpOnly1', 'value'),
      ];

      await cookieStore.saveFromResponse(httpUri, cookies);
      var stored = await cookieStore.loadAll();
      expect(
        toSortedStringList(stored),
        equals([
          'httpOnly0=value',
          'httpOnly1=value',
          'not-httpOnly0=value',
          'not-httpOnly1=value',
        ]),
      );

      stored = await cookieStore.loadForRequest(uri);
      expect(
        toSortedStringList(stored),
        equals([
          'not-httpOnly0=value',
          'not-httpOnly1=value',
        ]),
      );

      stored = await cookieStore.loadForRequest(httpUri);
      expect(
        toSortedStringList(stored),
        equals([
          'httpOnly0=value',
          'httpOnly1=value',
          'not-httpOnly0=value',
          'not-httpOnly1=value',
        ]),
      );
    });
  });
}
