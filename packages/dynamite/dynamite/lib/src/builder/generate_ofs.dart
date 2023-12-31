import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/helpers/built_value.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/models/openapi.dart' as openapi;
import 'package:dynamite/src/models/type_result.dart';
import 'package:source_helper/source_helper.dart';

Iterable<Spec> buildOfsExtensions(
  final openapi.OpenAPI spec,
  final State state,
) sync* {
  final typeResults = state.resolvedTypes.whereType<TypeResultSomeOf>().toSet();

  for (final result in typeResults) {
    if (result.isSingleValue) {
      continue;
    }

    final serializerMethod = buildSerializer(result.className, '${result.typeName}Extension._serializer');

    final toJson = Method(
      (final b) => b
        ..docs.addAll([
          '/// Creates a new object from the given [json] data.',
          '///',
          '/// Use `toJson` to serialize it back into json.',
        ])
        ..static = true
        ..returns = refer(result.className)
        ..name = 'fromJson'
        ..requiredParameters.add(
          Parameter(
            (final b) => b
              ..name = 'json'
              ..type = refer('Object?'),
          ),
        )
        ..lambda = true
        ..body = Code('${result.typeName}Extension._fromJson(json)'),
    );

    yield Extension(
      (final b) => b
        ..docs.add('/// Serialization extension for `${result.className}`.')
        ..name = '\$${result.className}Extension'
        ..on = refer(result.className)
        ..methods.addAll([
          serializerMethod,
          toJson,
        ]),
    );
  }

  for (final result in state.uniqueSomeOfTypes) {
    if (result.isSingleValue) {
      continue;
    }

    yield TypeDef((final b) {
      b
        ..name = '_${result.typeName}'
        ..definition = refer(result.dartType.name);
    });

    yield* generateSomeOf(result);
  }
}

Iterable<Spec> generateSomeOf(
  final TypeResultSomeOf result,
) sync* {
  final identifier = '_${result.typeName}';
  final results = result.optimizedSubTypes;
  final serializerName = '${identifier}Serializer';

  final fields = <TypeResult, String>{};
  for (final result in results) {
    final dartType = result.nullableName;
    final dartName = toDartName(dartType);
    fields[result] = toFieldName(dartName, result.className);
  }

  final values = Method((final b) {
    b
      ..returns = refer('List<dynamic>')
      ..type = MethodType.getter
      ..name = '_values'
      ..lambda = true
      ..body = Code('[${fields.values.join(',')}]');
  });

  final oneOfValidator = Method((final b) {
    b
      ..docs.add('/// {@macro Dynamite.validateOneOf}')
      ..name = 'validateOneOf'
      ..returns = refer('void')
      ..lambda = true
      ..body = const Code('dynamite_utils.validateOneOf(_values)');
  });

  final anyOfValidator = Method((final b) {
    b
      ..docs.add('/// {@macro Dynamite.validateAnyOf}')
      ..name = 'validateAnyOf'
      ..returns = refer('void')
      ..lambda = true
      ..body = const Code('dynamite_utils.validateAnyOf(_values)');
  });

  final serializerMethod = Method(
    (final b) => b
      ..static = true
      ..returns = refer('Serializer<$identifier>')
      ..type = MethodType.getter
      ..name = '_serializer'
      ..lambda = true
      ..body = Code('const $serializerName()'),
  );

  final fromJson = Method(
    (final b) => b
      ..static = true
      ..returns = refer(identifier)
      ..name = '_fromJson'
      ..requiredParameters.add(
        Parameter(
          (final b) => b
            ..name = 'json'
            ..type = refer('Object?'),
        ),
      )
      ..lambda = true
      ..body = const Code(r'_$jsonSerializers.deserializeWith(_serializer, json)!'),
  );

  final toJson = Method(
    (final b) => b
      ..docs.addAll([
        '/// Parses this object into a json like map.',
        '///',
        '/// Use the fromJson factory to revive it again.',
      ])
      ..name = 'toJson'
      ..returns = refer('Object?')
      ..lambda = true
      ..body = const Code(r'_$jsonSerializers.serializeWith(_serializer, this)'),
  );

  yield Extension(
    (final b) => b
      ..name = '${identifier}Extension'.nonPrivate
      ..on = refer(identifier)
      ..docs.addAll([
        '/// @nodoc',
        '// ignore: library_private_types_in_public_api',
      ])
      ..methods.addAll([
        values,
        oneOfValidator,
        anyOfValidator,
        serializerMethod,
        fromJson,
        toJson,
      ]),
  );

  yield Class(
    (final b) => b
      ..name = serializerName
      ..implements.add(refer('PrimitiveSerializer<$identifier>'))
      ..constructors.add(Constructor((final b) => b.constant = true))
      ..methods.addAll([
        Method(
          (final b) => b
            ..annotations.add(refer('override'))
            ..returns = refer('Iterable<Type>')
            ..type = MethodType.getter
            ..name = 'types'
            ..lambda = true
            ..body = Code('const [$identifier]'),
        ),
        Method(
          (final b) => b
            ..annotations.add(refer('override'))
            ..returns = refer('String')
            ..type = MethodType.getter
            ..name = 'wireName'
            ..lambda = true
            ..body = Code(escapeDartString(identifier)),
        ),
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

          final bodyBuilder = StringBuffer()..write('dynamic value;');
          for (final field in fields.entries) {
            final result = field.key;
            final fieldName = field.value;

            bodyBuilder.writeAll(
              [
                'value = object.$fieldName;',
                'if (value != null) {',
                '  return ${result.serialize('value', 'serializers')}!;',
                '}',
              ],
              '\n',
            );
          }
          bodyBuilder
            ..writeln()
            ..writeln('// Should not be possible after validation.')
            ..writeln("throw StateError('Tried to serialize without any value.');");

          b.body = Code(bodyBuilder.toString());
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
            );

          final buffer = StringBuffer();
          for (final field in fields.entries) {
            final result = field.key;
            final dartName = result.nullableName;
            final fieldName = field.value;

            buffer.write('''
$dartName $fieldName;
try {
  $fieldName = ${result.deserialize('data', 'serializers')};
} catch (_) {}
''');
          }

          buffer
            ..write('return (')
            ..writeAll(
              fields.values.map((final fieldName) => '$fieldName: $fieldName'),
              ',',
            )
            ..write(');');

          b.body = Code(buffer.toString());
        }),
      ]),
  );
}
