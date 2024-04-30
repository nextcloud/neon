// ignore_for_file:   prefer_final_locals, omit_local_variable_types

import 'dart:async';

import 'package:cookie_store/src/cookie_persistence.dart';
import 'package:cookie_store/src/storable_cookie.dart';
import 'package:cookie_store/src/utils.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:universal_io/io.dart' show Cookie;

// DateTimes can represent time values that are at a distance of at most 100,000,000
// days from epoch (1970-01-01 UTC): -271821-04-20 to 275760-09-13.
final tz.TZDateTime _maxDateTime = tz.TZDateTime.utc(275760, 09, 13);

/// [CookieStore] is a cookie container and manager for HTTP requests implementing [RFC6265](https://httpwg.org/specs/rfc6265.html).
///
/// ## Implementation consideration
/// In most cases it is not needed to implement this interface.
/// To build a custom storage backend [CookiePersistence] can be used.
///
/// ### Cookie value retrieval
/// {@template CookieStore.valueRetrieval}
/// A cookie store does not need to retrieve cookies with all attributes present.
/// Retrieved cookies only need to have a valid [Cookie.name] and [Cookie.value].
/// It is up to the implementation to provide further information.
/// {@endtemplate}
///
/// ### Cookie management
/// {@template CookieStore.cookieManagement}
/// According to [RFC6265 section 7.2](https://httpwg.org/specs/rfc6265.html#rfc.section.7.2)
/// user agents SHOULD provide users with a mechanism for managing the cookies stored in the cookie store.
/// It must be documented if an implementer does not provide any of the optional
/// [loadAll], [deleteAll] and [deleteWhere] method.
/// {@endtemplate}
///
/// ### Public suffix validation
/// The default implementation does not validate the cookie domain against a public
/// suffix list:
/// {@template CookieStore.publicSuffix}
/// > NOTE: A "public suffix" is a domain that is controlled by a public
/// > registry, such as "com", "co.uk", and "pvt.k12.wy.us". This step is
/// > essential for preventing attacker.com from disrupting the integrity of
/// > example.com by setting a cookie with a Domain attribute of "com".
/// > Unfortunately, the set of public suffixes (also known as "registry controlled domains")
/// > changes over time. If feasible, user agents SHOULD use an up-to-date
/// > public suffix list, such as the one maintained by the Mozilla project at <http://publicsuffix.org/>.
/// {@endtemplate}
///
/// ### CookieStore limits, eviction policy
/// {@template CookieStore.limits}
/// If a cookie store has a limit to the number of cookies it can store,
/// the removal policy outlined in [RFC6265 section 5.3](https://httpwg.org/specs/rfc6265.html#rfc.section.5.3)
/// must be followed:
/// > At any time, the user agent MAY "remove excess cookies" from the cookie store
/// > if the number of cookies sharing a domain field exceeds some implementation-defined
/// > upper bound (such as 50 cookies).
/// >
/// > At any time, the user agent MAY "remove excess cookies" from the cookie store
/// > if the cookie store exceeds some predetermined upper bound (such as 3000 cookies).
/// >
/// > When the user agent removes excess cookies from the cookie store, the user agent MUST
/// > evict cookies in the following priority order:
/// >
/// >    Expired cookies.
/// >    Cookies that share a domain field with more than a predetermined number of other cookies.
/// >    All cookies.
/// >
/// > If two cookies have the same removal priority, the user agent MUST evict the
/// > cookie with the earliest last-access date first.
///
/// It is recommended to set an upper bound to the time a cookie is stored
/// as described in [RFC6265 section 7.3](https://httpwg.org/specs/rfc6265.html#rfc.section.7.3):
/// > Although servers can set the expiration date for cookies to the distant future,
/// > most user agents do not actually retain cookies for multiple decades.
/// > Rather than choosing gratuitously long expiration periods, servers SHOULD
/// > promote user privacy by selecting reasonable cookie expiration periods based on the purpose of the cookie.
/// > For example, a typical session identifier might reasonably be set to expire in two weeks.
/// {@endtemplate}
abstract interface class CookieStore {
  /// Creates a [DefaultCookieStore] instance.
  factory CookieStore() {
    return DefaultCookieStore(
      CookiePersistence(),
    );
  }

  /// Save the [cookies] for specified [uri].
  FutureOr<void> saveFromResponse(Uri uri, List<Cookie> cookies);

  /// Load the cookies for specified [uri].
  FutureOr<List<Cookie>> loadForRequest(Uri uri);

  /// Ends the current session deleting all session cookies.
  FutureOr<void> endSession();

