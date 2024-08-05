import 'dart:async';

import 'package:cookie_store/cookie_store.dart' show CookieStore;
import 'package:cookie_store_conformance_tests/src/deletion_tests.dart';
import 'package:cookie_store_conformance_tests/src/domain_matching_tests.dart';
import 'package:cookie_store_conformance_tests/src/expiration_tests.dart';
import 'package:cookie_store_conformance_tests/src/http_only_cookie_tests.dart';
import 'package:cookie_store_conformance_tests/src/path_matching_tests.dart';
import 'package:cookie_store_conformance_tests/src/persist_cookies_tests.dart';
import 'package:cookie_store_conformance_tests/src/secure_cookie_tests.dart';
import 'package:cookie_store_conformance_tests/src/sorting_tests.dart';
import 'package:meta/meta.dart';

export 'package:cookie_store_conformance_tests/src/deletion_tests.dart' show deletionTests;
export 'package:cookie_store_conformance_tests/src/domain_matching_tests.dart' show domainMatching;
export 'package:cookie_store_conformance_tests/src/expiration_tests.dart' show expiration;
export 'package:cookie_store_conformance_tests/src/http_only_cookie_tests.dart' show httpOnly;
export 'package:cookie_store_conformance_tests/src/path_matching_tests.dart' show pathMatching;
export 'package:cookie_store_conformance_tests/src/persist_cookies_tests.dart' show persistCookies;
export 'package:cookie_store_conformance_tests/src/secure_cookie_tests.dart' show secure;
export 'package:cookie_store_conformance_tests/src/sorting_tests.dart' show sortTests;

/// Runs the entire test suite against the given [CookieStore].
///
/// These tests require the otherwise optional method [CookieStore.loadAll] to
/// be implemented.
///
/// If [canDeleteAll] is `false` then tests for [CookieStore.deleteAll] will
/// be skipped.
///
/// If [canDeleteByTest] is `false` then tests for [CookieStore.deleteWhere] will
/// be skipped.
///
/// If [canSortByPath] is `false` then tests for sorting the cookies loaded for
/// a request against the `Cookie.path` attribute will be skipped.
///
/// If [canSortByCreationTime] is `false` then tests for sorting the cookies
/// loaded for a request against the creation time will be skipped.
/// Requires [canSortByPath] to be also `true`.
@isTestGroup
void testAll(
  FutureOr<CookieStore> Function() cookieStoreFactory, {
  bool canDeleteAll = true,
  bool canDeleteByTest = true,
  bool canSortByPath = true,
  bool canSortByCreationTime = true,
}) {
  persistCookies(cookieStoreFactory);
  domainMatching(cookieStoreFactory);
  pathMatching(cookieStoreFactory);
  httpOnly(cookieStoreFactory);
  secure(cookieStoreFactory);
  expiration(cookieStoreFactory);
  sortTests(
    cookieStoreFactory,
    canSortByPath: canSortByPath,
    canSortByCreationTime: canSortByCreationTime,
  );
  deletionTests(
    cookieStoreFactory,
    canDeleteAll: canDeleteAll,
    canDeleteByTest: canDeleteByTest,
  );
}
