import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/src/storage/keys.dart';
import 'package:neon_framework/src/storage/request_cache.dart';
import 'package:neon_framework/src/storage/secure_storage.dart';
import 'package:neon_framework/src/storage/settings_store.dart';
import 'package:neon_framework/src/storage/shared_preferences_persistence.dart';
import 'package:neon_framework/src/storage/single_value_store.dart';
import 'package:neon_framework/src/storage/sqlite_persistence.dart';

/// Neon storage that manages the storage backend.
///
/// [init] must be called and completed before accessing individual storages.
///
/// Platform implementation:
///   * `Web`: The storages are backed by an unencrypted [SharedPreferencesPersistence],
///     and with no enabled [requestCache] as requests are already cached by the
///     underlying browser.
///   * `Mobile` and `Desktop`: Both the [requestCache] and storages are
///     persisted in an sqlcipher encrypted [SQLitePersistence]. The encryption
///     key is securely stored in the [NeonSecureStorage] using the local key-chains.
@sealed
class NeonStorage {
  /// Accesses the current instance of the storage, creating a new one if non
  /// existent.
  factory NeonStorage() => instance ??= NeonStorage._();

  /// Mocks the storage for testing.
  @visibleForTesting
  factory NeonStorage.mocked(NeonStorage mocked) => instance = mocked;

  NeonStorage._();

  /// The current instance of the storage.
  ///
  /// Setting this to null resets the singleton leading to a new storage being
  /// created on the next access of the constructor.
  @visibleForTesting
  static NeonStorage? instance;

  bool _initialized = false;

  /// Whether the storages have been initialized.
  bool get initialized => _initialized;

  /// Sets the individual storages.
  ///
  /// Required to be called before accessing any individual one.
  Future<void> init() async {
    if (_initialized) {
      return;
    }

    if (kIsWeb) {
      await SharedPreferencesPersistence.init();
    } else {
      final encryptionKey = await const NeonSecureStorage().encryptionKey;

      final requestCache = DefaultRequestCache();
      await requestCache.init(encryptionKey);
      _requestCache = requestCache;

      await SQLitePersistence.init(encryptionKey);
    }

    _initialized = true;
  }

  /// Request cache instance.
  RequestCache? _requestCache;

  /// The current request cache if available.
  RequestCache? get requestCache {
    _assertInitialized();

    return _requestCache;
  }

  /// Initializes a new `SettingsStorage`.
  ///
  /// The value of the provided [groupKey] must not be empty to avoid conflicts
  /// with the [SingleValueStore].
  SettingsStore settingsStore(StorageKeys groupKey, [String? suffix]) {
    _assertInitialized();

    var key = groupKey.value;

    if (key.isEmpty) {
      throw ArgumentError.value(key, 'key', 'must not be empty to avoid conflicts with the `SingleValueStore`.');
    }

    if (suffix != null) {
      key = '$key-$suffix';
    }

    final storage = kIsWeb ? SharedPreferencesPersistence(prefix: key) : SQLitePersistence(prefix: key);
    return DefaultSettingsStore(storage, suffix ?? groupKey.name);
  }

  /// Initializes a new `KeyValueStorage`.
  SingleValueStore singleValueStore(StorageKeys key) {
    _assertInitialized();

    final storage = kIsWeb ? const SharedPreferencesPersistence() : SQLitePersistence();
    return DefaultSingleValueStore(storage, key);
  }

  void _assertInitialized() {
    if (!_initialized) {
      throw StateError(
        'NeonStorage has not been initialized yet. Please make sure NeonStorage.init() has been called before and completed.',
      );
    }
  }
}
