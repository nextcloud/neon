// ignore_for_file: inference_failure_on_instance_creation

import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/src/storage/keys.dart';
import 'package:neon_framework/src/storage/settings_store.dart';
import 'package:neon_framework/src/storage/single_value_store.dart';
import 'package:neon_framework/testing.dart';

void main() {
  group('Storages', () {
    late MockPersistence persistence;

    setUp(() {
      persistence = MockPersistence();
    });

    test('AppStorage interface', () async {
      final appStorage =
          DefaultSettingsStore(persistence, StorageKeys.accountOptions.value);
      const key = 'key';

      when(() => persistence.remove(key))
          .thenAnswer((_) => Future.value(false));
      dynamic result = await appStorage.remove(key);
      expect(result, equals(false));
      verify(() => persistence.remove(key)).called(1);

      when(() => persistence.getValue(key)).thenReturn(null);
      result = appStorage.getString(key);
      expect(result, isNull);
      verify(() => persistence.getValue(key)).called(1);

      when(() => persistence.setValue(key, 'value'))
          .thenAnswer((_) => Future.value(false));
      result = await appStorage.setString(key, 'value');
      expect(result, false);
      verify(() => persistence.setValue(key, 'value')).called(1);

      when(() => persistence.getValue(key)).thenReturn(true);
      result = appStorage.getBool(key);
      expect(result, equals(true));
      verify(() => persistence.getValue(key)).called(1);

      when(() => persistence.setValue(key, true))
          .thenAnswer((_) => Future.value(true));
      result = await appStorage.setBool(key, true);
      expect(result, true);
      verify(() => persistence.setValue(key, true)).called(1);
    });

    test('SingleValueStorage', () async {
      final storage = DefaultSingleValueStore(persistence, StorageKeys.global);
      final key = StorageKeys.global.value;

      when(() => persistence.containsKey(key)).thenReturn(true);
      dynamic result = storage.hasValue();
      expect(result, equals(true));
      verify(() => persistence.containsKey(key)).called(1);

      when(() => persistence.remove(key))
          .thenAnswer((_) => Future.value(false));
      result = await storage.remove();
      expect(result, equals(false));
      verify(() => persistence.remove(key)).called(1);

      when(() => persistence.getValue(key)).thenReturn(null);
      result = storage.getString();
      expect(result, isNull);
      verify(() => persistence.getValue(key)).called(1);

      when(() => persistence.setValue(key, 'value'))
          .thenAnswer((_) => Future.value(false));
      result = await storage.setString('value');
      expect(result, false);
      verify(() => persistence.setValue(key, 'value')).called(1);

      when(() => persistence.getValue(key)).thenReturn(true);
      result = storage.getBool();
      expect(result, equals(true));
      verify(() => persistence.getValue(key)).called(1);

      when(() => persistence.setValue(key, true))
          .thenAnswer((_) => Future.value(true));
      result = await storage.setBool(true);
      expect(result, true);
      verify(() => persistence.setValue(key, true)).called(1);

      when(() => persistence.getValue(key)).thenReturn(BuiltList(['hi there']));
      result = storage.getStringList();
      expect(result, equals(['hi there']));
      verify(() => persistence.getValue(key)).called(1);

      when(() => persistence.setValue(key, BuiltList(['hi there'])))
          .thenAnswer((_) => Future.value(false));
      result = await storage.setStringList(BuiltList(['hi there']));
      expect(result, false);
      verify(() => persistence.setValue(key, BuiltList(['hi there'])))
          .called(1);
    });
  });
}
