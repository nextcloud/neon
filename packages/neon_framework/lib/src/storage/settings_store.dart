import 'package:meta/meta.dart';
import 'package:neon_framework/src/settings/models/storage.dart';
import 'package:neon_framework/src/storage/storage_manager.dart';

/// Storage interface used by `Option`s.
///
/// See:
///   * [NeonStorage] that manages the storage backend.
abstract interface class SettingsStorage {
  /// The group key for this app storage.
  StorageKeys get groupKey;

  /// The optional suffix of the storage key.
  ///
  /// Used to differentiate between multiple AppStorages with the same [groupKey].
  String? get suffix;

  /// The id for this app storage.
  String get id;

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

/// A storage that can save a group of values.
///
/// Implements the interface of `SharedPreferences`.
/// [NeonStorage.init] must be called and completed before accessing individual values.
///
/// See:
///   * [NeonStorage] to initialize and manage the storage backends.
@immutable
@internal
final class AppStorage implements SettingsStorage {
  /// Creates a new app storage.
  const AppStorage(
    this.groupKey, [
    this.suffix,
  ]);

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
  Future<bool> remove(String key) => NeonStorage().database.remove(formatKey(key));

  @override
  String? getString(String key) => NeonStorage().database.getString(formatKey(key));

  @override
  Future<bool> setString(String key, String value) => NeonStorage().database.setString(formatKey(key), value);

  @override
  bool? getBool(String key) => NeonStorage().database.getBool(formatKey(key));

  @override
  Future<bool> setBool(String key, bool value) => NeonStorage().database.setBool(formatKey(key), value);
}
