import 'dart:async';

import 'package:meta/meta.dart';
import 'package:neon_storage/neon_storage.dart';

/// A key value persistence that caches read values to be accessed
/// synchronously.
///
/// Mutating values is asynchronous.
abstract class CachedPersistence<T extends Object> implements Persistence<T> {
  /// Fetches the latest values from the host platform.
  ///
  /// Use this method to observe modifications that were made in the background
  /// like another isolate or native code while the app is already running.
  Future<void> reload();

  /// The cache that holds all values.
  ///
  /// It is instantiated to the current state of the backing database and then
  /// kept in sync via setter methods in this class.
  ///
  /// It is NOT guaranteed that this cache and the backing database will remain
  /// in sync since the setter method might fail for any reason.
  @visibleForTesting
  @protected
  final Map<String, T> cache = {};

  @override
  T? getValue(String key) => cache[key];

  /// Saves a [value] to the cached storage.
  ///
  /// Use this method to cache type conversions of the value that do not change
  /// the meaning of the actual value like a `BuiltList` to `List` conversion.
  /// Changes will not be persisted to the backing storage and will be lost
  /// when the app is restarted.
  void setCache(String key, T value) => cache[key] = value;

  @override
  List<String> keys() => cache.keys.toList();

  @override
  bool containsKey(String key) => cache.containsKey(key);

  @override
  Future<bool> clear();

  @override
  Future<bool> remove(String key);

  @override
  Future<bool> setValue(String key, T value);
}
