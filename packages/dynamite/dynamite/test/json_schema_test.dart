import 'package:dynamite/src/models/json_schema.dart';
import 'package:test/test.dart';

void main() {
  group('JsonSchema deserialization', () {
    test(JsonSchema, () {
      Object? value = {};
      var schema = serializers.deserializeWith(JsonSchema.serializer, value);
      expect(schema, JsonSchema());

      value = true;
      schema = serializers.deserializeWith(JsonSchema.serializer, value);
      expect(schema, JsonSchema());
    });
  });
}
