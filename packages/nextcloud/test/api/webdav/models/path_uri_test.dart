import 'package:nextcloud/webdav.dart';
import 'package:test/test.dart';

void main() {
  group('PathUri', () {
    test('isAbsolute', () {
      expect(PathUri.parse('').isAbsolute, false);
      expect(PathUri.parse('/').isAbsolute, true);
      expect(PathUri.parse('test').isAbsolute, false);
      expect(PathUri.parse('test/').isAbsolute, false);
      expect(PathUri.parse('/test').isAbsolute, true);
      expect(PathUri.parse('/test/').isAbsolute, true);
    });

    test('isDirectory', () {
      expect(PathUri.parse('').isDirectory, true);
      expect(PathUri.parse('/').isDirectory, true);
      expect(PathUri.parse('test').isDirectory, false);
      expect(PathUri.parse('test/').isDirectory, true);
      expect(PathUri.parse('/test').isDirectory, false);
      expect(PathUri.parse('/test/').isDirectory, true);
    });

    test('pathSegments', () {
      expect(PathUri.parse('').pathSegments, isEmpty);
      expect(PathUri.parse('/').pathSegments, isEmpty);
      expect(PathUri.parse('test').pathSegments, ['test']);
      expect(PathUri.parse('test/').pathSegments, ['test']);
      expect(PathUri.parse('/test').pathSegments, ['test']);
      expect(PathUri.parse('/test/').pathSegments, ['test']);
    });

    test('path', () {
      expect(PathUri.parse('').path, '');
      expect(PathUri.parse('/').path, '/');
      expect(PathUri.parse('test').path, 'test');
      expect(PathUri.parse('test/').path, 'test/');
      expect(PathUri.parse('/test').path, '/test');
      expect(PathUri.parse('/test/').path, '/test/');
    });

    test('normalization', () {
      expect(PathUri.parse('/test/abc/').path, '/test/abc/');
      expect(PathUri.parse('//test//abc//').path, '/test/abc/');
      expect(PathUri.parse('///test///abc///').path, '/test/abc/');
    });

    test('name', () {
      expect(PathUri.parse('').name, '');
      expect(PathUri.parse('test').name, 'test');
      expect(PathUri.parse('/test/').name, 'test');
      expect(PathUri.parse('abc/test').name, 'test');
      expect(PathUri.parse('/abc/test/').name, 'test');
    });

    test('parent', () {
      expect(PathUri.parse('').parent, null);
      expect(PathUri.parse('/').parent, null);
      expect(PathUri.parse('test').parent, PathUri.parse(''));
      expect(PathUri.parse('test/abc').parent, PathUri.parse('test/'));
      expect(PathUri.parse('test/abc/').parent, PathUri.parse('test/'));
      expect(PathUri.parse('/test/abc').parent, PathUri.parse('/test/'));
      expect(PathUri.parse('/test/abc/').parent, PathUri.parse('/test/'));
    });

    test('join', () {
      expect(PathUri.parse('').join(PathUri.parse('test')), PathUri.parse('test'));
      expect(PathUri.parse('/').join(PathUri.parse('test')), PathUri.parse('/test'));
      expect(() => PathUri.parse('test').join(PathUri.parse('abc')), throwsA(isA<StateError>()));
      expect(PathUri.parse('test/').join(PathUri.parse('abc')), PathUri.parse('test/abc'));
      expect(PathUri.parse('test/').join(PathUri.parse('abc/123')), PathUri.parse('test/abc/123'));
      expect(PathUri.parse('/test/').join(PathUri.parse('abc')), PathUri.parse('/test/abc'));
      expect(PathUri.parse('/test/').join(PathUri.parse('/abc')), PathUri.parse('/test/abc'));
      expect(PathUri.parse('/test/').join(PathUri.parse('/abc/')), PathUri.parse('/test/abc/'));
    });

    test('rename', () {
      expect(PathUri.parse('').rename('test'), PathUri.parse(''));
      expect(PathUri.parse('test').rename('abc'), PathUri.parse('abc'));
      expect(PathUri.parse('test/').rename('abc'), PathUri.parse('abc/'));
      expect(PathUri.parse('test/abc').rename('123'), PathUri.parse('test/123'));
      expect(PathUri.parse('test/abc/').rename('123'), PathUri.parse('test/123/'));
      expect(() => PathUri.parse('test').rename('abc/'), throwsA(isA<Exception>()));
      expect(() => PathUri.parse('test/').rename('abc/'), throwsA(isA<Exception>()));
      expect(() => PathUri.parse('test').rename('/abc'), throwsA(isA<Exception>()));
      expect(() => PathUri.parse('test/').rename('/abc'), throwsA(isA<Exception>()));
      expect(() => PathUri.parse('test').rename('abc/123'), throwsA(isA<Exception>()));
      expect(() => PathUri.parse('test/').rename('abc/123'), throwsA(isA<Exception>()));
    });
  });
}
