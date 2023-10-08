import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/builder/resolve_type.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/helpers/built_value.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/helpers/type_result.dart';
import 'package:dynamite/src/models/openapi.dart' as openapi;
import 'package:dynamite/src/models/type_result.dart';

TypeResult resolveEnum(
  final openapi.OpenAPI spec,
  final State state,
  final String identifier,
  final openapi.Schema schema,
  final TypeResult subResult, {
  final bool nullable = false,
}) {
  if (state.resolvedTypes.add(TypeResultEnum(identifier, subResult))) {
    state.output.add(
      Class(
        (final b) => b
          ..name = identifier
          ..extend = refer('EnumClass')
          ..constructors.add(
            Constructor(
              (final b) => b
                ..name = '_'
                ..constant = true
                ..requiredParameters.add(
                  Parameter(
                    (final b) => b
                      ..name = 'name'
                      ..toSuper = true,
                  ),
                ),
            ),
          )
          ..fields.addAll(
            schema.$enum!.map(
              (final value) => Field(
                (final b) {
                  final result = resolveType(
                    spec,
                    state,
                    '$identifier${toDartName(value, uppercaseFirstCharacter: true)}',
                    schema,
                    ignoreEnum: true,
                  );
                  b
                    ..name = toDartName(value)
                    ..static = true
                    ..modifier = FieldModifier.constant
                    ..type = refer(identifier)
                    ..assignment = Code(
                      '_\$${toCamelCase(identifier)}${toDartName(value, uppercaseFirstCharacter: true)}',
                    );

                  if (toDartName(value) != value) {
                    if (result.name != 'String' && result.name != 'int') {
                      throw Exception(
                        'Sorry enum values are a bit broken. '
                        'See https://github.com/google/json_serializable.dart/issues/616. '
                        'Please remove the enum values on $identifier.',
                      );
                    }
                    b.annotations.add(
                      refer('BuiltValueEnumConst').call([], {
                        'wireName': refer(valueToEscapedValue(result, value)),
                      }),
                    );
                  }
                },
              ),
            ),
          )
          ..methods.addAll([
            Method(
              (final b) => b
                ..name = 'values'
                ..returns = refer('BuiltSet<$identifier>')
                ..lambda = true
                ..static = true
                ..body = Code('_\$${toCamelCase(identifier)}Values')
                ..type = MethodType.getter,
            ),
            Method(
              (final b) => b
                ..name = 'valueOf'
                ..returns = refer(identifier)
                ..lambda = true
                ..static = true
                ..requiredParameters.add(
                  Parameter(
                    (final b) => b
                      ..name = 'name'
                      ..type = refer(subResult.name),
                  ),
                )
                ..body = Code('_\$valueOf$identifier(name)'),
            ),
            buildSerializer(identifier),
          ]),
      ),
    );
  }
  return TypeResultEnum(
    identifier,
    subResult,
    nullable: nullable,
  );
}
