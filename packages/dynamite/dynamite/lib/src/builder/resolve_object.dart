import 'package:dynamite/src/builder/header_serializer.dart';
import 'package:dynamite/src/builder/resolve_interface.dart';
import 'package:dynamite/src/builder/resolve_type.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/helpers/built_value.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/helpers/type_result.dart';
import 'package:dynamite/src/models/openapi.dart' as openapi;
import 'package:dynamite/src/models/type_result.dart';

TypeResultObject resolveObject(
  final openapi.OpenAPI spec,
  final State state,
  final String identifier,
  final openapi.Schema schema, {
  final bool nullable = false,
  final bool isHeader = false,
}) {
  final result = TypeResultObject(
    identifier,
    nullable: nullable,
  );
  if (state.resolvedTypes.add(result)) {
    final defaults = <String>[];
    for (final property in schema.properties!.entries) {
      final propertySchema = property.value;
      if (propertySchema.$default != null) {
        final value = propertySchema.$default!.toString();
        final result = resolveType(
          spec,
          state,
          propertySchema.type!,
          propertySchema,
        );
        defaults.add('..${toDartName(property.key)} = ${valueToEscapedValue(result, value)}');
      }
    }

    resolveInterface(
      spec,
      state,
      identifier,
      schema,
    );

    state.output.add(
      buildBuiltClass(
        identifier,
        defaults: defaults,
        customSerializer: isHeader,
      ),
    );

    if (isHeader) {
      state.output.add(buildHeaderSerializer(state, identifier, spec, schema));
    }
  }
  return result;
}
