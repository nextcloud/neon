// ignore_for_file: avoid_positional_boolean_parameters

import 'package:meta/meta.dart';
import 'package:neon_framework/src/storage/storage.dart';

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

  @override
  List<String> keys() => persistence.keys();
}
