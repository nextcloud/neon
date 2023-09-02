import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/builder/resolve_type.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/helpers/built_value.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/models/open_api.dart';
import 'package:dynamite/src/models/schema.dart';
import 'package:dynamite/src/type_result/type_result.dart';

TypeResult resolveOfs(
  final OpenAPI spec,
  final State state,
  final String identifier,
  final Schema schema, {
  final bool nullable = false,
}) {
  final result = TypeResultObject(
    '${state.classPrefix}$identifier',
    nullable: nullable,
  );

  if (state.resolvedTypes.add(result)) {
    final results = schema.ofs!
        .map(
          (final s) => resolveType(
            spec,
            state,
            '$identifier${schema.ofs!.indexOf(s)}',
            s,
            nullable: !(schema.allOf?.contains(s) ?? false),
          ),
        )
        .toList();

    final fields = <String, String>{};
    for (final result in results) {
      final dartName = toDartName(result.name.replaceFirst(state.classPrefix, ''));
      fields[result.name] = toFieldName(dartName, result.name.replaceFirst(state.classPrefix, ''));
    }

    state.output.addAll([
      buildBuiltClass(
        '${state.classPrefix}$identifier',
        BuiltList.build((final b) {
          b.add(
            Method(
              (final b) {
                b
                  ..name = 'data'
                  ..returns = refer('JsonObject')
                  ..type = MethodType.getter;
              },
            ),
          );

          for (final result in results) {
            b.add(
              Method(
                (final b) {
                  final s = schema.ofs![results.indexOf(result)];
                  b
                    ..name = fields[result.name]
                    ..returns = refer(result.nullableName)
                    ..type = MethodType.getter
                    ..docs.addAll(s.formattedDescription);
                },
              ),
            );
          }
        }),
        customSerializer: true,
      ),
      Class(
        (final b) => b
          ..name = '_\$${state.classPrefix}${identifier}Serializer'
          ..implements.add(refer('PrimitiveSerializer<${state.classPrefix}$identifier>'))
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
                ..returns = refer('Object')
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
                ..body = const Code('return object.data.value;');
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
                      ..name = 'data'
                      ..type = refer('Object'),
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
                ..body = Code(
                  <String>[
                    'final result = new ${state.classPrefix}${identifier}Builder()',
                    '..data = JsonObject(data);',
                    if (schema.allOf != null) ...[
                      for (final result in results) ...[
                        if (result is TypeResultBase || result is TypeResultEnum) ...[
                          'result.${fields[result.name]!} = ${result.deserialize('data')};',
                        ] else ...[
                          'result.${fields[result.name]!}.replace(${result.deserialize('data')});',
                        ],
                      ],
                    ] else ...[
                      if (schema.discriminator != null) ...[
                        'if (data is! Iterable) {',
                        r"throw StateError('Expected an Iterable but got ${data.runtimeType}');",
                        '}',
                        '',
                        'String? discriminator;',
                        '',
                        'final iterator = data.iterator;',
                        'while (iterator.moveNext()) {',
                        'final key = iterator.current! as String;',
                        'iterator.moveNext();',
                        'final Object? value = iterator.current;',
                        "if (key == '${schema.discriminator!.propertyName}') {",
                        'discriminator = value! as String;',
                        'break;',
                        '}',
                        '}',
                      ],
                      for (final result in results) ...[
                        if (schema.discriminator != null) ...[
                          "if (discriminator == '${result.name.replaceFirst(state.classPrefix, '')}'",
                          if (schema.discriminator!.mapping != null && schema.discriminator!.mapping!.isNotEmpty) ...[
                            for (final key in schema.discriminator!.mapping!.entries
                                .where(
                                  (final entry) =>
                                      entry.value.endsWith('/${result.name.replaceFirst(state.classPrefix, '')}'),
                                )
                                .map((final entry) => entry.key)) ...[
                              " ||  discriminator == '$key'",
                            ],
                            ') {',
                          ],
                        ],
                        'try {',
                        if (result is TypeResultBase || result is TypeResultEnum) ...[
                          'result._${fields[result.name]!} = ${result.deserialize('data')};',
                        ] else ...[
                          'result._${fields[result.name]!} = ${result.deserialize('data')}.toBuilder();',
                        ],
                        '} catch (_) {',
                        if (schema.discriminator != null) ...[
                          'rethrow;',
                        ],
                        '}',
                        if (schema.discriminator != null) ...[
                          '}',
                        ],
                      ],
                      if (schema.oneOf != null) ...[
                        "assert([${fields.values.map((final e) => 'result._$e').join(',')}].where((final x) => x != null).length >= 1, 'Need oneOf for \${result._data}');",
                      ],
                      if (schema.anyOf != null) ...[
                        "assert([${fields.values.map((final e) => 'result._$e').join(',')}].where((final x) => x != null).length >= 1, 'Need anyOf for \${result._data}');",
                      ],
                    ],
                    'return result.build();',
                  ].join(),
                );
            }),
          ]),
      ),
    ]);
  }

  return result;
}
