import 'dart:async';

import 'package:neon_storage/neon_storage.dart';
import 'package:test/test.dart';

class _TestPersistence implements Persistence {
  @override
  FutureOr<bool> clear() => throw UnimplementedError();

  @override
  FutureOr<bool> containsKey(String key) => throw UnimplementedError();

  @override
  FutureOr<Object?> getValue(String key) => throw UnimplementedError();

  @override
  FutureOr<bool> remove(String key) => throw UnimplementedError();

  @override
  FutureOr<bool> setValue(String key, Object value) => throw UnimplementedError();

  @override
  List<String> keys() => throw UnimplementedError();
}

void main() {
  group('Persistence', () {
    test('can be implemented', () {
      expect(_TestPersistence(), isNotNull);
    });
  });
}
