import 'package:built_collection/src/list.dart';
import 'package:neon_storage/neon_storage.dart';
import 'package:test/test.dart';

class _TestSingleValueStore implements SingleValueStore {
  @override
  bool? getBool() => throw UnimplementedError();

  @override
  String? getString() => throw UnimplementedError();

  @override
  BuiltList<String>? getStringList() => throw UnimplementedError();

  @override
  bool hasValue() => throw UnimplementedError();

  @override
  Storable get key => throw UnimplementedError();

  @override
  Future<bool> remove() => throw UnimplementedError();

  @override
  Future<bool> setBool(bool value) => throw UnimplementedError();

  @override
  Future<bool> setString(String value) => throw UnimplementedError();

  @override
  Future<bool> setStringList(BuiltList<String> value) => throw UnimplementedError();
}

void main() {
  group('SingleValueStore', () {
    test('can be implemented', () {
      expect(_TestSingleValueStore(), isNotNull);
    });
  });
}
