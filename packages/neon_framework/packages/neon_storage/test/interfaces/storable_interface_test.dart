import 'package:neon_storage/neon_storage.dart';
import 'package:test/test.dart';

class _TestStorable implements Storable {
  @override
  String get value => throw UnimplementedError();
}

void main() {
  group('Storable', () {
    test('can be implemented', () {
      expect(_TestStorable(), isNotNull);
    });
  });
}
