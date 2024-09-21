// ignore_for_file: avoid_positional_boolean_parameters

/// A storage that can save a group of values primarily used by `Option`s.
///
/// Mimics a subset of the `SharedPreferences` interface to synchronously
/// access data while persisting changes in the background.
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

  /// Returns all keys in the persistent storage.
  List<String> keys();
}
