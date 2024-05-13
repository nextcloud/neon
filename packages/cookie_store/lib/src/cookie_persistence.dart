import 'dart:async';

import 'package:cookie_store/src/storable_cookie.dart';
import 'package:cookie_store/src/utils.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:universal_io/io.dart' show Cookie;

/// Interface for a Storage backend persisting [StorableCookie]s.
///
/// ### Cookie value retrieval
/// {@macro CookieStore.valueRetrieval}
///
/// ### Cookie management
/// {@macro CookieStore.cookieManagement}
///
/// ### CookieStore limits, eviction policy
/// {@macro CookieStore.limits}
abstract interface class CookiePersistence {
  /// Creates the default [MemoryCookiePersistence].
  factory CookiePersistence() {
    return MemoryCookiePersistence();
  }

  /// Load the cookies for specified [uri].
  ///
  /// Cookies SHOULD be sorted with the [sortCookies] function.
  FutureOr<List<Cookie>> loadForRequest(Uri uri);

  /// Saves the serialized [cookies].
  ///
  /// Returns whether the operation completed successfully.
  FutureOr<bool> saveFromResponse(Set<StorableCookie> cookies, {required bool isHttpRequest});

  /// Ends the current session deleting all session cookies.
  ///
  /// Returns whether the operation completed successfully.
  FutureOr<bool> endSession();

  /// Loads all cookies in the persistence.
  ///
  /// Implementing this method is optional. It must be documented if the
  /// implementer does not support this operation.
  FutureOr<List<Cookie>> loadAll();

  /// Deletes all cookies in the persistence.
  ///
  /// Implementing this method is optional. It must be documented if the
  /// implementer does not support this operation.
  ///
  /// Returns whether the operation completed successfully.
  FutureOr<bool> deleteAll();

  /// Removes all cookies in this persistence that satisfy the given [test].
  ///
  /// Implementing this method is optional. It must be documented if the
  /// implementer does not support this operation.
  ///
  /// Returns whether the operation completed successfully.
  FutureOr<bool> deleteWhere(bool Function(Cookie cookie) test);
}

/// Default cookie persistence.
///
/// Cookies are stored synchronously in memory and NOT persisted on disk.
final class MemoryCookiePersistence implements CookiePersistence {
  /// Created a new cookie persistence storing cookies in memory.
  MemoryCookiePersistence();

  final Set<StorableCookie> _cookieStore = {};

  @override
  bool endSession() {
    _cookieStore.removeWhere((cookie) => !cookie.persistentFlag);

    return true;
  }

  @override
  List<Cookie> loadForRequest(Uri uri) {
    final cookies = <StorableCookie>[];

    final now = tz.TZDateTime.now(tz.UTC);
    final isHttpRequest = isHttpUri(uri);
    final isSecureRequest = isSecureUri(uri);

    final requestHost = uri.host;
    var requestPath = uri.path;
    if (requestPath.isEmpty) {
      requestPath = '/';
    }

    _cookieStore.removeWhere((cookie) => cookie.expiryTime.isBefore(now));

    for (final cookie in _cookieStore) {
      if (cookie.hostOnlyFlag && cookie.domain != requestHost) {
        continue;
      }

      if (!cookie.hostOnlyFlag && !isDomainMatch(requestHost, cookie.domain)) {
        continue;
      }

      if (!isPathMatch(requestPath, cookie.path)) {
        continue;
      }

      if (cookie.secureOnlyFlag && !isSecureRequest) {
        continue;
      }

      if (cookie.httpOnlyFlag && !isHttpRequest) {
        continue;
      }

      cookies.add(cookie);
    }

    cookies.sort(sortCookies);
    _cookieStore.addAll(cookies.map((cookie) => cookie.copyWith(lastAccessTime: now)));

    return cookies.map((cookie) {
      return Cookie(cookie.name, cookie.value)
        ..httpOnly = false
        ..secure = false;
    }).toList();
  }

  @override
  bool saveFromResponse(Set<StorableCookie> cookies, {required bool isHttpRequest}) {
    for (var cookie in cookies) {
      final stored = _cookieStore.lookup(cookie);
      if (stored != null) {
        if (stored.httpOnlyFlag && !isHttpRequest) {
          continue;
        }

        _cookieStore.remove(stored);
        cookie = cookie.copyWith(creationTime: stored.creationTime);
      }

      _cookieStore.add(cookie);
    }

    return true;
  }

  @override
  bool deleteWhere(bool Function(Cookie cookie) test) {
    _cookieStore.removeWhere((storableCookie) {
      final cookie = _storableCookieToCookie(storableCookie);

      return test(cookie);
    });

    return true;
  }

  @override
  bool deleteAll() {
    _cookieStore.clear();

    return true;
  }

  @override
  List<Cookie> loadAll() {
    return _cookieStore.map(_storableCookieToCookie).toList();
  }

  static Cookie _storableCookieToCookie(StorableCookie storableCookie) {
    return Cookie(storableCookie.name, storableCookie.value)
      ..expires = storableCookie.expiryTime
      ..domain = storableCookie.domain
      ..path = storableCookie.path
      ..secure = storableCookie.secureOnlyFlag
      ..httpOnly = storableCookie.httpOnlyFlag;
  }
}
