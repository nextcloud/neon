import 'package:built_value/serializer.dart';
import 'package:dynamite_end_to_end_test/enum.openapi.dart';
import 'package:test/test.dart';

void main() {
  group('String', () {
    test('serialize', () {
      final serialized = serializers.serialize(
        EnumString.$default,
        specifiedType: const FullType(EnumString),
      );
      expect(serialized, 'default');
    });

    test('deserialize', () {
      final deserialized = serializers.deserialize(
        'default',
        specifiedType: const FullType(EnumString),
      );
      expect(deserialized, EnumString.$default);
    });
  });

  group('int', () {
    test('serialize', () {
      final serialized = serializers.serialize(
        EnumInt.$2,
        specifiedType: const FullType(EnumInt),
      );
      expect(serialized, '2');
    });

    test('deserialize', () {
      final deserialized = serializers.deserialize(
        '2',
        specifiedType: const FullType(EnumInt),
      );
      expect(deserialized, EnumInt.$2);
    });
  });

  group('wrapped', () {
    test('serialize', () {
      final wrap = WrappedEnum(
        (final b) => b
          ..string = WrappedEnum_String.$default
          ..integer = WrappedEnum_Integer.$2,
      );
      final serialized = jsonSerializers.serialize(
        wrap,
        specifiedType: const FullType(WrappedEnum),
      );
      expect(serialized, {
        'string': 'default',
        'integer': 2,
      });
    });
  });
}
