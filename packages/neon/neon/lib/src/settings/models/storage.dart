import 'package:meta/meta.dart';
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
class AppStorage implements SettingsStorage {
  const AppStorage(this._id);

  final String _id;

  String _formatKey(final String key) => '$_id-$key';

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
