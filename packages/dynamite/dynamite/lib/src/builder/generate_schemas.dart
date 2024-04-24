import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/builder/resolve_type.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/helpers/docs.dart';
import 'package:dynamite/src/models/openapi.dart' as openapi;
import 'package:dynamite/src/models/type_result.dart';

Iterable<Spec> generateSchemas(
  openapi.OpenAPI spec,
  State state,
) sync* {
  if (spec.components?.schemas != null) {
    for (final schema in spec.components!.schemas!.entries) {
      final identifier = toDartName(schema.key, className: true);
      final result = resolveType(
        spec,
        state,
        identifier,
        schema.value,
      );

      // TypeDefs should only be generated for top level schemas.
      if (result is TypeResultBase || result.isTypeDef) {
        yield TypeDef((b) {
          if (schema.value.deprecated) {
            b.annotations.add(refer('Deprecated').call([refer("''")]));
          }

          b
            ..docs.addAll(escapeDescription(schema.value.formattedDescription()))
            ..name = identifier
            ..definition = refer(result.dartType.name);
        });
      }
    }
  }

  yield* state.output;
}
