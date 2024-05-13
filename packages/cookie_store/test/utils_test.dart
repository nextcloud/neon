import 'package:cookie_store/src/storable_cookie.dart';
import 'package:cookie_store/src/utils.dart';
import 'package:test/test.dart';
import 'package:timezone/timezone.dart' as tz;

void main() {
  group('defaultPath', () {
    test('empty uri', () {
      final uri = Uri();
      final result = defaultPath(uri);

      expect(result, '/');
    });

    test('uri with query parameter or fragment', () {
      var uri = Uri(scheme: 'http', host: 'example.com', query: 'query');
      var result = defaultPath(uri);
      expect(result, '/');

      uri = Uri(scheme: 'http', host: 'example.com', fragment: 'fragment');
      result = defaultPath(uri);
      expect(result, '/');
    });

    test('relative path', () {
      var uri = Uri(path: 'docs');
      var result = defaultPath(uri);
      expect(result, '/');

      uri = Uri(path: 'docs/');
      result = defaultPath(uri);
      expect(result, '/');

      uri = Uri(path: 'docs/Web');
      result = defaultPath(uri);
      expect(result, '/');

      uri = Uri(path: 'docs/Web/');
      result = defaultPath(uri);
      expect(result, '/');
    });

    test('absolute path', () {
      var uri = Uri(path: '/docs');
      var result = defaultPath(uri);
      expect(result, '/');

      uri = Uri(path: '/docs/');
      result = defaultPath(uri);
      expect(result, '/docs');

      uri = Uri(path: '/docs/Web');
      result = defaultPath(uri);
      expect(result, '/docs/Web');

      uri = Uri(path: '/docs/Web/');
      result = defaultPath(uri);
      expect(result, '/docs/Web');
    });
  });

  group('isDomainMatch', () {
    test('identical domain', () {
      const cookieDomain = 'example.com';
      const requestDomain = 'example.com';

      final result = isDomainMatch(requestDomain, cookieDomain);
      expect(result, isTrue);
    });

    test('IP address', () {
      const cookieDomain = '1';

      var requestDomain = '127.0.0.1';
      var result = isDomainMatch(requestDomain, cookieDomain);
      expect(result, isFalse);

      requestDomain = '::1';
      result = isDomainMatch(requestDomain, cookieDomain);
      expect(result, isFalse);
    });

    test('domain is suffix', () {
      var cookieDomain = 'example.com';

      var result = isDomainMatch('example.com', cookieDomain);
      expect(result, isTrue);
      result = isDomainMatch('.example.com', cookieDomain);
      expect(result, isTrue);
      result = isDomainMatch('test.example.com', cookieDomain);
      expect(result, isTrue);
      result = isDomainMatch('1example.com', cookieDomain);
      expect(result, isFalse);
      result = isDomainMatch('test.com', cookieDomain);
      expect(result, isFalse);

      cookieDomain = '.leading.dot.example.com';

      result = isDomainMatch('.leading.dot.example.com', cookieDomain);
      expect(result, isTrue);
      result = isDomainMatch('..leading.dot.example.com', cookieDomain);
      expect(result, isTrue);
      result = isDomainMatch('sub..leading.dot.example.com', cookieDomain);
      expect(result, isTrue);
      result = isDomainMatch('sub.leading.dot.example.com', cookieDomain);
      expect(result, isFalse);
      result = isDomainMatch('dot.example.com', cookieDomain);
      expect(result, isFalse);
    });
  });

  group('isPathMatch', () {
    test('identical path', () {
      var cookiePath = '/';
      var requestPath = '/';
      var result = isPathMatch(requestPath, cookiePath);
      expect(result, isTrue);

      cookiePath = '/file';
      requestPath = '/file';
      result = isPathMatch(requestPath, cookiePath);
      expect(result, isTrue);

      cookiePath = '/directory/';
      requestPath = '/directory/';
      result = isPathMatch(requestPath, cookiePath);
      expect(result, isTrue);
    });

    test('path is prefix', () {
      const cookiePath = '/docs';

      var result = isPathMatch('/docs', cookiePath);
      expect(result, isTrue);
      result = isPathMatch('/docs/', cookiePath);
      expect(result, isTrue);
      result = isPathMatch('/docs/Web/', cookiePath);
      expect(result, isTrue);
      result = isPathMatch('/docs/Web/HTTP', cookiePath);
      expect(result, isTrue);

      result = isPathMatch('/', cookiePath);
      expect(result, isFalse);
      result = isPathMatch('/docsTets', cookiePath);
      expect(result, isFalse);
      result = isPathMatch('/fr/docs', cookiePath);
      expect(result, isFalse);
    });
  });

  test('isHttpUri', () {
    var uri = Uri.http('example.com');
    var result = isHttpUri(uri);
    expect(result, isTrue);

    uri = Uri.https('example.com');
    result = isHttpUri(uri);
    expect(result, isTrue);

    uri = Uri.file('example.com');
    result = isHttpUri(uri);
    expect(result, isFalse);

    uri = Uri(host: 'example.com');
    result = isHttpUri(uri);
    expect(result, isFalse);
  });

  test('isSecureUri', () {
    var uri = Uri.http('example.com');
    var result = isSecureUri(uri);
    expect(result, isFalse);

    uri = Uri.https('example.com');
    result = isSecureUri(uri);
    expect(result, isTrue);

    uri = Uri.file('example.com');
    result = isSecureUri(uri);
    expect(result, isFalse);

    uri = Uri.parse('ftp://example.com');
    result = isSecureUri(uri);
    expect(result, isFalse);

    uri = Uri.parse('ftps://example.com');
    result = isSecureUri(uri);
    expect(result, isTrue);
  });

  test('sortCookies', () {
    var now = tz.TZDateTime.now(tz.UTC);
    final shortPathCookie = StorableCookie(
      name: 'short-path',
      value: 'value',
      expiryTime: now,
      domain: 'example.com',
      path: '/path',
      creationTime: now,
      lastAccessTime: now,
      persistentFlag: false,
      hostOnlyFlag: false,
      secureOnlyFlag: false,
      httpOnlyFlag: false,
    );

    final longerPathCookie = StorableCookie(
      name: 'longer-path',
      value: 'value',
      expiryTime: now,
      domain: 'example.com',
      path: '/longerPath',
      creationTime: now,
      lastAccessTime: now,
      persistentFlag: false,
      hostOnlyFlag: false,
      secureOnlyFlag: false,
      httpOnlyFlag: false,
    );

    final earlyLongestPathCookie = StorableCookie(
      name: 'longest-path-early',
      value: 'value',
      expiryTime: now,
      domain: 'example.com',
      path: '/longestPath',
      creationTime: now,
      lastAccessTime: now,
      persistentFlag: false,
      hostOnlyFlag: false,
      secureOnlyFlag: false,
      httpOnlyFlag: false,
    );

    now = now.add(const Duration(seconds: 1));
    final laterLongestPathCookie = StorableCookie(
      name: 'longest-path-later',
      value: 'value',
      expiryTime: now,
      domain: 'example.com',
      path: '/longestPath',
      creationTime: now,
      lastAccessTime: now,
      persistentFlag: false,
      hostOnlyFlag: false,
      secureOnlyFlag: false,
      httpOnlyFlag: false,
    );

    final list = [
      laterLongestPathCookie,
      longerPathCookie,
      shortPathCookie,
      earlyLongestPathCookie,
    ];

    expect(
      list..sort(sortCookies),
      orderedEquals([
        earlyLongestPathCookie,
        laterLongestPathCookie,
        longerPathCookie,
        shortPathCookie,
      ]),
    );
  });
}
