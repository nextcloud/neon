/// Storage interface used by `Option`s.
///
/// See:
///   * `NeonStorage` to initialize and manage the storage backends.
abstract interface class SettingsStorage {
  /// {@template NeonStorage.getString}
  /// Reads a value from persistent storage, throwing an `Exception` if it's not a `String`.
  /// {@endtemplate}
  String? getString(String key);

  /// {@template NeonStorage.setString}
  /// Saves a `String` [value] to persistent storage in the background.
  ///
  /// Note: Due to limitations in Android's SharedPreferences,
  /// values cannot start with any one of the following:
  ///
  /// - 'VGhpcyBpcyB0aGUgcHJlZml4IGZvciBhIGxpc3Qu'
  /// - 'VGhpcyBpcyB0aGUgcHJlZml4IGZvciBCaWdJbnRlZ2Vy'
  /// - 'VGhpcyBpcyB0aGUgcHJlZml4IGZvciBEb3VibGUu'
  /// {@endtemplate}
  Future<bool> setString(String key, String value);

  /// {@template NeonStorage.getBool}
  /// Reads a value from persistent storage, throwing an `Exception` if it's not a `bool`.
  /// {@endtemplate}
  bool? getBool(String key);

  /// {@template NeonStorage.setBool}
  /// Saves a `bool` [value] to persistent storage in the background.
  /// {@endtemplate}
  // ignore: avoid_positional_boolean_parameters
  Future<bool> setBool(String key, bool value);

  /// {@template NeonStorage.remove}
  /// Removes an entry from persistent storage.
  /// {@endtemplate}
  Future<bool> remove(String key);
}
