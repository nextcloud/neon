import 'dart:async';

import 'package:meta/meta.dart';
import 'package:neon_framework/src/settings/models/storage.dart';
import 'package:neon_framework/src/storage/settings_store.dart';
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

  /// Shared preferences instance.
  ///
  /// Use [database] to access it.
  /// Make sure it has been initialized with [init] before.
  SharedPreferences? _sharedPreferences;

  /// Sets up the [SharedPreferences] instance.
  ///
  /// Required to be called before accessing [database].
  Future<void> init() async {
    if (_sharedPreferences != null) {
      return;
    }

    _sharedPreferences = await SharedPreferences.getInstance();
  }

  /// Returns the database instance.
  ///
  /// Throws a `StateError` if [init] has not completed.
  SharedPreferences get database {
    if (_sharedPreferences == null) {
      throw StateError(
        'NeonStorage has not been initialized yet. Please make sure NeonStorage.init() has been called before and completed.',
      );
    }

    return _sharedPreferences!;
  }

  /// Initializes a new `SettingsStorage`.
  SettingsStorage settingsStorage(StorageKeys groupKey, [String? suffix]) => AppStorage(groupKey, suffix);
}
