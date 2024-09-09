import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_framework/settings.dart';
import 'package:neon_framework/src/storage/keys.dart';
import 'package:neon_framework/testing.dart';

class Collection extends AppImplementationOptions {
  Collection(List<Option<Object>> options, MockSettingsStore storage) : super(storage) {
    when(() => storage.id).thenReturn('app');

    super.options = options;
  }
}

enum Keys implements Storable {
  key1._('key1'),
  key2._('key2');

  const Keys._(this.value);

  @override
  final String value;
}

void main() {
  group('OptionsCollection', () {
    final option1 = MockOption();
    final option2 = MockOption();
    final collection = Collection(
      [
        option1,
        option2,
      ],
      MockSettingsStore(),
    );

    test('reset', () {
      collection.reset();

      verify(option1.reset).called(1);
      verify(option2.reset).called(1);
    });

    test('dispose', () {
      collection.dispose();

      verify(option1.dispose).called(1);
      verify(option2.dispose).called(1);
    });

    test('export', () {
      when(() => option1.key).thenReturn(Keys.key1);
      when(option1.serialize).thenReturn(true);
      when(() => option1.enabled).thenReturn(true);

      when(() => option2.key).thenReturn(Keys.key2);
      when(option2.serialize).thenReturn(true);
      when(() => option2.enabled).thenReturn(false);

      const json = {
        'app': {'key1': true},
      };

      final export = collection.export();

      expect(Map.fromEntries([export]), equals(json));
    });

    test('import', () {
      when(() => option1.key).thenReturn(Keys.key1);
      when(() => option2.key).thenReturn(Keys.key2);

      const json = {
        'app': {
          'key1': false,
          'key2': null,
        },
      };

      collection.import(json);

      verify(() => option1.deserialize({'key1': false, 'key2': null})).called(1);
      verify(option2.reset).called(1);
    });
  });
}
