// ignore_for_file: inference_failure_on_instance_creation

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/src/storage/settings_store.dart';
import 'package:neon_framework/storage.dart';

class _MockCachedPersistence<T extends Object> extends Mock implements CachedPersistence<T> {}

void main() {
  group('Storages', () {
    late CachedPersistence persistence;

    setUp(() {
      persistence = _MockCachedPersistence();
    });

    test('DefaultSettingsStore', () async {
      final appStorage = DefaultSettingsStore(persistence, StorageKeys.accountOptions.value);
      const key = 'key';

      when(() => persistence.remove(key)).thenAnswer((_) => Future.value(false));
      dynamic result = await appStorage.remove(key);
      expect(result, equals(false));
      verify(() => persistence.remove(key)).called(1);

      when(() => persistence.getValue(key)).thenReturn(null);
      result = appStorage.getString(key);
      expect(result, isNull);
      verify(() => persistence.getValue(key)).called(1);

      when(() => persistence.setValue(key, 'value')).thenAnswer((_) => Future.value(false));
      result = await appStorage.setString(key, 'value');
      expect(result, false);
      verify(() => persistence.setValue(key, 'value')).called(1);

      when(() => persistence.getValue(key)).thenReturn(true);
      result = appStorage.getBool(key);
      expect(result, equals(true));
      verify(() => persistence.getValue(key)).called(1);

      when(() => persistence.setValue(key, true)).thenAnswer((_) => Future.value(true));
      result = await appStorage.setBool(key, true);
      expect(result, true);
      verify(() => persistence.setValue(key, true)).called(1);
    });
  });
}
