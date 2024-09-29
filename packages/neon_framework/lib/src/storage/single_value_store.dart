// ignore_for_file: avoid_positional_boolean_parameters

import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/src/storage/storage.dart';

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
