import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/builder/resolve_type.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/helpers/dynamite.dart';
import 'package:dynamite/src/helpers/typeresult.dart';
import 'package:dynamite/src/models/open_api.dart';
import 'package:dynamite/src/models/schema.dart';
import 'package:dynamite/src/type_result/type_result.dart';

TypeResult resolveObject(
  final OpenAPI spec,
  final String variablePrefix,
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
    state.output.add(
      Class(
        (final b) {
          b
            ..name = '${state.classPrefix}$identifier'
            ..docs.addAll(schema.formattedDescription)
            ..abstract = true
            ..implements.add(
              refer(
                'Built<${state.classPrefix}$identifier, ${state.classPrefix}${identifier}Builder>',
              ),
            )
            ..constructors.addAll([
              Constructor(
                (final b) => b
                  ..factory = true
                  ..lambda = true
                  ..optionalParameters.add(
                    Parameter(
                      (final b) => b
                        ..name = 'b'
                        ..type = refer('void Function(${state.classPrefix}${identifier}Builder)?'),
                    ),
                  )
                  ..redirect = refer('_\$${state.classPrefix}$identifier'),
              ),
              Constructor(
                (final b) => b
                  ..name = '_'
                  ..constant = true,
              ),
              Constructor(
                (final b) => b
                  ..factory = true
                  ..name = 'fromJson'
                  ..lambda = true
                  ..requiredParameters.add(
                    Parameter(
                      (final b) => b
                        ..name = 'json'
                        ..type = refer('Map<String, dynamic>'),
                    ),
                  )
                  ..body = const Code('_jsonSerializers.deserializeWith(serializer, json)!'),
              ),
            ])
            ..methods.addAll([
              Method(
                (final b) => b
                  ..name = 'toJson'
                  ..returns = refer('Map<String, dynamic>')
                  ..lambda = true
                  ..body = const Code('_jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>'),
              ),
              for (final property in schema.properties!.entries) ...[
                Method(
                  (final b) {
                    final propertyName = property.key;
                    final propertySchema = property.value;
                    final result = resolveType(
                      spec,
                      variablePrefix,
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
              ],
              Method((final b) {
                b
                  ..name = 'serializer'
                  ..returns = refer('Serializer<${state.classPrefix}$identifier>')
                  ..lambda = true
                  ..static = true
                  ..body = Code(
                    isHeader
                        ? '_\$${state.classPrefix}${identifier}Serializer()'
                        : "_\$${toCamelCase('${state.classPrefix}$identifier')}Serializer",
                  )
                  ..type = MethodType.getter;
                if (isHeader) {
                  b.annotations.add(refer('BuiltValueSerializer').call([], {'custom': refer('true')}));
                }
              }),
            ]);

          final defaults = <String>[];
          for (final property in schema.properties!.entries) {
            final propertySchema = property.value;
            if (propertySchema.default_ != null) {
              final value = propertySchema.default_!.toString();
              final result = resolveType(
                spec,
                variablePrefix,
                state,
                propertySchema.type!,
                propertySchema,
              );
              defaults.add('..${toDartName(property.key)} = ${valueToEscapedValue(result, value)}');
            }
          }
          if (defaults.isNotEmpty) {
            b.methods.add(
              Method(
                (final b) => b
                  ..name = '_defaults'
                  ..returns = refer('void')
                  ..static = true
                  ..lambda = true
                  ..annotations.add(
                    refer('BuiltValueHook').call(
                      [],
                      {
                        'initializeBuilder': refer('true'),
                      },
                    ),
                  )
                  ..requiredParameters.add(
                    Parameter(
                      (final b) => b
                        ..name = 'b'
                        ..type = refer('${state.classPrefix}${identifier}Builder'),
                    ),
                  )
                  ..body = Code(
                    <String?>[
                      'b',
                      ...defaults,
                    ].join(),
                  ),
              ),
            );
          }
        },
      ),
    );
    if (isHeader) {
      state.output.add(
        Class(
          (final b) => b
            ..name = '_\$${state.classPrefix}${identifier}Serializer'
            ..implements.add(refer('StructuredSerializer<${state.classPrefix}$identifier>'))
            ..fields.addAll([
              Field(
                (final b) => b
                  ..name = 'types'
                  ..modifier = FieldModifier.final$
                  ..type = refer('Iterable<Type>')
                  ..annotations.add(refer('override'))
                  ..assignment = Code('const [${state.classPrefix}$identifier, _\$${state.classPrefix}$identifier]'),
              ),
              Field(
                (final b) => b
                  ..name = 'wireName'
                  ..modifier = FieldModifier.final$
                  ..type = refer('String')
                  ..annotations.add(refer('override'))
                  ..assignment = Code("r'${state.classPrefix}$identifier'"),
              ),
            ])
            ..methods.addAll([
              Method((final b) {
                b
                  ..name = 'serialize'
                  ..returns = refer('Iterable<Object?>')
                  ..annotations.add(refer('override'))
                  ..requiredParameters.addAll([
                    Parameter(
                      (final b) => b
                        ..name = 'serializers'
                        ..type = refer('Serializers'),
                    ),
                    Parameter(
                      (final b) => b
                        ..name = 'object'
                        ..type = refer('${state.classPrefix}$identifier'),
                    ),
                  ])
                  ..optionalParameters.add(
                    Parameter(
                      (final b) => b
                        ..name = 'specifiedType'
                        ..type = refer('FullType')
                        ..named = true
                        ..defaultTo = const Code('FullType.unspecified'),
                    ),
                  )
                  ..body = const Code('throw UnimplementedError();');
              }),
              Method((final b) {
                b
                  ..name = 'deserialize'
                  ..returns = refer('${state.classPrefix}$identifier')
                  ..annotations.add(refer('override'))
                  ..requiredParameters.addAll([
                    Parameter(
                      (final b) => b
                        ..name = 'serializers'
                        ..type = refer('Serializers'),
                    ),
                    Parameter(
                      (final b) => b
                        ..name = 'serialized'
                        ..type = refer('Iterable<Object?>'),
                    ),
                  ])
                  ..optionalParameters.add(
                    Parameter(
                      (final b) => b
                        ..name = 'specifiedType'
                        ..type = refer('FullType')
                        ..named = true
                        ..defaultTo = const Code('FullType.unspecified'),
                    ),
                  );
                List<Code> deserializeProperty(final MapEntry<String, Schema> property) {
                  final propertyName = property.key;
                  final propertySchema = property.value;
                  final result = resolveType(
                    spec,
                    variablePrefix,
                    state,
                    '${identifier}_${toDartName(propertyName, uppercaseFirstCharacter: true)}',
                    propertySchema,
                    nullable: isDartParameterNullable(schema.required?.contains(propertyName), propertySchema),
                  );

                  return [
                    Code("case '$propertyName':"),
                    if (result.className != 'String') ...[
                      if (result is TypeResultBase || result is TypeResultEnum) ...[
                        Code(
                          'result.${toDartName(propertyName)} = ${result.deserialize(result.decode('value!'))};',
                        ),
                      ] else ...[
                        Code(
                          'result.${toDartName(propertyName)}.replace(${result.deserialize(result.decode('value!'))});',
                        ),
                      ],
                    ] else ...[
                      Code(
                        'result.${toDartName(propertyName)} = value!;',
                      ),
                    ],
                  ];
                }

                b.body = Block.of([
                  Code('final result = new ${state.classPrefix}${identifier}Builder();'),
                  const Code(''),
                  const Code('final iterator = serialized.iterator;'),
                  const Code('while (iterator.moveNext()) {'),
                  const Code('final key = iterator.current! as String;'),
                  const Code('iterator.moveNext();'),
                  const Code('final value = iterator.current! as String;'),
                  const Code('switch (key) {'),
                  for (final property in schema.properties!.entries) ...deserializeProperty(property),
                  const Code('}'),
                  const Code('}'),
                  const Code(''),
                  const Code('return result.build();'),
                ]);
              }),
            ]),
        ),
      );
    }
  }
  return result;
}
