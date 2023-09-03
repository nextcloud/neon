import 'package:dynamite/src/builder/header_serializer.dart';
import 'package:dynamite/src/builder/resolve_interface.dart';
import 'package:dynamite/src/builder/resolve_type.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/helpers/built_value.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/helpers/type_result.dart';
import 'package:dynamite/src/models/open_api.dart';
import 'package:dynamite/src/models/schema.dart';
import 'package:dynamite/src/type_result/type_result.dart';

TypeResultObject resolveObject(
  final OpenAPI spec,
  final State state,
  final String identifier,
  final Schema schema, {
  final bool nullable = false,
  final bool isHeader = false,
}) {
  final result = TypeResultObject(
    '${state.classPrefix}$identifier',
    nullable: nullable,
  );
  if (state.resolvedTypes.add(result)) {
    final defaults = <String>[];
    for (final property in schema.properties!.entries) {
      final propertySchema = property.value;
      if (propertySchema.default_ != null) {
        final value = propertySchema.default_!.toString();
        final result = resolveType(
          spec,
          state,
          propertySchema.type!,
          propertySchema,
        );
        defaults.add('..${toDartName(property.key)} = ${valueToEscapedValue(result, value)}');
      }
    }

    final interfaceClass = resolveInterface(
      spec,
      state,
      identifier,
      schema,
    );

    state.output.addAll([
      buildBuiltClass(
        '${state.classPrefix}$identifier',
        defaults: defaults,
        customSerializer: isHeader,
        interfaces: [
          interfaceClass,
        ],
      ),
    ]);
    if (isHeader) {
      state.output.add(buildHeaderSerializer(state, identifier, spec, schema));
    }
  }
  return result;
}
