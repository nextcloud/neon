import 'dart:async';

import 'package:cookie_store/cookie_store.dart';
import 'package:cookie_store_conformance_tests/src/utils.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart';

/// Tests that the store correctly implements path and path-matching algorithms
/// as defined by [RFC6265 section 5.1.4](https://httpwg.org/specs/rfc6265.html#cookie-path).
@isTestGroup
void pathMatching(FutureOr<CookieStore> Function() cookieStoreFactory) {
  late CookieStore cookieStore;

  setUp(() async {
    cookieStore = await cookieStoreFactory();
  });

  group('path matching,', () {
    test('with path attribute', () async {
      final cookies = [
        TestCookie('docs', 'value')..path = '/docs',
      ];

      await cookieStore.saveFromResponse(Uri(), cookies);
      var stored = await cookieStore.loadAll();
      expect(toStringList(stored), equals(['docs=value']));

      // Not matching
      stored = await cookieStore.loadForRequest(Uri());
      expect(stored, isEmpty);
      stored = await cookieStore.loadForRequest(Uri(path: '/'));
      expect(stored, isEmpty);
      stored = await cookieStore.loadForRequest(Uri(path: '/docsTets'));
      expect(stored, isEmpty);
      stored = await cookieStore.loadForRequest(Uri(path: '/fr/docs'));
      expect(stored, isEmpty);

      // Matching
      stored = await cookieStore.loadForRequest(Uri(path: '/docs'));
      expect(toStringList(stored), equals(['docs=value']));
      stored = await cookieStore.loadForRequest(Uri(path: '/docs/'));
      expect(toStringList(stored), equals(['docs=value']));
      stored = await cookieStore.loadForRequest(Uri(path: '/docs/Web/'));
      expect(toStringList(stored), equals(['docs=value']));
      stored = await cookieStore.loadForRequest(Uri(path: '/docs/Web/HTTP'));
      expect(toStringList(stored), equals(['docs=value']));
      stored = await cookieStore.loadForRequest(Uri(path: '/docs', query: 'queryParam'));
      expect(toStringList(stored), equals(['docs=value']));
      stored = await cookieStore.loadForRequest(Uri(path: '/docs', fragment: 'fragment'));
      expect(toStringList(stored), equals(['docs=value']));
    });

    test('default path check', () async {
      var cookies = [
        TestCookie('no-path', '/'),
      ];
      await cookieStore.saveFromResponse(Uri(), cookies);

      cookies = [
        TestCookie('no-path-query', '/'),
      ];
      await cookieStore.saveFromResponse(Uri(query: 'queryParam'), cookies);

      cookies = [
        TestCookie('no-path-fragment', '/'),
      ];
      await cookieStore.saveFromResponse(Uri(fragment: 'fragment'), cookies);

      cookies = [
        TestCookie('relative', '/'),
      ];
      await cookieStore.saveFromResponse(Uri(path: 'docs'), cookies);

      cookies = [
        TestCookie('relative-one-slash', '/'),
      ];
      await cookieStore.saveFromResponse(Uri(path: 'docs/Web'), cookies);

      cookies = [
        TestCookie('relative-multiple-slash', '/'),
      ];
      await cookieStore.saveFromResponse(Uri(path: 'docs/Web/'), cookies);

      cookies = [
        TestCookie('absolute-path', '/'),
      ];
      await cookieStore.saveFromResponse(Uri(path: '/docs'), cookies);

      cookies = [
        TestCookie('absolute-path-trailing-slash', '/docs'),
      ];
      await cookieStore.saveFromResponse(Uri(path: '/docs/'), cookies);

      var stored = await cookieStore.loadAll();
      expect(
        toSortedStringList(stored),
        equals([
          'absolute-path-trailing-slash=/docs',
          'absolute-path=/',
          'no-path-fragment=/',
          'no-path-query=/',
          'no-path=/',
          'relative-multiple-slash=/',
          'relative-one-slash=/',
          'relative=/',
        ]),
      );

      stored = await cookieStore.loadForRequest(Uri());
      expect(
        toSortedStringList(stored),
        equals([
          'absolute-path=/',
          'no-path-fragment=/',
          'no-path-query=/',
          'no-path=/',
          'relative-multiple-slash=/',
          'relative-one-slash=/',
          'relative=/',
        ]),
      );
      stored = await cookieStore.loadForRequest(Uri(path: '/'));
      expect(
        toSortedStringList(stored),
        equals([
          'absolute-path=/',
          'no-path-fragment=/',
          'no-path-query=/',
          'no-path=/',
          'relative-multiple-slash=/',
          'relative-one-slash=/',
          'relative=/',
        ]),
      );

      stored = await cookieStore.loadForRequest(Uri(path: '/docs'));
      expect(
        toSortedStringList(stored),
        equals([
          'absolute-path-trailing-slash=/docs',
          'absolute-path=/',
          'no-path-fragment=/',
          'no-path-query=/',
          'no-path=/',
          'relative-multiple-slash=/',
          'relative-one-slash=/',
          'relative=/',
        ]),
      );

      stored = await cookieStore.loadForRequest(Uri(path: '/docs/'));
      expect(
        toSortedStringList(stored),
        equals([
          'absolute-path-trailing-slash=/docs',
          'absolute-path=/',
          'no-path-fragment=/',
          'no-path-query=/',
          'no-path=/',
          'relative-multiple-slash=/',
          'relative-one-slash=/',
          'relative=/',
        ]),
      );

      stored = await cookieStore.loadForRequest(Uri(path: '/docs/Web'));
      expect(
        toSortedStringList(stored),
        equals([
          'absolute-path-trailing-slash=/docs',
          'absolute-path=/',
          'no-path-fragment=/',
          'no-path-query=/',
          'no-path=/',
          'relative-multiple-slash=/',
          'relative-one-slash=/',
          'relative=/',
        ]),
      );
    });
  });
}
