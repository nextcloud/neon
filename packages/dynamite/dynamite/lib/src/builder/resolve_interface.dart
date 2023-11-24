import 'package:built_collection/built_collection.dart';
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
  final properties = schema.properties?.entries;

  if (properties == null || properties.isEmpty) {
    throw StateError('The schema must have a non empty properties field.');
  }

  final result = TypeResultObject(
    identifier,
  );

  if (state.resolvedInterfaces.add(result)) {
    final $interface = buildInterface(
      identifier,
      methods: BuiltList.build((final b) {
        b.addAll(
          properties.map((final property) {
            final propertyName = property.key;
            final propertySchema = property.value;

            final result = resolveType(
              spec,
              state,
              '${identifier}_${toDartName(propertyName, uppercaseFirstCharacter: true)}',
              propertySchema,
              nullable: isDartParameterNullable(
                schema.required.contains(propertyName),
                propertySchema,
              ),
            );

            return generateProperty(
              result,
              propertyName,
              propertySchema.formattedDescription,
            );
          }),
        );
      }),
    );

    state.output.add($interface);
  }

  return result;
}

Method generateProperty(
  final TypeResult type,
  final String propertyName,
  final Iterable<String> description,
) =>
    Method(
      (final b) {
        final name = toFieldName(toDartName(propertyName), type.name);
        b
          ..name = name
          ..type = MethodType.getter
          ..docs.addAll(description);

        if (type is TypeResultSomeOf && type.isSingleValue) {
          b.returns = refer(type.dartType.name);
        } else {
          b.returns = refer(type.nullableName);
        }

        final builtValueFieldAnnotations = <String, Expression>{};
        if (name != propertyName) {
          builtValueFieldAnnotations['wireName'] = literalString(propertyName);
        }

        if (builtValueFieldAnnotations.isNotEmpty) {
          b.annotations.add(
            refer('BuiltValueField').call([], builtValueFieldAnnotations),
          );
        }
      },
    );

Spec buildInterface(
  final String identifier, {
  final BuiltList<Method>? methods,
  final Iterable<TypeResultObject>? interfaces,
}) {
  assert((interfaces == null) != (methods == null), 'Either provide an interface or methods.');
  final className = '\$$identifier$interfaceSuffix';

  return Class((final b) {
    b
      ..abstract = true
      ..modifier = ClassModifier.interface
      ..name = className
      ..annotations.add(refer('BuiltValue').call([], {'instantiable': literalFalse}));

    if (interfaces != null) {
      b.implements.addAll(
        interfaces.map((final i) => refer('\$${i.name}$interfaceSuffix')),
      );
    }

    if (methods != null) {
      b.methods.addAll(methods);
    }
  });
}
