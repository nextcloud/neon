import 'package:dynamite/src/models/json_schema.dart';
import 'package:test/test.dart';

void main() {
  group('JsonSchema deserialization', () {
    test(JsonSchema, () {
      Object? value = {
        'type': 'integer',
      };
      var schema = serializers.deserializeWith(JsonSchema.serializer, value);
      expect(schema, IntegerSchema());

      value = {
        'type': 'number',
      };
      schema = serializers.deserializeWith(JsonSchema.serializer, value);
      expect(schema, NumberSchema());

      value = {
        'type': 'string',
      };
      schema = serializers.deserializeWith(JsonSchema.serializer, value);
      expect(schema, StringSchema());

      value = {
        'type': 'array',
      };
      schema = serializers.deserializeWith(JsonSchema.serializer, value);
      expect(schema, ArraySchema());

      value = {
        'type': 'object',
      };
      schema = serializers.deserializeWith(JsonSchema.serializer, value);
      expect(schema, ObjectSchema());

      value = {
        'type': 'null',
      };
      schema = serializers.deserializeWith(JsonSchema.serializer, value);
      expect(schema, NullSchema());

      value = {
        'type': null,
      };
      schema = serializers.deserializeWith(JsonSchema.serializer, value);
      expect(schema, GenericSchema());

      value = {
        r'$ref': '#/Object',
      };
      schema = serializers.deserializeWith(JsonSchema.serializer, value);
      expect(
        schema,
        GenericSchema((b) {
          b.ref = Uri.parse('#/Object');
        }),
      );

      value = {};
      schema = serializers.deserializeWith(JsonSchema.serializer, value);
      expect(schema, GenericSchema());

      value = true;
      schema = serializers.deserializeWith(JsonSchema.serializer, value);
      expect(schema, GenericSchema());
    });
  });
}
