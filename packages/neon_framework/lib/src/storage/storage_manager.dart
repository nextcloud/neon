import 'dart:async';

import 'package:meta/meta.dart';
import 'package:neon_framework/src/storage/keys.dart';
import 'package:neon_framework/src/storage/settings_store.dart';
import 'package:neon_framework/src/storage/single_value_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  /// Shared preferences instance.
  late SharedPreferences _sharedPreferences;

  /// Sets the individual storages.
  ///
  /// Required to be called before accessing any individual one.
  Future<void> init() async {
    if (_initialized) {
      return;
    }

    _sharedPreferences = await SharedPreferences.getInstance();

    _initialized = true;
  }

  /// Returns the database instance.
  ///
  /// Throws a `StateError` if [init] has not completed.
  SharedPreferences get database {
    _assertInitialized();

    return _sharedPreferences;
  }

  /// Initializes a new `SettingsStorage`.
  SettingsStore settingsStore(StorageKeys groupKey, [String? suffix]) {
    _assertInitialized();

    return DefaultSettingsStore(groupKey, suffix);
  }

  /// Initializes a new `KeyValueStorage`.
  SingleValueStore singleValueStore(StorageKeys key) {
    _assertInitialized();

    return DefaultSingleValueStore(key);
  }

  void _assertInitialized() {
    if (!_initialized) {
      throw StateError(
        'NeonStorage has not been initialized yet. Please make sure NeonStorage.init() has been called before and completed.',
      );
    }
  }
}
