import 'dart:async';

import 'package:neon_framework/src/utils/request_manager.dart';

/// A storage used to cache a key value pair.
abstract interface class CacheInterface {
  /// Get's the cached value for the given [key].
  ///
  /// Use [getParameters] if you only need to check whether the cache is still
  /// valid.
  Future<String?> get(String key);

  /// Set's the cached [value] at the given [key].
  ///
  /// If a value is already present it will be updated with the new one.
  Future<void> set(String key, String value, CacheParameters? parameters);

  /// Retrieves the cache parameters for the given [key].
  Future<CacheParameters> getParameters(String key);

  /// Updates the cache [parameters] for a given [key] without modifying the `value`.
  Future<void> updateParameters(String key, CacheParameters? parameters);
}
