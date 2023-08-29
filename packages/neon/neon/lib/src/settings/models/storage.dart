import 'package:meta/meta.dart';
import 'package:neon/src/models/app_ids.dart';
import 'package:shared_preferences/shared_preferences.dart';

@internal
abstract interface class SettingsStorage {
  String? getString(final String key);

  Future setString(final String key, final String value);

  bool? getBool(final String key);

  // ignore: avoid_positional_boolean_parameters
  Future setBool(final String key, final bool value);

  Future<bool> remove(final String key);
}

@internal
enum StorageKeys {
  apps._('app'),
  accounts._('accounts'),
  global._('global'),
  lastUsedAccount._('last-used-account'),
  lastEndpoint._('last-endpoint'),
  firstLaunch._('first-launch'),
  notifications._(AppIDs.notifications);

  const StorageKeys._(this.value);

  final String value;
}

@internal
final class NeonStorage {
  /// Shared preferences instance.
  ///
  /// Use [database] to access it.
  /// Make sure it has been initialized wiht [init] before.
  static SharedPreferences? _sharedPreferences;

  /// Sets up the [SharedPreferences] instance.
  ///
  /// Required to be called before accessing [database].
  static Future init() async {
    if (_sharedPreferences != null) {
      return;
    }

    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @visibleForTesting
  static SharedPreferences get database {
    if (_sharedPreferences == null) {
      throw StateError(
        'NeonStorage has not been initialized yet. Please make sure NeonStorage.init() has been called before and completed.',
      );
    }

    return _sharedPreferences!;
  }
}

@immutable
@internal
final class SingleValueStorage {
  const SingleValueStorage(this.key);

  final StorageKeys key;

  bool hasValue() => NeonStorage.database.containsKey(key.value);

  Future<bool> remove() => NeonStorage.database.remove(key.value);

  String? getString() => NeonStorage.database.getString(key.value);

  Future setString(final String value) => NeonStorage.database.setString(key.value, value);

  bool? getBool() => NeonStorage.database.getBool(key.value);

  // ignore: avoid_positional_boolean_parameters
  Future setBool(final bool value) => NeonStorage.database.setBool(key.value, value);

  List<String>? getStringList() => NeonStorage.database.getStringList(key.value);

  Future setStringList(final List<String> value) => NeonStorage.database.setStringList(key.value, value);
}

@immutable
@internal
final class AppStorage implements SettingsStorage {
  const AppStorage(
    this.key, [
    this.suffix,
  ]);

  final StorageKeys key;

  final String? suffix;

  String _formatKey(final String key) {
    if (suffix != null) {
      return '${this.key.value}-$suffix-$key';
    }

    return '${this.key.value}-$key';
  }

  bool containsKey(final String key) => NeonStorage.database.containsKey(_formatKey(key));

  @override
  Future<bool> remove(final String key) => NeonStorage.database.remove(_formatKey(key));

  @override
  String? getString(final String key) => NeonStorage.database.getString(_formatKey(key));

  @override
  Future setString(final String key, final String value) => NeonStorage.database.setString(_formatKey(key), value);

  @override
  bool? getBool(final String key) => NeonStorage.database.getBool(_formatKey(key));

  @override
  Future setBool(final String key, final bool value) => NeonStorage.database.setBool(_formatKey(key), value);

  List<String>? getStringList(final String key) => NeonStorage.database.getStringList(_formatKey(key));

  Future setStringList(final String key, final List<String> value) =>
      NeonStorage.database.setStringList(_formatKey(key), value);
}
