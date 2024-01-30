import 'package:neon_framework/src/settings/models/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
export 'package:neon_framework/src/storage/storage_manager.dart';

/// A storage that itself is a single entry of a key value store.
///
/// Mimics the interface of [SharedPreferences].
///
/// See:
///   * `NeonStorage` to initialize and manage the storage backends.
abstract interface class KeyValueStorage {
  /// The key used by the storage backend.
  StorageKeys get key;

  /// {@macro NeonStorage.containsKey}
  bool hasValue();

  /// {@template NeonStorage.getString}
  /// Reads a value from persistent storage, throwing an `Exception` if it's not a `String`.
  /// {@endtemplate}
  String? getString();

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
  Future<bool> setString(String value);

  /// {@template NeonStorage.getBool}
  /// Reads a value from persistent storage, throwing an `Exception` if it's not a `bool`.
  /// {@endtemplate}
  bool? getBool();

  /// {@template NeonStorage.setBool}
  /// Saves a `bool` [value] to persistent storage in the background.
  /// {@endtemplate}
  // ignore: avoid_positional_boolean_parameters
  Future<bool> setBool(bool value);

  /// {@template NeonStorage.remove}
  /// Removes an entry from persistent storage.
  /// {@endtemplate}
  Future<bool> remove();

  /// {@macro NeonStorage.getStringList}
  List<String>? getStringList();

  /// {@macro NeonStorage.setStringList}
  Future<bool> setStringList(List<String> value);
}
