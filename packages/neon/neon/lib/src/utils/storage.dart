import 'package:settings/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorage implements SettingsStorage {
  AppStorage(
    this._id,
    this._sharedPreferences,
  );

  final String _id;
  final SharedPreferences _sharedPreferences;

  String _formatKey(final String key) => '$_id-$key';

  bool containsKey(final String key) => _sharedPreferences.containsKey(_formatKey(key));

  Future<bool> remove(final String key) => _sharedPreferences.remove(_formatKey(key));

  @override
  String? getString(final String key) => _sharedPreferences.getString(_formatKey(key));

  @override
  Future setString(final String key, final String value) => _sharedPreferences.setString(_formatKey(key), value);

  @override
  bool? getBool(final String key) => _sharedPreferences.getBool(_formatKey(key));

  @override
  Future setBool(final String key, final bool value) => _sharedPreferences.setBool(_formatKey(key), value);

  List<String>? getStringList(final String key) => _sharedPreferences.getStringList(_formatKey(key));

  Future setStringList(final String key, final List<String> value) =>
      _sharedPreferences.setStringList(_formatKey(key), value);
}
