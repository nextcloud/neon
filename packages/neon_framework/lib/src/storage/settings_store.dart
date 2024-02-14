// ignore_for_file: avoid_positional_boolean_parameters

import 'package:meta/meta.dart';
import 'package:neon_framework/src/storage/persistence.dart';

/// A storage that can save a group of values primarily used by `Option`s.
///
/// Mimics a subset of the `SharedPreferences` interface to synchronously
/// access data while persisting changes in the background.
///
/// See:
///   * `NeonStorage` to initialize and manage different storage backends.
abstract interface class SettingsStore {
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

/// Default implementation of the [SettingsStore] backed by the given [persistence].
@immutable
@internal
final class DefaultSettingsStore implements SettingsStore {
  /// Creates a new app storage.
  const DefaultSettingsStore(this.persistence, this.id);

  /// The cached persistence backing this storage.
  @protected
  final CachedPersistence persistence;

  @override
  final String id;

  @override
  Future<bool> remove(String key) => persistence.remove(key);

  @override
  String? getString(String key) => persistence.getValue(key) as String?;

  @override
  Future<bool> setString(String key, String value) => persistence.setValue(key, value);

  @override
  bool? getBool(String key) => persistence.getValue(key) as bool?;

  @override
  Future<bool> setBool(String key, bool value) => persistence.setValue(key, value);
}
