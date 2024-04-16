import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/models/json_schema.dart';

Iterable<Expression> buildPatternCheck(
  Validator schema,
  String value,
  String name,
) sync* {
  switch (schema) {
    case StringValidator():
      if (schema case StringValidator(:final pattern) when pattern != null) {
        yield refer('checkPattern', 'package:dynamite_runtime/utils.dart').call([
          refer(value).asA(refer('String?')),
          refer('RegExp').call([literalString(pattern.pattern, raw: true)]),
          literalString(name),
        ]);
      }
      if (schema case StringValidator(:final minLength) when minLength != null) {
        yield refer('checkMinLength', 'package:dynamite_runtime/utils.dart').call([
          refer(value).asA(refer('String?')),
          literalNum(minLength),
          literalString(name),
        ]);
      }
      if (schema case StringValidator(:final maxLength) when maxLength != null) {
        yield refer('checkMaxLength', 'package:dynamite_runtime/utils.dart').call([
          refer(value).asA(refer('String?')),
          literalNum(maxLength),
          literalString(name),
        ]);
      }

    case ArrayValidator():
      if (schema case ArrayValidator(:final minItems) when minItems != null) {
        yield refer('checkMinItems', 'package:dynamite_runtime/utils.dart').call([
          refer(value).nullSafeProperty('length'),
          literalNum(minItems),
          literalString(name),
        ]);
      }
      if (schema case ArrayValidator(:final maxItems) when maxItems != null) {
        yield refer('checkMaxItems', 'package:dynamite_runtime/utils.dart').call([
          refer(value).nullSafeProperty('length'),
          literalNum(maxItems),
          literalString(name),
        ]);
      }

    default:
      break;
  }
}
