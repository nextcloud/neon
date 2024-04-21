import 'package:dynamite/src/models/openapi.dart';
import 'package:test/test.dart';

void main() {
  group('OpenAPI spec deserialization', () {
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
