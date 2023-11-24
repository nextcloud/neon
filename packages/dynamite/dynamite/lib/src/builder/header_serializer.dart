import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/builder/resolve_type.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/helpers/dynamite.dart';
import 'package:dynamite/src/models/openapi.dart' as openapi;
import 'package:dynamite/src/models/type_result.dart';

Spec buildHeaderSerializer(
  final State state,
  final String identifier,
  final openapi.OpenAPI spec,
  final openapi.Schema schema,
) =>
    Class(
      (final b) => b
        ..name = '_\$${identifier}Serializer'
        ..implements.add(refer('StructuredSerializer<$identifier>'))
        ..fields.addAll([
          Field(
            (final b) => b
              ..name = 'types'
              ..modifier = FieldModifier.final$
              ..type = refer('Iterable<Type>')
              ..annotations.add(refer('override'))
              ..assignment = Code('const [$identifier, _\$$identifier]'),
          ),
          Field(
            (final b) => b
              ..name = 'wireName'
              ..modifier = FieldModifier.final$
              ..type = refer('String')
              ..annotations.add(refer('override'))
              ..assignment = Code("r'$identifier'"),
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
                    ..type = refer(identifier),
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
              ..returns = refer(identifier)
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
              )
              ..body = Code('''
final result = new ${identifier}Builder();

final iterator = serialized.iterator;
while (iterator.moveNext()) {
  final key = iterator.current! as String;
  iterator.moveNext();
  final value = iterator.current! as String;
  switch (key) {
    ${deserializeProperty(state, identifier, spec, schema).join('\n')}
  }
}

return result.build();
''');
          }),
        ]),
    );

Iterable<String> deserializeProperty(
  final State state,
  final String identifier,
  final openapi.OpenAPI spec,
  final openapi.Schema schema,
) sync* {
  for (final property in schema.properties!.entries) {
    final propertyName = property.key;
    final propertySchema = property.value;
    final result = resolveType(
      spec,
      state,
      '${identifier}_${toDartName(propertyName, uppercaseFirstCharacter: true)}',
      propertySchema,
      nullable: isDartParameterNullable(schema.required.contains(propertyName), propertySchema),
    );

    yield "case '$propertyName':";
    if (result.className != 'String') {
      if (result is TypeResultBase || result is TypeResultEnum || result is TypeResultSomeOf) {
        yield 'result.${toDartName(propertyName)} = ${result.deserialize(result.decode('value!'))};';
      } else {
        yield 'result.${toDartName(propertyName)}.replace(${result.deserialize(result.decode('value!'))});';
      }
    } else {
      yield 'result.${toDartName(propertyName)} = value!;';
    }
  }
}
