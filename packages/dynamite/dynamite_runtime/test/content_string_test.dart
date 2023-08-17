// ignore_for_file: avoid_redundant_argument_values

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/content_string.dart';
import 'package:test/test.dart';

part 'content_string_test.g.dart';

@SerializersFor([
  ContentString,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin())
      ..addBuilderFactory(const FullType(ContentString, [FullType(bool)]), ContentStringBuilder<bool>.new)
      ..addBuilderFactory(const FullType(ContentString, [FullType(double)]), ContentStringBuilder<double>.new)
      ..addBuilderFactory(
        const FullType(ContentString, [
          FullType(BuiltList, [FullType(int)]),
        ]),
        ContentStringBuilder<BuiltList<int>>.new,
      )
      ..addBuilderFactory(const FullType(BuiltList, [FullType(int)]), ListBuilder<int>.new)
      ..addBuilderFactory(
        const FullType(ContentString, [
          FullType(BuiltMap, [FullType(String), FullType(int)]),
        ]),
        ContentStringBuilder<BuiltMap<String, int>>.new,
      )
      ..addBuilderFactory(const FullType(BuiltMap, [FullType(String), FullType(int)]), MapBuilder<String, int>.new)
      ..addBuilderFactory(const FullType(ContentString, [FullType(int)]), ContentStringBuilder<int>.new)
      ..addBuilderFactory(const FullType(ContentString, [FullType(String)]), ContentStringBuilder<String>.new)
      ..addBuilderFactory(
        const FullType(ContentString, [
          FullType(ContentString, [FullType(String)]),
        ]),
        ContentStringBuilder<ContentString<String>>.new,
      ))
    .build();

void main() {
  group('ContentString with known specifiedType holding bool', () {
    final data = ContentString<bool>((final b) => b..content = true);
    final serialized = json.encode(true);
    const specifiedType = FullType(ContentString, [FullType(bool)]);

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType), data);
    });
  });

  group('ContentString with unknown specifiedType holding bool', () {
    final data = ContentString((final b) => b..content = true);
    final serialized = json.decode(
      json.encode({
        r'$': 'ContentString',
        'content': {r'$': 'bool', '': true},
      }),
    ) as Object;
    const specifiedType = FullType.unspecified;

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType), data);
    });
  });

  group('ContentString with known specifiedType holding double', () {
    final data = ContentString<double>((final b) => b..content = 42.5);
    final serialized = json.encode(42.5);
    const specifiedType = FullType(ContentString, [FullType(double)]);

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType), data);
    });
  });

  group('ContentString with unknown specifiedType holding double', () {
    final data = ContentString((final b) => b..content = 42.5);
    final serialized = json.decode(
      json.encode({
        r'$': 'ContentString',
        'content': {r'$': 'double', '': 42.5},
      }),
    ) as Object;
    const specifiedType = FullType.unspecified;

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType), data);
    });
  });

  group('ContentString with known specifiedType holding list', () {
    final data = ContentString<BuiltList<int>>((final b) => b..content = BuiltList([1, 2, 3]));
    final serialized = json.encode([1, 2, 3]);
    const specifiedType = FullType(ContentString, [
      FullType(BuiltList, [FullType(int)]),
    ]);

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType), equals(data));
    });
  });

  group('ContentString with unknown specifiedType holding list', () {
    final data = ContentString((final b) => b..content = BuiltList([1, 2, 3]));
    final serialized = json.decode(
      json.encode({
        r'$': 'ContentString',
        'content': {
          r'$': 'list',
          '': [
            {r'$': 'int', '': 1},
            {r'$': 'int', '': 2},
            {r'$': 'int', '': 3},
          ],
        },
      }),
    ) as Object;
    const specifiedType = FullType.unspecified;

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType), data);
    });
  });

  group('ContentString with known specifiedType holding map', () {
    final data =
        ContentString<BuiltMap<String, int>>((final b) => b..content = BuiltMap({'one': 1, 'two': 2, 'three': 3}));
    // while not being valid json it's what built_value expects.
    // using the StandardJsonPlugin will encode it to a valid Map<String, int>.
    final serialized = json.encode({'one': 1, 'two': 2, 'three': 3});
    const specifiedType = FullType(ContentString, [
      FullType(BuiltMap, [FullType(String), FullType(int)]),
    ]);

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType), data);
    });
  });

  group('ContentString with unknown specifiedType holding map', () {
    final data = ContentString((final b) => b..content = BuiltMap({'one': 1, 'two': 2, 'three': 3}));
    final serialized = json.decode(
      json.encode({
        r'$': 'ContentString',
        'content': {
          r'$': 'encoded_map',
          r'{"$":"String","":"one"}': {r'$': 'int', '': 1},
          r'{"$":"String","":"two"}': {r'$': 'int', '': 2},
          r'{"$":"String","":"three"}': {r'$': 'int', '': 3},
        },
      }),
    ) as Object;
    const specifiedType = FullType.unspecified;

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType), data);
    });
  });

  group(
    'ContentString with known specifiedType holding int',
    () {
      final data = ContentString<int>((final b) => b..content = 42);
      final serialized = json.encode(42);
      const specifiedType = FullType(ContentString, [FullType(int)]);

      test('can be serialized', () {
        expect(serializers.serialize(data, specifiedType: specifiedType), serialized);
      });

      test('can be deserialized', () {
        expect(serializers.deserialize(serialized, specifiedType: specifiedType), data);
      });
    },
  );

  group('ContentString with unknown specifiedType holding int', () {
    final data = ContentString((final b) => b..content = 42);
    final serialized = json.decode(
      json.encode({
        r'$': 'ContentString',
        'content': {r'$': 'int', '': 42},
      }),
    ) as Object;
    const specifiedType = FullType.unspecified;

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType), data);
    });
  });

  group('ContentString with known specifiedType holding String', () {
    final data = ContentString<String>((final b) => b..content = 'test');
    final serialized = json.encode('test');
    const specifiedType = FullType(ContentString, [FullType(String)]);

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType), data);
    });
  });

  group('ContentString with unknown specifiedType holding String', () {
    final data = ContentString((final b) => b..content = 'test');
    final serialized = json.decode(
      json.encode({
        r'$': 'ContentString',
        'content': {r'$': 'String', '': 'test'},
      }),
    ) as Object;
    const specifiedType = FullType.unspecified;

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType), data);
    });
  });

  group('ContentString with known specifiedType holding ContentString', () {
    final data = ContentString<ContentString<String>>(
      (final b) => b
        ..content = ContentString<String>(
          (final b) => b..content = 'test',
        ),
    );
    final serialized = json.encode(json.encode('test'));
    const specifiedType = FullType(ContentString, [
      FullType(ContentString, [FullType(String)]),
    ]);

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType), data);
    });
  });

  group('ContentString with unknown specifiedType holding ContentString', () {
    final data = ContentString<ContentString<String>>(
      (final b) => b
        ..content = ContentString<String>(
          (final b) => b..content = 'test',
        ),
    );
    final serialized = json.decode(
      json.encode({
        r'$': 'ContentString',
        'content': {
          r'$': 'ContentString',
          'content': {r'$': 'String', '': 'test'},
        },
      }),
    ) as Object;
    const specifiedType = FullType.unspecified;

    test('can be serialized', () {
      expect(serializers.serialize(data, specifiedType: specifiedType), serialized);
    });

    test('can be deserialized', () {
      expect(serializers.deserialize(serialized, specifiedType: specifiedType), data);
    });
  });
}
