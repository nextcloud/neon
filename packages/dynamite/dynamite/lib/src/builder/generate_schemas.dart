import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/builder/resolve_type.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/models/openapi.dart' as openapi;

Iterable<Spec> generateSchemas(
  final openapi.OpenAPI spec,
  final State state,
) sync* {
  if (spec.components?.schemas != null) {
    for (final schema in spec.components!.schemas!.entries) {
      final identifier = toDartName(schema.key, uppercaseFirstCharacter: true);

      resolveType(
        spec,
        state,
        identifier,
        schema.value,
      );
    }
  }

  yield* state.output;
}
