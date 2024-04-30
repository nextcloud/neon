import 'package:cookie_jar/cookie_jar.dart' as cookie_jar;
import 'package:cookie_store/src/cookie_store.dart';
import 'package:cookie_store/src/utils.dart';

/// An adapter between the neon [CookieStore] and the [cookie_jar.CookieJar]
/// from the [cookie_jar](https://pub.dev/packages/cookie_jar) package.
final class CookieJarAdapter implements cookie_jar.CookieJar {
  /// Creates a new cookie jar adapter backed by the given [cookieStore].
  const CookieJarAdapter(this.cookieStore);

  /// The neon cookie store backing the cookie jar.
  final CookieStore cookieStore;

  @override
  bool get ignoreExpires => false;

  @override
  Future<void> delete(Uri uri, [bool withDomainSharedCookie = false]) async {
    return cookieStore.deleteWhere((cookie) {
      return isDomainMatch(uri.host, cookie.domain ?? '') && isPathMatch(uri.path, cookie.path ?? '');
    });
  }

  @override
  Future<void> deleteAll() async {
    return cookieStore.deleteAll();
  }

  @override
  Future<List<cookie_jar.Cookie>> loadForRequest(Uri uri) async => cookieStore.loadForRequest(uri);

  @override
  Future<void> saveFromResponse(Uri uri, List<cookie_jar.Cookie> cookies) async =>
      cookieStore.saveFromResponse(uri, cookies);
}
