import 'dart:async';

import 'package:meta/meta.dart';
import 'package:neon_framework/src/storage/storage.dart';

/// Neon storage that manages the storage backend.
///
/// [init] must be called and completed before accessing individual storages.
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

    _neonCache = NeonCacheDB();
    _neonData = NeonDataDB();

    await _neonCache.init();
    await _neonData.init();

    _initialized = true;
  }

  late NeonCacheDB _neonCache;
  late NeonDataDB _neonData;

  /// The current request cache if available.
  RequestCache? get requestCache {
    _assertInitialized();

    return _neonCache.requestCache;
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

    final storage = SQLiteCachedPersistence(prefix: key);
    return DefaultSettingsStore(storage, suffix ?? groupKey.name);
  }

  /// Initializes a new `KeyValueStorage`.
  SingleValueStore singleValueStore(StorageKeys key) {
    _assertInitialized();

    final storage = SQLiteCachedPersistence();
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
