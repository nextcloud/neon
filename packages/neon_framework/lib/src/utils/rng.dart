import 'dart:math' as math;
import 'dart:typed_data';

/// Cryptographically secure random number generator.
///
/// Copied from `https://github.com/daegalus/dart-uuid/blob/4.3.3/lib/rng.dart`.
class CryptoRNG {
  /// Creates a new secure random number generator.
  const CryptoRNG();

  static final _secureRandom = math.Random.secure();

  /// Generates a unmodifiable list with [length] random bytes.
  ///
  /// Length must be a positive multiple of `4`.
  Uint8List generate([int length = 32]) {
    if (length < 0 || length % 4 != 0) {
      throw ArgumentError.value(length, 'length', 'must be a positive multiple of 4.');
    }

    final b = Uint8List(length);
    for (var i = 0; i < length; i += 4) {
      final k = _secureRandom.nextInt(math.pow(2, 32) as int);
      b[i] = k;
      b[i + 1] = k >> 8;
      b[i + 2] = k >> 16;
      b[i + 3] = k >> 24;
    }

    return b.asUnmodifiableView();
  }
}
