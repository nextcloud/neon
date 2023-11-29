import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/builder/header_serializer.dart';
import 'package:dynamite/src/builder/resolve_interface.dart';
import 'package:dynamite/src/builder/resolve_type.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/helpers/built_value.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/helpers/dynamite.dart';
import 'package:dynamite/src/helpers/pattern_check.dart';
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
    state.resolvedInterfaces.add(result);
    final properties = schema.properties?.entries;

    if (properties == null || properties.isEmpty) {
      throw StateError('The schema must have a non empty properties field.');
    }

    final defaults = ListBuilder<String>();
    final validators = ListBuilder<String>();
    final methods = ListBuilder<Method>();
    // resolveInterface is not suitable here as we need the resolved result.
    for (final property in properties) {
      final propertyName = property.key;
      final propertySchema = property.value;
      final dartName = toDartName(propertyName);

      final result = resolveType(
        spec,
        state,
        '${identifier}_${toDartName(propertyName, uppercaseFirstCharacter: true)}',
        propertySchema,
        nullable: isDartParameterNullable(
          schema.required.contains(propertyName),
          propertySchema,
        ),
      );

      final method = generateProperty(
        result,
        propertyName,
        propertySchema.formattedDescription,
      );
      methods.add(method);

      final $default = propertySchema.$default;
      if ($default != null) {
        final value = $default.toString();
        defaults.add('..$dartName = ${valueToEscapedValue(result, value)}');
      }

      validators.addAll(buildPatternCheck(propertySchema, 'b.$dartName'));
    }

    final $interface = buildInterface(
      identifier,
      methods: methods.build(),
    );
    final $class = buildBuiltClass(
      identifier,
      defaults: defaults.build(),
      validators: validators.build(),
      customSerializer: isHeader,
    );

    state.output.addAll([
      $interface,
      $class,
    ]);

    if (isHeader) {
      state.output.add(buildHeaderSerializer(state, identifier, spec, schema));
    }
  }
  return result;
}