  /// Loads all cookies in the store.
  ///
  /// User agents SHOULD provide users with a mechanism for managing the cookies stored in the cookie store.
  /// https://httpwg.org/specs/rfc6265.html#rfc.section.7.2
  ///
  /// Implementing this method is optional. It must be documented if the
  /// implementer does not support this operation.
  FutureOr<List<Cookie>> loadAll();

  /// Deletes all cookies in the store.
  ///
  /// User agents SHOULD provide users with a mechanism for managing the cookies stored in the cookie store.
  /// https://httpwg.org/specs/rfc6265.html#rfc.section.7.2
  ///
  /// Implementing this method is optional. It must be documented if the
  /// implementer does not support this operation.
  FutureOr<void> deleteAll();

  /// Removes all cookies in this store that satisfy the given [test].
  ///
  /// User agents SHOULD provide users with a mechanism for managing the cookies stored in the cookie store.
  /// https://httpwg.org/specs/rfc6265.html#rfc.section.7.2
  ///
  /// Implementing this method is optional. It must be documented if the
  /// implementer does not support this operation.
  FutureOr<void> deleteWhere(bool Function(Cookie cookie) test);
}

/// The default cookie store implementation.
///
/// This implementation does not validate the cookie domain against a public
/// suffix list:
/// {@macro CookieStore.publicSuffix}
///
/// Cookies are parsed into a set of [StorableCookie]s and persisted in the given [persistence].
final class DefaultCookieStore implements CookieStore {
  /// Creates a new cookie store backed by the provided [persistence].
  DefaultCookieStore(this.persistence);

  /// The persistence storing the serialized [StorableCookie].
  final CookiePersistence persistence;

  @override
  FutureOr<void> saveFromResponse(Uri uri, List<Cookie> cookies) {
    final now = tz.TZDateTime.now(tz.UTC);
    final isHttpRequest = isHttpUri(uri);

    Set<StorableCookie> persistentCookies = {};

    for (final cookie in cookies) {
      // declare all variables upfront and only assign them as needed.
      // Easier for comparing to the rfc algorithm.
      String name = cookie.name;
      String value = cookie.value;
      tz.TZDateTime creationTime = now;
      tz.TZDateTime lastAccessTime = now;

      tz.TZDateTime expiryTime;
      String domain;
      String path;
      bool persistentFlag;
      bool hostOnlyFlag;
      bool secureOnlyFlag;
      bool httpOnlyFlag;

      final maxAge = cookie.maxAge;
      tz.TZDateTime? expires;
      if (cookie.expires != null) {
        expires = tz.TZDateTime.from(cookie.expires!, tz.UTC);
      }

      if (maxAge != null) {
        persistentFlag = true;
        expiryTime = now.add(Duration(seconds: maxAge));
      } else if (expires != null) {
        persistentFlag = true;
        expiryTime = expires;
      } else {
        persistentFlag = false;
        expiryTime = _maxDateTime;
      }

      // perf: skip already expired cookies.
      if (expiryTime.isBefore(now)) {
        continue;
      }

      // Validating the public suffix is out of scope for this implementation.

      if (cookie.domain == null || cookie.domain!.isEmpty) {
        hostOnlyFlag = true;
        domain = uri.host;
      } else if (!isDomainMatch(uri.host, cookie.domain!)) {
        continue;
      } else {
        hostOnlyFlag = false;
        domain = cookie.domain!;
      }

      path = cookie.path ?? defaultPath(uri);
      secureOnlyFlag = cookie.secure;
      httpOnlyFlag = cookie.httpOnly;

      if (httpOnlyFlag && !isHttpRequest) {
        continue;
      }

      final persistentCookie = StorableCookie(
        name: name,
        value: value,
        expiryTime: expiryTime,
        domain: domain,
        path: path,
        creationTime: creationTime,
        lastAccessTime: lastAccessTime,
        persistentFlag: persistentFlag,
        hostOnlyFlag: hostOnlyFlag,
        secureOnlyFlag: secureOnlyFlag,
        httpOnlyFlag: httpOnlyFlag,
      );
      persistentCookies.add(persistentCookie);
    }

    return persistence.saveFromResponse(
      persistentCookies,
      isHttpRequest: isHttpRequest,
    );
  }

  @override
  FutureOr<List<Cookie>> loadForRequest(Uri uri) {
    return persistence.loadForRequest(uri);
  }

  @override
  FutureOr<void> endSession() {
    return persistence.endSession();
  }

  @override
  FutureOr<List<Cookie>> loadAll() {
    return persistence.loadAll();
  }

  @override
  FutureOr<void> deleteAll() {
    return persistence.deleteAll();
  }

  @override
  FutureOr<void> deleteWhere(bool Function(Cookie cookie) test) {
    return persistence.deleteWhere(test);
  }
}
