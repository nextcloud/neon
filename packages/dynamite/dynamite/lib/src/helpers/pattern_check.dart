import 'package:dynamite/src/models/openapi.dart' as openapi;
import 'package:dynamite/src/models/openapi/schema.dart';

Iterable<String> buildPatternCheck(
  final openapi.Schema schema,
  final String value,
) sync* {
  final name = "'$value'";

  if (schema.type == SchemaType.string) {
    if (schema.pattern != null) {
      yield "dynamite_utils.checkPattern($value, RegExp(r'${schema.pattern!}'), $name);";
    }
    if (schema.minLength != null) {
      yield 'dynamite_utils.checkMinLength($value, ${schema.minLength}, $name);';
    }
    if (schema.maxLength != null) {
      yield 'dynamite_utils.checkMaxLength($value, ${schema.maxLength}, $name);';
    }
  }
}
