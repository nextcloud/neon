import 'dart:async';

import 'package:cookie_store/cookie_store.dart';
import 'package:cookie_store_conformance_tests/src/utils.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart';

/// Tests that the store correctly sorts cookies on retrieval (optional).
///
/// The user agent SHOULD sort the cookie-list in the following order:
///   * Cookies with longer paths are listed before cookies with shorter paths.
///   * Among cookies that have equal-length path fields, cookies with earlier
///     creation-times are listed before cookies with later creation-times.
@isTestGroup
void sortTests(
  FutureOr<CookieStore> Function() cookieStoreFactory, {
  bool canSortByPath = true,
  bool canSortByCreationTime = true,
}) {
  late CookieStore cookieStore;

  setUp(() async {
    cookieStore = await cookieStoreFactory();
  });

  group('sort cookies,', () {
    test(
      'by path length',
      () async {
        final cookies = [
          TestCookie('root', 'value')..path = '/',
          TestCookie('docs', 'value')..path = '/docs/',
          TestCookie('docs-Web', 'value')..path = '/docs/Web/',
          TestCookie('docs-Web-HTTP', 'value')..path = '/docs/Web/HTTP',
        ];

        await cookieStore.saveFromResponse(Uri(path: '/'), cookies);
        final stored = await cookieStore.loadForRequest(Uri(path: '/docs/Web/HTTP'));
        expect(
          toStringList(stored),
          equals([
            'docs-Web-HTTP=value',
            'docs-Web=value',
            'docs=value',
            'root=value',
          ]),
        );
      },
      skip: canSortByPath ? false : 'does not support sorting by path length',
    );

    test(
      'by access time',
      () async {
        var cookies = [
          TestCookie('root', 'value')..path = '/',
          TestCookie('docs', 'value')..path = '/docs/',
          TestCookie('docs-Web', 'value')..path = '/docs/Web/',
          TestCookie('docs-Web-HTTP', 'value')..path = '/docs/Web/HTTP',
        ];

        await cookieStore.saveFromResponse(Uri(path: '/'), cookies);
        var stored = await cookieStore.loadForRequest(Uri(path: '/docs/Web/HTTP'));
        expect(
          toStringList(stored),
          equals([
            'docs-Web-HTTP=value',
            'docs-Web=value',
            'docs=value',
            'root=value',
          ]),
        );

        cookies = [
          TestCookie('later-written', 'value')..path = '/docs/Web/',
        ];
        await cookieStore.saveFromResponse(Uri(path: '/'), cookies);
        stored = await cookieStore.loadForRequest(Uri(path: '/docs/Web/HTTP'));
        expect(
          toStringList(stored),
          equals([
            'docs-Web-HTTP=value',
            'docs-Web=value',
            'later-written=value',
            'docs=value',
            'root=value',
          ]),
        );
      },
      skip: (canSortByPath && canSortByCreationTime) ? false : 'does not support sorting by creating time',
    );
  });
}
