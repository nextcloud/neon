import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/helpers/docs.dart';

const interfaceSuffix = 'Interface';

/// Builds a [Class] representing a built_value object.
///
/// Attributes must be defined in a separate interface called `\$$className$interfaceSuffix`.
Spec buildBuiltClass(
  String className, {
  required bool deprecated,
  String? documentation,
}) {
  return Class(
    (b) {
      final interfaceClass = '\$$className$interfaceSuffix';

      b
        ..name = className
        ..abstract = true
        ..implements.addAll([
          refer(interfaceClass),
          refer(
            'Built<$className, ${className}Builder>',
          ),
        ])
        ..constructors.addAll([
          builtValueConstructor(className, deprecated: deprecated),
          hiddenConstructor(deprecated: deprecated),
          fromJsonConstructor(deprecated: deprecated),
        ])
        ..methods.addAll([
          toJsonMethod,
          buildSerializer(className),
        ]);

      if (documentation != null) {
        b.docs.addAll(escapeDescription(documentation));
      }

      if (deprecated) {
        b.annotations.add(refer('Deprecated').call([refer("''")]));
      }

      b.methods.add(
        Method((b) {
          b
            ..name = '_defaults'
            ..returns = refer('void')
            ..static = true
            ..annotations.add(
              refer('BuiltValueHook').call([], {
                'initializeBuilder': literalTrue,
              }),
            )
            ..requiredParameters.add(
              Parameter(
                (b) => b
                  ..name = 'b'
                  ..type = refer('${className}Builder'),
              ),
            )
            ..body = Code('$interfaceClass._defaults(b);');
        }),
      );

      b.methods.add(
        Method((b) {
          b
            ..name = '_validate'
            ..returns = refer('void')
            ..annotations.add(
              refer('BuiltValueHook').call([], {
                'finalizeBuilder': literalTrue,
              }),
            )
            ..static = true
            ..requiredParameters.add(
              Parameter(
                (b) => b
                  ..name = 'b'
                  ..type = refer('${className}Builder'),
              ),
            )
            ..body = Code('$interfaceClass._validate(b);');
        }),
      );
    },
  );
}

Method get toJsonMethod => Method(
      (b) => b
        ..docs.addAll([
          '/// Parses this object into a json like map.',
          '///',
          '/// Use the fromJson factory to revive it again.',
        ])
        ..name = 'toJson'
        ..returns = refer('Map<String, dynamic>')
        ..lambda = true
        ..body = const Code(r'_$jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>'),
    );

/// Builds the serializer getter for a built class.
Method buildSerializer(String className, [String? serializerName]) => Method((b) {
      b
        ..docs.add('/// Serializer for $className.')
        ..name = 'serializer'
        ..returns = refer('Serializer<$className>')
        ..lambda = true
        ..static = true
        ..body = Code(
          serializerName ?? '_\$${toCamelCase(className)}Serializer',
        )
        ..type = MethodType.getter;
      if (serializerName != null) {
        b.annotations.add(refer('BuiltValueSerializer').call([], {'custom': literalTrue}));
      }
    });

Constructor builtValueConstructor(
  String className, {
  required bool deprecated,
}) {
  return Constructor((b) {
    b
      ..docs.add('/// Creates a new $className object using the builder pattern.')
      ..factory = true
      ..lambda = true
      ..optionalParameters.add(
        Parameter(
          (b) => b
            ..name = 'b'
            ..type = refer('void Function(${className}Builder)?'),
        ),
      )
      ..redirect = refer('_\$$className');

    if (deprecated) {
      b.annotations.add(refer('Deprecated').call([refer("''")]));
    }
  });
}

Constructor hiddenConstructor({
  required bool deprecated,
}) {
  return Constructor((b) {
    b
      ..name = '_'
      ..constant = true;

    if (deprecated) {
      b.annotations.add(refer('Deprecated').call([refer("''")]));
    }
  });
}

Constructor fromJsonConstructor({
  required bool deprecated,
}) {
  return Constructor((b) {
    b
      ..docs.addAll([
        '/// Creates a new object from the given [json] data.',
        '///',
        '/// Use [toJson] to serialize it back into json.',
      ])
      ..factory = true
      ..name = 'fromJson'
      ..lambda = true
      ..requiredParameters.add(
        Parameter(
          (b) => b
            ..name = 'json'
            ..type = refer('Map<String, dynamic>'),
        ),
      )
      ..body = const Code(r'_$jsonSerializers.deserializeWith(serializer, json)!');

    if (deprecated) {
      b.annotations.add(refer('Deprecated').call([refer("''")]));
    }
  });
}
