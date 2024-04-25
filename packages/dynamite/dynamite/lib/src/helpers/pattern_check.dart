import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/models/json_schema.dart';

Iterable<Expression> buildPatternCheck(
  Validator schema,
  String value,
  String name,
) sync* {
  late final valueReference = refer(value);
  late final valueName = literalString(name);

  if (schema is StringValidator) {
    final pattern = schema.pattern?.pattern;
    final minLength = schema.minLength;
    final maxLength = schema.maxLength;

    if (pattern != null || minLength != null || maxLength != null) {
      yield refer('checkString', 'package:dynamite_runtime/utils.dart').call([
        valueReference,
        valueName,
      ], {
        if (pattern != null) 'pattern': refer('RegExp').newInstance([literalString(pattern, raw: true)]),
        if (minLength != null) 'minLength': literalNum(minLength),
        if (maxLength != null) 'maxLength': literalNum(maxLength),
      });
    }
  }

  if (schema is ArrayValidator) {
    final uniqueItems = schema.uniqueItems;
    final minItems = schema.minItems;
    final maxItems = schema.maxItems;
    // TODO: handle minContains and maxContains

    if (uniqueItems || minItems != null || maxItems != null) {
      yield refer('checkIterable', 'package:dynamite_runtime/utils.dart').call([
        valueReference,
        valueName,
      ], {
        if (uniqueItems) 'uniqueItems': literalBool(uniqueItems),
        if (minItems != null) 'minItems': literalNum(minItems),
        if (maxItems != null) 'maxItems': literalNum(maxItems),
      });
    }
  }
}
