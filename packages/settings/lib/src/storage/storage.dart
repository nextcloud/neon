part of '../../settings.dart';

abstract class SettingsStorage {
  String? getString(final String key);

  Future setString(final String key, final String value);

  bool? getBool(final String key);

  // ignore: avoid_positional_boolean_parameters
  Future setBool(final String key, final bool value);
}
