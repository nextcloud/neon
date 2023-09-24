import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/builder/resolve_type.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/helpers/built_value.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/helpers/dynamite.dart';
import 'package:dynamite/src/models/openapi.dart' as openapi;
import 'package:dynamite/src/models/type_result.dart';

TypeResultObject resolveInterface(
  final openapi.OpenAPI spec,
  final State state,
  final String identifier,
  final openapi.Schema schema,
) {
  final result = TypeResultObject(
    '${state.classPrefix}$identifier',
  );

  if (state.resolvedInterfaces.add(result)) {
    final className = '${state.classPrefix}$identifier$interfaceSuffix';

    state.output.add(
      Class((final b) {
        b
          ..abstract = true
          ..modifier = ClassModifier.interface
          ..name = className
          ..annotations.add(refer('BuiltValue').call([], {'instantiable': literalFalse}));

        for (final property in schema.properties!.entries) {
          b.methods.add(
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

        b.methods.addAll([
          Method(
            (final b) => b
              ..returns = refer(className)
              ..name = 'rebuild'
              ..requiredParameters.add(
                Parameter(
                  (final b) => b
                    ..name = 'updates'
                    ..type = refer('void Function(${className}Builder)'),
                ),
              ),
          ),
          Method(
            (final b) => b
              ..returns = refer('${className}Builder')
              ..name = 'toBuilder',
          ),
        ]);
      }),
    );
  }

  return result;
}
