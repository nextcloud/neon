// ignore_for_file: avoid_positional_boolean_parameters

import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/src/storage/keys.dart';
import 'package:neon_framework/src/storage/persistence.dart';

/// A storage that itself is a single entry of a key value store.
///
/// Mimics a subset of the `SharedPreferences` interface to synchronously
/// access a single value while persisting changes in the background.
///
/// See:
///   * `NeonStorage` to initialize and manage different storage backends.
abstract interface class SingleValueStore {
  /// The key used by the storage backend.
  StorageKeys get key;

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

/// Default implementation of the [SingleValueStore] backed by the given [persistence].
@immutable
@internal
final class DefaultSingleValueStore implements SingleValueStore {
  /// Creates a new storage for a single value.
  const DefaultSingleValueStore(this.persistence, this.key);

  /// The cached persistence backing this storage.
  @protected
  final CachedPersistence persistence;

  @override
  final StorageKeys key;

  @override
  bool hasValue() => persistence.containsKey(key.value);

  @override
  Future<bool> remove() => persistence.remove(key.value);

  @override
  String? getString() => persistence.getValue(key.value) as String?;
  @override
  Future<bool> setString(String value) => persistence.setValue(key.value, value);

  @override
  bool? getBool() => persistence.getValue(key.value) as bool?;

  @override
  Future<bool> setBool(bool value) => persistence.setValue(key.value, value);

  @override
  BuiltList<String>? getStringList() {
    final key = this.key.value;
    var list = persistence.getValue(key) as Iterable?;

    if (list is! BuiltList<String>?) {
      list = BuiltList<String>.from(list);
      persistence.setCache(key, list);
      return list;
    }

    return list;
  }

  @override
  Future<bool> setStringList(BuiltList<String> value) => persistence.setValue(key.value, value);
}
