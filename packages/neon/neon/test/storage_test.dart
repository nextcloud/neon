import 'package:mocktail/mocktail.dart';
import 'package:neon/src/settings/models/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';

class SharedPreferencesMock extends Mock implements SharedPreferences {}

void main() {
  test('NeonStorage', () async {
    expect(() => NeonStorage.database, throwsA(isA<StateError>()));

    SharedPreferences.setMockInitialValues({});
    await NeonStorage.init();

    expect(NeonStorage.database, isA<SharedPreferences>());
  });

  group('AppStorage', () {
    test('formatKey', () async {
      var appStorage = const AppStorage(StorageKeys.accounts);
      var key = appStorage.formatKey('test-key');
      expect(key, 'accounts-test-key');

      appStorage = const AppStorage(StorageKeys.accounts, 'test-suffix');
      key = appStorage.formatKey('test-key');
      expect(key, 'accounts-test-suffix-test-key');
    });

    test('interface', () async {
      final sharedPreferences = SharedPreferencesMock();
      NeonStorage.mock(sharedPreferences);
      const appStorage = AppStorage(StorageKeys.accounts);
      const key = 'key';
      final formatedKey = appStorage.formatKey(key);

      when(() => sharedPreferences.containsKey(formatedKey)).thenReturn(true);
      dynamic result = appStorage.containsKey(key);
      expect(result, equals(true));
      verify(() => sharedPreferences.containsKey(formatedKey)).called(1);

      when(() => sharedPreferences.remove(formatedKey)).thenAnswer((final _) => Future.value(false));
      result = await appStorage.remove(key);
      expect(result, equals(false));
      verify(() => sharedPreferences.remove(formatedKey)).called(1);

      when(() => sharedPreferences.getString(formatedKey)).thenReturn(null);
      result = appStorage.getString(key);
      expect(result, isNull);
      verify(() => sharedPreferences.getString(formatedKey)).called(1);

      when(() => sharedPreferences.setString(formatedKey, 'value')).thenAnswer((final _) => Future.value(false));
      result = await appStorage.setString(key, 'value');
      expect(result, false);
      verify(() => sharedPreferences.setString(formatedKey, 'value')).called(1);

      when(() => sharedPreferences.getBool(formatedKey)).thenReturn(true);
      result = appStorage.getBool(key);
      expect(result, equals(true));
      verify(() => sharedPreferences.getBool(formatedKey)).called(1);

      when(() => sharedPreferences.setBool(formatedKey, true)).thenAnswer((final _) => Future.value(true));
      result = await appStorage.setBool(key, true);
      expect(result, true);
      verify(() => sharedPreferences.setBool(formatedKey, true)).called(1);

      when(() => sharedPreferences.getStringList(formatedKey)).thenReturn(['hi there']);
      result = appStorage.getStringList(key);
      expect(result, equals(['hi there']));
      verify(() => sharedPreferences.getStringList(formatedKey)).called(1);

      when(() => sharedPreferences.setStringList(formatedKey, ['hi there']))
          .thenAnswer((final _) => Future.value(false));
      result = await appStorage.setStringList(key, ['hi there']);
      expect(result, false);
      verify(() => sharedPreferences.setStringList(formatedKey, ['hi there'])).called(1);
    });
  });

  test('SingleValueStorage', () async {
    final sharedPreferences = SharedPreferencesMock();
    NeonStorage.mock(sharedPreferences);
    const storage = SingleValueStorage(StorageKeys.global);
    final key = StorageKeys.global.value;

    when(() => sharedPreferences.containsKey(key)).thenReturn(true);
    dynamic result = storage.hasValue();
    expect(result, equals(true));
    verify(() => sharedPreferences.containsKey(key)).called(1);

    when(() => sharedPreferences.remove(key)).thenAnswer((final _) => Future.value(false));
    result = await storage.remove();
    expect(result, equals(false));
    verify(() => sharedPreferences.remove(key)).called(1);

    when(() => sharedPreferences.getString(key)).thenReturn(null);
    result = storage.getString();
    expect(result, isNull);
    verify(() => sharedPreferences.getString(key)).called(1);

    when(() => sharedPreferences.setString(key, 'value')).thenAnswer((final _) => Future.value(false));
    result = await storage.setString('value');
    expect(result, false);
    verify(() => sharedPreferences.setString(key, 'value')).called(1);

    when(() => sharedPreferences.getBool(key)).thenReturn(true);
    result = storage.getBool();
    expect(result, equals(true));
    verify(() => sharedPreferences.getBool(key)).called(1);

    when(() => sharedPreferences.setBool(key, true)).thenAnswer((final _) => Future.value(true));
    result = await storage.setBool(true);
    expect(result, true);
    verify(() => sharedPreferences.setBool(key, true)).called(1);

    when(() => sharedPreferences.getStringList(key)).thenReturn(['hi there']);
    result = storage.getStringList();
    expect(result, equals(['hi there']));
    verify(() => sharedPreferences.getStringList(key)).called(1);

    when(() => sharedPreferences.setStringList(key, ['hi there'])).thenAnswer((final _) => Future.value(false));
    result = await storage.setStringList(['hi there']);
    expect(result, false);
    verify(() => sharedPreferences.setStringList(key, ['hi there'])).called(1);
  });
}
