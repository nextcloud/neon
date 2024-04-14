// ignore_for_file: inference_failure_on_collection_literal

import 'package:built_value_test/matcher.dart';
import 'package:dynamite/src/models/json_schema.dart' hide serializers;
import 'package:dynamite/src/models/openapi.dart';
import 'package:test/test.dart';

void main() {
  group('OpenAPI spec deserialization', () {
    test('Schema reference resolving', () {
      const json = {
        'openapi': '3.1.0',
        'info': {
          'title': 'reference resolving test',
          'version': '0.0.1',
        },
        'components': {
          'schemas': {
            'SuperClass': {
              'type': 'object',
              'properties': {
                'bool': {'type': 'boolean'},
                'integer': {'type': 'integer'},
                'double': {'type': 'number', 'format': 'float'},
                'num': {'type': 'number'},
                'string': {'type': 'string'},
                'content-string': {
                  'type': 'string',
                  'nullable': true,
                  'contentMediaType': 'application/json',
                  'contentSchema': {'type': 'integer'},
                },
                'string-binary': {'type': 'string', 'format': 'binary'},
                'list': {'type': 'array'},
                'list-never': {'type': 'array', 'maxLength': 0},
                'list-string': {
                  'type': 'array',
                  'items': {'type': 'string'},
                },
              },
            },
            'SubClass': {
              r'$ref': '#/components/schemas/SuperClass',
            },
          },
        },
        'paths': {},
        'tags': [],
      };

      final spec = serializers.deserializeWith(OpenAPI.serializer, json);
      final superSchema = spec!.components!.schemas!['SuperClass']!;
      expect(superSchema.type, equals(SchemaType.object));

      final subSchema = spec.components!.schemas!['SubClass']!;
      expect(
        subSchema,
        equalsBuilt(
          Schema((b) {
            b.ref = Uri.parse('#/components/schemas/SuperClass');
          }),
        ),
      );

      expect(
        subSchema.resolveRef(json),
        equalsBuilt(
          superSchema.rebuild((b) {
            b.id = Uri.parse('#/components/schemas/SuperClass');
          }),
        ),
      );
    });
  });
}
