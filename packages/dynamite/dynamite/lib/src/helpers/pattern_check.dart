import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/models/json_schema.dart' as json_schema;

Iterable<Expression> buildPatternCheck(
  json_schema.Schema schema,
  String value,
  String name,
) sync* {
  switch (schema.type) {
    case json_schema.SchemaType.string:
      if (schema.pattern != null) {
        yield refer('checkPattern', 'package:dynamite_runtime/utils.dart').call([
          refer(value).asA(refer('String?')),
          refer('RegExp').call([literalString(schema.pattern!, raw: true)]),
          literalString(name),
        ]);
      }
      if (schema.minLength != null) {
        yield refer('checkMinLength', 'package:dynamite_runtime/utils.dart').call([
          refer(value).asA(refer('String?')),
          literalNum(schema.minLength!),
          literalString(name),
        ]);
      }
      if (schema.maxLength != null) {
        yield refer('checkMaxLength', 'package:dynamite_runtime/utils.dart').call([
          refer(value).asA(refer('String?')),
          literalNum(schema.maxLength!),
          literalString(name),
        ]);
      }
    case json_schema.SchemaType.array:
      if (schema.minItems != null) {
        yield refer('checkMinItems', 'package:dynamite_runtime/utils.dart').call([
          refer(value).nullSafeProperty('length'),
          literalNum(schema.minItems!),
          literalString(name),
        ]);
      }
      if (schema.maxItems != null) {
        yield refer('checkMaxItems', 'package:dynamite_runtime/utils.dart').call([
          refer(value).nullSafeProperty('length'),
          literalNum(schema.maxItems!),
          literalString(name),
        ]);
      }
    default:
      break;
  }
}
