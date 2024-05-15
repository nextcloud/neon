/// An [RFC6265](https://httpwg.org/specs/rfc6265.html) compliant cookie store.
///
/// Cookies are stored inside of `CookieStore`s parsing the received cookies
/// into `StorableCookie`s that can be saved in a `CookiePersistence`.
///
/// This package has an implementation independent api and provides utilities
/// that make it easy to extend and implemented into existing storage backends
/// like SQLite databases.
///
/// Users of the [cookie_jar](https://pub.dev/packages/cookie_jar) package
/// can use the provided `CookieJarAdapter`.
library;

export 'src/cookie_jar_adapter.dart';
export 'src/cookie_persistence.dart';
export 'src/cookie_store.dart';
export 'src/storable_cookie.dart';
export 'src/utils.dart';
