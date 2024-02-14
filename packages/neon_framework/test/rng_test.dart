import 'package:flutter_test/flutter_test.dart';
import 'package:neon_framework/src/utils/rng.dart';

void main() {
  group('CryptoRNG', () {
    const rng = CryptoRNG();

    test('lengths', () {
      expect(() => rng.generate(-1), throwsA(isA<ArgumentError>()));
      expect(() => rng.generate(5), throwsA(isA<ArgumentError>()));

      expect(rng.generate(0), hasLength(0));
      expect(rng.generate(4), hasLength(4));
    });

    test('not equal', () {
      expect(rng.generate(), isNot(equals(rng.generate())));
    });

    test('unmodifiable', () {
      final random = rng.generate(4);

      expect(() => random[2] = 5, throwsA(isA<Error>()));
    });
  });
}
