import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/builder/header_serializer.dart';
import 'package:dynamite/src/builder/resolve_type.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/helpers/built_value.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/helpers/dynamite.dart';
import 'package:dynamite/src/helpers/type_result.dart';
import 'package:dynamite/src/models/open_api.dart';
import 'package:dynamite/src/models/schema.dart';
import 'package:dynamite/src/type_result/type_result.dart';

TypeResult resolveObject(
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

    state.output.add(
      buildBuiltClass(
        '${state.classPrefix}$identifier',
        BuiltList.build((final b) {
          for (final property in schema.properties!.entries) {
            b.add(
              Method(
                (final b) {
                  final propertyName = property.key;
                  final propertySchema = property.value;
                  final result = resolveType(
                    spec,
                    state,
                    '${identifier}_${toDartName(propertyName, uppercaseFirstCharacter: true)}',
                    propertySchema,
                    nullable: isDartParameterNullable(
                      schema.required?.contains(propertyName),
                      propertySchema,
                    ),
                  );

                  b
                    ..name = toDartName(propertyName)
                    ..returns = refer(result.nullableName)
                    ..type = MethodType.getter
                    ..docs.addAll(propertySchema.formattedDescription);

                  if (toDartName(propertyName) != propertyName) {
                    b.annotations.add(
                      refer('BuiltValueField').call([], {
                        'wireName': literalString(propertyName),
                      }),
                    );
                  }
                },
              ),
            );
          }
        }),
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
