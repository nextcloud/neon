import 'package:neon_storage/neon_storage.dart';
import 'package:test/test.dart';

class _TestCachedPersistence extends CachedPersistence {
  @override
  Future<bool> clear() => throw UnimplementedError();

  @override
  Future<void> reload() => throw UnimplementedError();

  @override
  Future<bool> remove(String key) => throw UnimplementedError();

  @override
  Future<bool> setValue(String key, Object value) => throw UnimplementedError();
}

void main() {
  group('CachedPersistence', () {
    late CachedPersistence persistence;

    setUp(() {
      persistence = _TestCachedPersistence();
    });

    test('setCache', () {
      persistence.setCache('key', 'value');

      expect(
        persistence.cache,
        equals({'key': 'value'}),
      );
    });

    test('getValue', () {
      persistence.cache['key'] = 'value';

      expect(
        persistence.getValue('key'),
        equals('value'),
      );
    });

    test('getValue', () {
      persistence.cache['key'] = 'value';

      expect(
        persistence.containsKey('key'),
        isTrue,
      );
    });
  });
}
