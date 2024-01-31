import 'package:meta/meta.dart';
import 'package:neon_framework/src/storage/keys.dart';
import 'package:neon_framework/src/storage/storage_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A storage that itself is a single entry of a key value store.
///
/// Mimics the interface of [SharedPreferences].
///
/// See:
///   * `NeonStorage` to initialize and manage the storage backends.
abstract interface class SingleValueStore {
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

/// A storage that saves a single value.
///
/// [NeonStorage.init] must be called and completed before accessing individual values.
///
/// See:
///   * [NeonStorage] to initialize and manage the storage backends.
@immutable
@internal
final class DefaultSingleValueStore implements SingleValueStore {
  /// Creates a new storage for a single value.
  const DefaultSingleValueStore(this.key);

  @override
  final StorageKeys key;

  @override
  bool hasValue() => NeonStorage().database.containsKey(key.value);

  @override
  Future<bool> remove() => NeonStorage().database.remove(key.value);

  @override
  String? getString() => NeonStorage().database.getString(key.value);

  @override
  Future<bool> setString(String value) => NeonStorage().database.setString(key.value, value);

  @override
  bool? getBool() => NeonStorage().database.getBool(key.value);

  @override
  Future<bool> setBool(bool value) => NeonStorage().database.setBool(key.value, value);

  @override
  List<String>? getStringList() => NeonStorage().database.getStringList(key.value);

  @override
  Future<bool> setStringList(List<String> value) => NeonStorage().database.setStringList(key.value, value);
}
