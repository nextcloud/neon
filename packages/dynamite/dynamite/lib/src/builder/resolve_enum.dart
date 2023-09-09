import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/builder/resolve_type.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/helpers/built_value.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/helpers/type_result.dart';
import 'package:dynamite/src/models/open_api.dart';
import 'package:dynamite/src/models/schema.dart';
import 'package:dynamite/src/type_result/type_result.dart';

TypeResult resolveEnum(
  final OpenAPI spec,
  final State state,
  final String identifier,
  final Schema schema,
  final TypeResult subResult, {
  final bool nullable = false,
}) {
  if (state.resolvedTypes.add(TypeResultEnum('${state.classPrefix}$identifier', subResult))) {
    state.output.add(
      Class(
        (final b) => b
          ..name = '${state.classPrefix}$identifier'
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
                    ..type = refer('${state.classPrefix}$identifier')
                    ..assignment = Code(
                      '_\$${toCamelCase('${state.classPrefix}$identifier')}${toDartName(value, uppercaseFirstCharacter: true)}',
                    );

                  if (toDartName(value) != value) {
                    if (result.name != 'String' && result.name != 'int') {
                      throw Exception(
                        'Sorry enum values are a bit broken. '
                        'See https://github.com/google/json_serializable.dart/issues/616. '
                        'Please remove the enum values on ${state.classPrefix}$identifier.',
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
                ..returns = refer('BuiltSet<${state.classPrefix}$identifier>')
                ..lambda = true
                ..static = true
                ..body = Code('_\$${toCamelCase('${state.classPrefix}$identifier')}Values')
                ..type = MethodType.getter,
            ),
            Method(
              (final b) => b
                ..name = 'valueOf'
                ..returns = refer('${state.classPrefix}$identifier')
                ..lambda = true
                ..static = true
                ..requiredParameters.add(
                  Parameter(
                    (final b) => b
                      ..name = 'name'
                      ..type = refer(subResult.name),
                  ),
                )
                ..body = Code('_\$valueOf${state.classPrefix}$identifier(name)'),
            ),
            buildSerializer('${state.classPrefix}$identifier'),
          ]),
      ),
    );
  }
  return TypeResultEnum(
    '${state.classPrefix}$identifier',
    subResult,
    nullable: nullable,
  );
}
