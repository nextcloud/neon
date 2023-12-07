import 'package:built_value/serializer.dart';
import 'package:dynamite_end_to_end_test/enum.openapi.dart';
import 'package:test/test.dart';

void main() {
  final serializers = (Serializers().toBuilder()..add(EnumString.serializer)).build();

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
}
