// ignore_for_file: avoid_positional_boolean_parameters

import 'package:built_collection/built_collection.dart';
import 'package:neon_storage/neon_storage.dart';

/// A storage that itself is a single entry of a key value store.
///
/// Mimics a subset of the `SharedPreferences` interface to synchronously
/// access a single value while persisting changes in the background.
///
/// See:
///   * `NeonStorage` to initialize and manage different storage backends.
abstract interface class SingleValueStore<T extends Storable> {
  /// The key used by the storage backend.
  T get key;

  /// Returns true if the persistent storage contains a value at the given [key].
  bool hasValue();

  /// Reads a value from persistent storage, throwing an `Exception` if it is
  /// not a `String`.
  String? getString();

  /// Saves a `String` [value] to persistent storage in the background.
  Future<bool> setString(String value);

  /// Reads a value from persistent storage, throwing an `Exception` if it is
  /// not a `bool`.
  bool? getBool();

  /// Saves a `bool` [value] to persistent storage in the background.
  Future<bool> setBool(bool value);

  /// Removes an entry from persistent storage.
  Future<bool> remove();

  /// Reads a set of string values from persistent storage, throwing an
  /// `Exception` if it's not a `String` collection.
  BuiltList<String>? getStringList();

  /// Saves a list of strings [value] to persistent storage in the background.
  Future<bool> setStringList(BuiltList<String> value);
}
