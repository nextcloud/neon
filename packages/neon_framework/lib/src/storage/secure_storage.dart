import 'package:flutter/foundation.dart';
import 'package:hex/hex.dart';
import 'package:meta/meta.dart' show internal;
import 'package:neon_framework/src/storage/keys.dart';
import 'package:neon_framework/src/storage/persistence.dart';
import 'package:neon_framework/src/storage/secure_persistence.dart';
import 'package:neon_framework/src/utils/rng.dart';

/// Storable keys for the [SecureStorage].
@internal
enum SecureStorageKeys with StorableEnum implements Storable {
  /// Ued to store the encryption key for the `StorageManager`.
  encryption;
}

/// Storage to persist data encrypted on the device.
@internal
abstract interface class SecureStorage {
  /// Reads the hex encoded encryption key from storage if available.
  ///
  /// If no key has been saved yet a new cryptographically secure 256bit key
  /// is generated and saved.
  Future<String> get encryptionKey;
}

/// Default SecureStorage implementation.
///
/// Leverages the `https://pub.dev/packages/flutter_secure_storage` to persist
/// values encrypted on the device.
///
/// Performance might be slow for big data so it is recommended to only store
/// encryption keys and persist the encrypted separately.
@immutable
@internal
final class NeonSecureStorage implements SecureStorage {
  /// Creates a new secure storage.
  const NeonSecureStorage([this.persistence = const SecurePersistence()]);

  @protected
  final Persistence<String> persistence;

  @override
  Future<String> get encryptionKey async {
    final key = SecureStorageKeys.encryption.value;
    var value = await persistence.getValue(key);

    if (value != null) {
      return value;
    }

    value ??= HEX.encode(const CryptoRNG().generate());
    await persistence.setValue(key, value);

    return value;
  }
}
