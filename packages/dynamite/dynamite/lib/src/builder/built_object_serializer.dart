import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/builder/resolve_type.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/helpers/dynamite.dart';
import 'package:dynamite/src/models/openapi.dart' as openapi;
import 'package:dynamite/src/models/type_result.dart';

Spec buildBuiltClassSerializer(
  final State state,
  final String identifier,
  final openapi.OpenAPI spec,
  final openapi.Schema schema,
) =>
    Class(
      (final b) => b
        ..name = '_\$${identifier}Serializer'
        ..implements.add(refer('StructuredSerializer<$identifier>'))
        ..constructors.add(
          Constructor(
            (final b) => b..constant = true,
          ),
        )
        ..methods.addAll([
          Method(
            (final b) => b
              ..name = 'types'
              ..type = MethodType.getter
              ..lambda = true
              ..returns = refer('Iterable<Type>')
              ..annotations.add(refer('override'))
              ..body = Code('const [$identifier, _\$$identifier]'),
          ),
          Method(
            (final b) => b
              ..name = 'wireName'
              ..type = MethodType.getter
              ..lambda = true
              ..returns = refer('String')
              ..annotations.add(refer('override'))
              ..body = Code("r'$identifier'"),
          ),
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
              );

            final properties = serializeProperty(state, identifier, spec, schema);
            final nullableProperties = serializePropertyNullable(state, identifier, spec, schema);
            final buffer = StringBuffer()
              ..write('final result = <Object?>[')
              ..writeAll(properties, '\n')
              ..write('];')
              ..writeln();

            if (nullableProperties.isNotEmpty) {
              buffer
                ..write('Object? value;')
                ..writeAll(nullableProperties, '\n')
                ..writeln();
            }

            buffer.write('return result;');

            b.body = Code(buffer.toString());
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
  final value = iterator.current;
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
    final dartName = toDartName(propertyName);
    final result = resolveType(
      spec,
      state,
      '${identifier}_${toDartName(propertyName, uppercaseFirstCharacter: true)}',
      propertySchema,
      nullable: isDartParameterNullable(schema.required.contains(propertyName), propertySchema),
    );

    yield "case '$propertyName':";
    final deserialize = result.deserialize('value', 'serializers');

    if (result is TypeResultBase || result is TypeResultEnum) {
      yield 'result.$dartName = $deserialize;';
    } else {
      yield 'result.$dartName.replace($deserialize,);';
    }
  }
}

Iterable<String> serializePropertyNullable(
  final State state,
  final String identifier,
  final openapi.OpenAPI spec,
  final openapi.Schema schema,
) sync* {
  for (final property in schema.properties!.entries) {
    final propertyName = property.key;
    final propertySchema = property.value;
    final dartName = toDartName(propertyName);
    final result = resolveType(
      spec,
      state,
      '${identifier}_${toDartName(propertyName, uppercaseFirstCharacter: true)}',
      propertySchema,
      nullable: isDartParameterNullable(schema.required.contains(propertyName), propertySchema),
    );
    if (!result.nullable) {
      continue;
    }

    yield '''
value = object.$dartName;
if (value != null) {
  result
    ..add('$propertyName')
    ..add(${result.serialize('value', 'serializers')},);
}
''';
  }
}

Iterable<String> serializeProperty(
  final State state,
  final String identifier,
  final openapi.OpenAPI spec,
  final openapi.Schema schema,
) sync* {
  for (final property in schema.properties!.entries) {
    final propertyName = property.key;
    final propertySchema = property.value;
    final dartName = toDartName(propertyName);
    final result = resolveType(
      spec,
      state,
      '${identifier}_${toDartName(propertyName, uppercaseFirstCharacter: true)}',
      propertySchema,
      nullable: isDartParameterNullable(schema.required.contains(propertyName), propertySchema),
    );
    if (result.nullable) {
      continue;
    }

    yield '''
'$propertyName',
${result.serialize('object.$dartName', 'serializers')},
''';
  }
}
