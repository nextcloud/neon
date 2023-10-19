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
  final result = TypeResultObject(
    identifier,
  );

  if (state.resolvedInterfaces.add(result)) {
    final $interface = buildInterface(
      identifier,
      methods: BuiltList.build((final b) {
        for (final property in schema.properties!.entries) {
          b.add(
            Method(
              (final b) {
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
          );
        }
      }),
    );

    state.output.add($interface);
  }

  return result;
}

Spec buildInterface(
  final String identifier, {
  final BuiltList<Method>? methods,
  final Iterable<TypeResultObject>? interfaces,
}) {
  assert((interfaces == null) != (methods == null), 'Either provide an interface or methods.');
  final className = '$identifier$interfaceSuffix';

  return Class((final b) {
    b
      ..abstract = true
      ..modifier = ClassModifier.interface
      ..name = className
      ..annotations.add(refer('BuiltValue').call([], {'instantiable': literalFalse}));

    if (interfaces != null) {
      b.implements.addAll(
        interfaces.map((final i) => refer('${i.name}$interfaceSuffix')),
      );
    }

    if (methods != null) {
      b.methods.addAll(methods);
    }
  });
}
