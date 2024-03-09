// ignore_for_file: cascade_invocations

import 'package:meta/meta.dart';
import 'package:neon_framework/src/storage/persistence.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_platform_interface.dart';
import 'package:shared_preferences_platform_interface/types.dart';

/// The version of the [SharedPreferencesPersistence].
///
/// Needed to make potential migrations in the future.
@visibleForTesting
const int kSharedPreferenceVersion = 1;

/// The default prefix used by `SharedPreferences`.
///
/// Used for legacy reasons to allow seamless upgrades.
// TODO: replace with our packageID
const String _defaultPrefix = 'flutter.';

/// An SharedPreferences backed cached persistence for preferences.
///
/// There is only one cache backing all `SharedPreferencesPersistence`
/// instances. Use the [_prefix] to separate different storages.
/// Keys within a storage must be unique.
@internal
final class SharedPreferencesPersistence implements CachedPersistence {
  /// Creates a new SharedPreferences persistence.
  const SharedPreferencesPersistence({String prefix = ''})
      : _prefix = prefix == '' ? _defaultPrefix : '$_defaultPrefix$prefix-';

  static SharedPreferencesStorePlatform get _store =>
      SharedPreferencesStorePlatform.instance;

  /// The prefix of this persistence.
  ///
  /// Keys within it must be unique.
  @protected
  final String _prefix;

  @override
  Map<String, Object> get cache => _globalCache;

  static final Map<String, Object> _globalCache = {};

  static bool _initialized = false;

  /// Initializes all persistences by setting up the backing SharedPreferences
  /// storage and priming the global cache.
  ///
  /// This must be called and completed before making any calls to persistence.
  static Future<void> init() async {
    if (_initialized) {
      return;
    }

    final fromSystem = await _store.getAll();
    _globalCache.addAll(fromSystem);

    const versionKey = 'neon-version';
    const persistence = SharedPreferencesPersistence();
    if (!persistence.containsKey(versionKey)) {
      await persistence.setValue(versionKey, kSharedPreferenceVersion);
    }

    _initialized = true;
  }

  /// Resets class's static values to allow for testing multiple init calls.
  @visibleForTesting
  static void resetStatic() {
    _globalCache.clear();
    _initialized = false;
  }

  @override
  Object? getValue(String key) {
    final prefixedKey = '$_prefix$key';
    return cache[prefixedKey];
  }

  @override
  void setCache(String key, Object value) {
    final prefixedKey = '$_prefix$key';
    cache[prefixedKey] = value;
  }

  @override
  bool containsKey(String key) {
    final prefixedKey = '$_prefix$key';

    return cache.containsKey(prefixedKey);
  }

  @override
  Future<bool> clear() {
    cache.removeWhere((key, _) => key.startsWith(_prefix));

    return _store.clearWithParameters(
      ClearParameters(
        filter: PreferencesFilter(prefix: _prefix),
      ),
    );
  }

  @override
  Future<void> reload() async {
    final fromSystem = await _store.getAllWithParameters(
      GetAllParameters(
        filter: PreferencesFilter(prefix: _prefix),
      ),
    );

    cache.removeWhere((key, _) => key.startsWith(_prefix));
    cache.addAll(fromSystem);
  }

  @override
  Future<bool> remove(String key) {
    final prefixedKey = '$_prefix$key';

    cache.remove(prefixedKey);
    return _store.remove(prefixedKey);
  }

  @override
  Future<bool> setValue(String key, Object value) {
    final prefixedKey = '$_prefix$key';

    cache[prefixedKey] = value;
    return switch (value) {
      int _ => _store.setValue('Int', prefixedKey, value),
      double _ => _store.setValue('Double', prefixedKey, value),
      String _ => _store.setValue('String', prefixedKey, value),
      bool _ => _store.setValue('Bool', prefixedKey, value),
      // Make a copy of the list so that later mutations won't propagate
      Iterable<String> _ =>
        _store.setValue('StringList', prefixedKey, value.toList()),
      Object() =>
        throw ArgumentError.value(value, 'value', 'Unsupported type.'),
    };
  }
}
