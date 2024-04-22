import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/builder/resolve_type.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/helpers/docs.dart';
import 'package:dynamite/src/models/json_schema.dart' as json_schema;
import 'package:dynamite/src/models/openapi.dart' as openapi;
import 'package:dynamite/src/models/type_result.dart';

Iterable<Spec> generateSchemas(
  openapi.OpenAPI spec,
  State state,
) sync* {
  if (spec.components?.schemas != null) {
    for (final schema in spec.components!.schemas!.entries) {
      final identifier = toDartName(schema.key, className: true);

      final result = generateSchema(
        schema.value,
        identifier,
        state,
      );

      if (result != null) {
        yield result;
      }
    }
  }

  yield* state.output;
}

Spec? generateSchema(
  json_schema.JsonSchema schema,
  String identifier,
  State state,
) {
  final result = resolveType(
    state,
    identifier,
    schema,
  );

  // TypeDefs should only be generated for top level schemas.
  if (result is TypeResultBase || result.isTypeDef) {
    return TypeDef((b) {
      if (schema.deprecated) {
        b.annotations.add(refer('Deprecated').call([refer("''")]));
      }

      b
        ..docs.addAll(escapeDescription(schema.formattedDescription()))
        ..name = identifier
        ..definition = refer(result.dartType.name);
    });
  }

  return null;
}
