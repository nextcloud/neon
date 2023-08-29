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

@immutable
@internal
class AppStorage implements SettingsStorage {
  const AppStorage(this._id);

  final String _id;

  /// Shared preferences instance.
  ///
  /// Use [reqireDatabase] to access it.
  /// Make sure it has been initialized wiht [init] before.
  static SharedPreferences? _sharedPreferences;

  /// Sets up the [SharedPreferences] instance.
  ///
  /// Required to be called before accessing [reqireDatabase].
  static Future init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @visibleForTesting
  static SharedPreferences get reqireDatabase {
    if (_sharedPreferences == null) {
      throw StateError(
        'AppStorage has not been initialized yet. Please make sure AppStorage.init() has been called before and completed.',
      );
    }

    return _sharedPreferences!;
  }

  String _formatKey(final String key) => '$_id-$key';

  bool containsKey(final String key) => reqireDatabase.containsKey(_formatKey(key));

  @override
  Future<bool> remove(final String key) => reqireDatabase.remove(_formatKey(key));

  @override
  String? getString(final String key) => reqireDatabase.getString(_formatKey(key));

  @override
  Future setString(final String key, final String value) => reqireDatabase.setString(_formatKey(key), value);

  @override
  bool? getBool(final String key) => reqireDatabase.getBool(_formatKey(key));

  @override
  Future setBool(final String key, final bool value) => reqireDatabase.setBool(_formatKey(key), value);

  List<String>? getStringList(final String key) => reqireDatabase.getStringList(_formatKey(key));

  Future setStringList(final String key, final List<String> value) =>
      reqireDatabase.setStringList(_formatKey(key), value);
}
