import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/type_result/type_result.dart';

const interfaceSuffix = 'Interface';

Spec buildBuiltClass(
  final String className, {
  final BuiltList<Method>? methods,
  final Iterable<String>? defaults,
  final Iterable<TypeResultObject>? interfaces,
  final bool customSerializer = false,
}) {
  assert((interfaces == null) != (methods == null), 'Either provide an interface or methods.');

  return Class(
    (final b) {
      b
        ..name = className
        ..abstract = true
        ..implements.addAll([
          ...?interfaces?.map((final i) => refer('${i.name}$interfaceSuffix')),
          refer(
            'Built<$className, ${className}Builder>',
          ),
        ])
        ..constructors.addAll([
          builtValueConstructor(className),
          hiddenConstructor,
          fromJsonConstructor,
        ])
        ..methods.addAll([
          toJsonMethod,
          ...?methods,
          buildSerializer(className, isCustom: customSerializer),
        ]);

      if (defaults != null && defaults.isNotEmpty) {
        b.methods.add(
          Method(
            (final b) => b
              ..name = '_defaults'
              ..returns = refer('void')
              ..static = true
              ..lambda = true
              ..annotations.add(
                refer('BuiltValueHook').call([], {
                  'initializeBuilder': literalTrue,
                }),
              )
              ..requiredParameters.add(
                Parameter(
                  (final b) => b
                    ..name = 'b'
                    ..type = refer('${className}Builder'),
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
  );
}

Method get toJsonMethod => Method(
      (final b) => b
        ..name = 'toJson'
        ..returns = refer('Map<String, dynamic>')
        ..lambda = true
        ..body = const Code('_jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>'),
    );

Method buildSerializer(final String className, {final bool isCustom = false}) => Method((final b) {
      b
        ..name = 'serializer'
        ..returns = refer('Serializer<$className>')
        ..lambda = true
        ..static = true
        ..body = Code(
          isCustom ? '_\$${className}Serializer()' : '_\$${toCamelCase(className)}Serializer',
        )
        ..type = MethodType.getter;
      if (isCustom) {
        b.annotations.add(refer('BuiltValueSerializer').call([], {'custom': literalTrue}));
      }
    });

Constructor builtValueConstructor(final String className) => Constructor(
      (final b) => b
        ..factory = true
        ..lambda = true
        ..optionalParameters.add(
          Parameter(
            (final b) => b
              ..name = 'b'
              ..type = refer('void Function(${className}Builder)?'),
          ),
        )
        ..redirect = refer('_\$$className'),
    );

Constructor get hiddenConstructor => Constructor(
      (final b) => b
        ..name = '_'
        ..constant = true,
    );

Constructor get fromJsonConstructor => Constructor(
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
    );
