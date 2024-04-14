import 'package:dynamite/src/models/json_schema.dart';
import 'package:test/test.dart';

void main() {
  group('JsonSchema deserialization', () {
    test(Schema, () {
      Object? value = {};
      var schema = serializers.deserializeWith(Schema.serializer, value);
      expect(schema, Schema());

      value = true;
      schema = serializers.deserializeWith(Schema.serializer, value);
      expect(schema, Schema());
    });
  });
}
