import 'dart:async';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Neon storage that manages the storage backend.
///
/// [init] must be called and completed before accessing individual storages.
final class NeonStorage {
  const NeonStorage._();

  /// Shared preferences instance.
  ///
  /// Use [database] to access it.
  /// Make sure it has been initialized with [init] before.
  static SharedPreferences? _sharedPreferences;

  /// Initializes the database instance with a mocked value.
  @visibleForTesting
  // ignore: use_setters_to_change_properties
  static void mock(SharedPreferences mock) => _sharedPreferences = mock;

  /// Sets up the [SharedPreferences] instance.
  ///
  /// Required to be called before accessing [database].
  static Future<void> init() async {
    if (_sharedPreferences != null) {
      return;
    }

    _sharedPreferences = await SharedPreferences.getInstance();
  }

  /// Returns the database instance.
  ///
  /// Throws a `StateError` if [init] has not completed.
  static SharedPreferences get database {
    if (_sharedPreferences == null) {
      throw StateError(
        'NeonStorage has not been initialized yet. Please make sure NeonStorage.init() has been called before and completed.',
      );
    }

    return _sharedPreferences!;
  }
}
