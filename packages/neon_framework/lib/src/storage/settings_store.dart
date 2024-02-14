// ignore_for_file: avoid_positional_boolean_parameters

import 'package:meta/meta.dart';
import 'package:neon_framework/src/storage/keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A storage that can save a group of values primarily used by `Option`s.
///
/// Mimics a subset of the `SharedPreferences` interface to synchronously
/// access data while persisting changes in the background.
///
/// See:
///   * `NeonStorage` to initialize and manage different storage backends.
abstract interface class SettingsStore {
  /// The group key for this app storage.
  StorageKeys get groupKey;

  /// The optional suffix of the storage key.
  ///
  /// Used to differentiate between multiple AppStorages with the same [groupKey].
  String? get suffix;

  /// The id that uniquely identifies this app storage.
  ///
  /// Used in `Exportable` classes.
  String get id;

  /// Reads a value from persistent storage, throwing an `Exception` if it is
  /// not a `String`.
  String? getString(String key);

  /// Saves a `String` [value] to persistent storage in the background.
  Future<bool> setString(String key, String value);

  /// Reads a value from persistent storage, throwing an `Exception` if it is
  /// not a `bool`.
  bool? getBool(String key);

  /// Saves a `bool` [value] to persistent storage in the background.
  Future<bool> setBool(String key, bool value);

  /// Removes an entry from persistent storage.
  Future<bool> remove(String key);
}

/// Default implementation of the [SettingsStore] backed by the given [database].
@immutable
@internal
final class DefaultSettingsStore implements SettingsStore {
  /// Creates a new app storage.
  const DefaultSettingsStore(
    this.database,
    this.groupKey, [
    this.suffix,
  ]);

  @protected
  final SharedPreferences database;

  /// The group key for this app storage.
  ///
  /// Keys are formatted with [formatKey]
  @override
  final StorageKeys groupKey;

  @override
  final String? suffix;

  /// Returns the id for this app storage.
  ///
  /// Uses the [suffix] and falling back to the [groupKey] if not present.
  /// This uniquely identifies the storage and is used in `Exportable` classes.
  @override
  String get id => suffix ?? groupKey.value;

  /// Concatenates the [groupKey], [suffix] and [key] to build a unique key
  /// used in the storage backend.
  @visibleForTesting
  String formatKey(String key) {
    if (suffix != null) {
      return '${groupKey.value}-$suffix-$key';
    }

    return '${groupKey.value}-$key';
  }

  @override
  Future<bool> remove(String key) => database.remove(formatKey(key));

  @override
  String? getString(String key) => database.getString(formatKey(key));

  @override
  Future<bool> setString(String key, String value) => database.setString(formatKey(key), value);

  @override
  bool? getBool(String key) => database.getBool(formatKey(key));

  @override
  Future<bool> setBool(String key, bool value) => database.setBool(formatKey(key), value);
}
