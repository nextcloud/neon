// ignore_for_file: avoid_positional_boolean_parameters

import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/models/json_schema.dart' as json_schema;
import 'package:dynamite/src/models/openapi.dart' as openapi;

String clientName(String tag) => '\$${toDartName(tag, className: true)}Client';

bool isDartParameterNullable(
  bool required,
  json_schema.JsonSchema? schema,
) =>
    (!required && schema?.$default == null) || (schema?.nullable ?? false);

bool isRequired(
  bool required,
  json_schema.JsonSchema? schema,
) =>
    required && schema?.$default == null;

int sortRequiredParameters(openapi.Parameter a, openapi.Parameter b) {
  final aRequired = isRequired(a.required, a.schema);
  final bRequired = isRequired(b.required, b.schema);

  if (aRequired != bRequired) {
    if (aRequired && !bRequired) {
      return -1;
    } else {
      return 1;
    }
  }

  return 0;
}
