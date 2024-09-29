import 'package:neon_storage/neon_storage.dart';
import 'package:test/test.dart';

class _TestSettingsStore implements SettingsStore {
  @override
  bool? getBool(String key) => throw UnimplementedError();

  @override
  String? getString(String key) => throw UnimplementedError();

  @override
  String get id => throw UnimplementedError();

  @override
  Future<bool> remove(String key) => throw UnimplementedError();

  @override
  Future<bool> setBool(String key, bool value) => throw UnimplementedError();

  @override
  Future<bool> setString(String key, String value) => throw UnimplementedError();

  @override
  List<String> keys() => throw UnimplementedError();
}

void main() {
  group('SettingsStore', () {
    test('can be implemented', () {
      expect(_TestSettingsStore(), isNotNull);
    });
  });
}
