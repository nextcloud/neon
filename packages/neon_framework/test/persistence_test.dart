// ignore_for_file: unnecessary_lambdas

import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neon_framework/src/storage/shared_preferences_persistence.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_platform_interface.dart';

void main() {
  group('Persistences', () {
    group('SharedPreferencesPersistence', () {
      late InMemorySharedPreferencesStore sharedPreferences;

      setUp(() async {
        sharedPreferences = InMemorySharedPreferencesStore.withData({
          'flutter.no_prefix': 56,
          'flutter.prefix-key': 0.8263038168331953,
          'flutter.another-prefix': true,
        });
        SharedPreferencesStorePlatform.instance = sharedPreferences;

        await SharedPreferencesPersistence.init();
      });

      tearDown(() {
        SharedPreferencesPersistence.resetStatic();
      });

      test('with prefix', () async {
        const persistence = SharedPreferencesPersistence(prefix: 'prefix');

        expect(persistence.containsKey('key'), isTrue);
        expect(persistence.containsKey('random-key'), isFalse);

        await persistence.remove('key');
        expect(persistence.containsKey('key'), isFalse);

        // String
        Object value = 'some new value';
        await persistence.setValue('key', value);
        expect(persistence.getValue('key'), equals(value));
        expect(await sharedPreferences.getAll(), equals(persistence.cache));

        // int
        value = 20;
        await persistence.setValue('key_bool', value);
        expect(persistence.getValue('key_bool'), equals(value));
        expect(await sharedPreferences.getAll(), equals(persistence.cache));

        // double
        value = 0.3196889951920666;
        await persistence.setValue('key-double', value);
        expect(persistence.getValue('key-double'), equals(value));
        expect(await sharedPreferences.getAll(), equals(persistence.cache));

        // bool
        value = false;
        await persistence.setValue('key/int', value);
        expect(persistence.getValue('key/int'), equals(value));
        expect(await sharedPreferences.getAll(), equals(persistence.cache));

        // BuiltList<String>
        value = BuiltList<String>(['76', 'true', '0.8633290067560915']);
        await persistence.setValue('key.StringList', value);
        expect(persistence.getValue('key.StringList'), equals(value));
        expect(await sharedPreferences.getAll(), equals(persistence.cache));

        // Invalid type
        expect(
          () => persistence.setValue('key.StringList', {}),
          throwsA(isA<ArgumentError>()),
        );

        persistence.setCache('key.StringListCache', value);
        expect(persistence.getValue('key.StringListCache'), equals(value));
        var stored = await sharedPreferences.getAll();
        expect(stored.containsKey('key.StringListCache'), isFalse);

        await persistence.clear();
        stored = await sharedPreferences.getAll();
        expect(
          stored,
          equals({
            'flutter.neon-version': kSharedPreferenceVersion,
            'flutter.no_prefix': 56,
            'flutter.another-prefix': true,
          }),
          reason: 'only clears withing the prefix',
        );

        await sharedPreferences.setValue(
          'valueType',
          'flutter.prefix-key',
          'value',
        );
        await persistence.reload();
        expect(persistence.containsKey('key'), isTrue);
      });

      test('no prefix', () async {
        const persistence = SharedPreferencesPersistence();

        expect(persistence.containsKey('no_prefix'), isTrue);
        expect(persistence.containsKey('random-key'), isFalse);

        await persistence.remove('no_prefix');
        expect(persistence.containsKey('no_prefix'), isFalse);

        // String
        Object value = 'some new value';
        await persistence.setValue('no_prefix', value);
        expect(persistence.getValue('no_prefix'), equals(value));
        expect(await sharedPreferences.getAll(), equals(persistence.cache));

        // int
        value = 20;
        await persistence.setValue('no_prefix_bool', value);
        expect(persistence.getValue('no_prefix_bool'), equals(value));
        expect(await sharedPreferences.getAll(), equals(persistence.cache));

        // double
        value = 0.3196889951920666;
        await persistence.setValue('no_prefix-double', value);
        expect(persistence.getValue('no_prefix-double'), equals(value));
        expect(await sharedPreferences.getAll(), equals(persistence.cache));

        // bool
        value = false;
        await persistence.setValue('no_prefix/int', value);
        expect(persistence.getValue('no_prefix/int'), equals(value));
        expect(await sharedPreferences.getAll(), equals(persistence.cache));

        // BuiltList<String>
        value = BuiltList<String>(['76', 'true', '0.8633290067560915']);
        await persistence.setValue('no_prefix.StringList', value);
        expect(persistence.getValue('no_prefix.StringList'), equals(value));
        expect(await sharedPreferences.getAll(), equals(persistence.cache));

        // Invalid type
        expect(
          () => persistence.setValue('no_prefix.StringList', {}),
          throwsA(isA<ArgumentError>()),
        );

        persistence.setCache('no_prefix.StringListCache', value);
        expect(
          persistence.getValue('no_prefix.StringListCache'),
          equals(value),
        );
        var stored = await sharedPreferences.getAll();
        expect(stored.containsKey('no_prefix.StringListCache'), isFalse);

        await persistence.clear();
        stored = await sharedPreferences.getAll();
        expect(
          stored,
          isEmpty,
          reason: 'An empty prefix matches every non empty one. '
              'Clearing everything.',
        );

        await sharedPreferences.setValue('valueType', 'flutter.key', 'value');
        await persistence.reload();
        expect(persistence.containsKey('key'), isTrue);
      });
    });
  });
}
