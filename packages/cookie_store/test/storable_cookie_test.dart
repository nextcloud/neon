import 'package:cookie_store/src/storable_cookie.dart';
import 'package:test/test.dart';
import 'package:timezone/timezone.dart' as tz;

void main() {
  group('StorableCookie equality', () {
    test('same values', () {
      final now = tz.TZDateTime.now(tz.UTC);
      final cookie1 = StorableCookie(
        name: 'name',
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

      final cookie2 = StorableCookie(
        name: 'name',
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

      expect(cookie1, equals(cookie2));
      expect(cookie1.hashCode, equals(cookie2.hashCode));
    });

    test('matching name, domain and path', () {
      var now = tz.TZDateTime.now(tz.UTC);
      final cookie1 = StorableCookie(
        name: 'name',
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

      now = now.subtract(const Duration(days: 3));
      var cookie2 = StorableCookie(
        name: 'name',
        value: 'other-value',
        expiryTime: now,
        domain: 'example.com',
        path: '/path',
        creationTime: now,
        lastAccessTime: now,
        persistentFlag: true,
        hostOnlyFlag: true,
        secureOnlyFlag: true,
        httpOnlyFlag: true,
      );
      expect(cookie1, equals(cookie2));
      expect(cookie1.hashCode, equals(cookie2.hashCode));

      cookie2 = StorableCookie(
        name: 'name',
        value: 'other-value',
        expiryTime: now,
        domain: 'example.com',
        path: '/other-path',
        creationTime: now,
        lastAccessTime: now,
        persistentFlag: true,
        hostOnlyFlag: true,
        secureOnlyFlag: true,
        httpOnlyFlag: true,
      );
      expect(cookie1, isNot(equals(cookie2)));
      expect(cookie1.hashCode, isNot(equals(cookie2.hashCode)));

      cookie2 = StorableCookie(
        name: 'name',
        value: 'other-value',
        expiryTime: now,
        domain: 'other.example.com',
        path: '/path',
        creationTime: now,
        lastAccessTime: now,
        persistentFlag: true,
        hostOnlyFlag: true,
        secureOnlyFlag: true,
        httpOnlyFlag: true,
      );
      expect(cookie1, isNot(equals(cookie2)));
      expect(cookie1.hashCode, isNot(equals(cookie2.hashCode)));

      cookie2 = StorableCookie(
        name: 'other-name',
        value: 'other-value',
        expiryTime: now,
        domain: 'example.com',
        path: '/path',
        creationTime: now,
        lastAccessTime: now,
        persistentFlag: true,
        hostOnlyFlag: true,
        secureOnlyFlag: true,
        httpOnlyFlag: true,
      );
      expect(cookie1, isNot(equals(cookie2)));
      expect(cookie1.hashCode, isNot(equals(cookie2.hashCode)));
    });
  });

  test('StorableCookie copyWith', () {
    final now = tz.TZDateTime.now(tz.UTC);
    final cookie1 = StorableCookie(
      name: 'name',
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

    var cookie2 = cookie1.copyWith(
      value: 'different-value',
    );
    expect(cookie1, equals(cookie2));
    expect(cookie1.hashCode, equals(cookie2.hashCode));

    cookie2 = cookie1.copyWith(
      lastAccessTime: now.subtract(const Duration(seconds: 2)),
    );
    expect(cookie1, equals(cookie2));
    expect(cookie1.hashCode, equals(cookie2.hashCode));
  });
}
