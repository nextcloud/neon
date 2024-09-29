import 'dart:async';

/// A persistent key value storage.
abstract interface class Persistence<T extends Object> {
  /// Whether a value exists at the given [key].
  FutureOr<bool> containsKey(String key);

  /// Clears all values from persistent storage.
  FutureOr<bool> clear();

  /// Removes an entry from persistent storage.
  FutureOr<bool> remove(String key);

  /// Saves a [value] to persistent storage.
  FutureOr<bool> setValue(String key, T value);

  /// Fetches the value persisted at the given [key] from the persistent
  /// storage.
  FutureOr<T?> getValue(String key);

  /// Returns all keys in the persistent storage.
  FutureOr<List<String>> keys();
}
