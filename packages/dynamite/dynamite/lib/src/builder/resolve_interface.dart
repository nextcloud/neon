import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/builder/resolve_type.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/helpers/built_value.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/helpers/docs.dart';
import 'package:dynamite/src/helpers/dynamite.dart';
import 'package:dynamite/src/helpers/pattern_check.dart';
import 'package:dynamite/src/helpers/type_result.dart';
import 'package:dynamite/src/models/openapi.dart' as openapi;
import 'package:dynamite/src/models/type_result.dart';

Method generateProperty(
  TypeResult type,
  String propertyName,
  String? description,
) =>
    Method(
      (b) {
        final name = toFieldName(toDartName(propertyName), type.name);
        b
          ..name = name
          ..type = MethodType.getter
          ..docs.addAll(escapeDescription(description));

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
  openapi.OpenAPI spec,
  State state,
  String identifier,
  openapi.Schema schema, {
  bool isHeader = false,
  bool nullable = false,
}) {
  return Class((b) {
    final className = '\$$identifier$interfaceSuffix';

    b
      ..docs.addAll(escapeDescription(schema.formattedDescription))
      ..abstract = true
      ..modifier = ClassModifier.interface
      ..name = className
      ..annotations.add(refer('BuiltValue').call([], {'instantiable': literalFalse}));

    final defaults = <String>[];
    final validators = <Expression>[];

    if (schema case openapi.Schema(:final allOf) when allOf != null) {
      for (final s in schema.allOf!) {
        if (s.properties != null) {
          final properties = s.properties!.entries;

          b.methods.addAll(
            properties.map((property) {
              final propertyName = property.key;
              final propertySchema = property.value;

              final result = resolveType(
                spec,
                state,
                toDartName(
                  propertyName,
                  identifier: identifier,
                ),
                propertySchema,
                nullable: isDartParameterNullable(
                  s.required.contains(propertyName),
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
        } else {
          final object = resolveType(
            spec,
            state,
            identifier,
            s,
            nullable: nullable,
          );

          if (object is TypeResultObject) {
            b.implements.add(
              refer('\$${object.name}$interfaceSuffix'),
            );
          } else {
            final property = generateProperty(
              object,
              object.className,
              s.formattedDescription,
            );

            b.methods.add(property);
          }
        }
      }
    } else {
      final properties = schema.properties?.entries;

      if (properties == null || properties.isEmpty) {
        throw StateError('The schema must have a non empty properties field.');
      }

      // resolveInterface is not suitable here as we need the resolved result.
      for (final property in properties) {
        final propertyName = property.key;
        final propertySchema = property.value;
        final dartName = toDartName(propertyName);

        var result = resolveType(
          spec,
          state,
          toDartName(
            propertyName,
            identifier: identifier,
          ),
          propertySchema,
          nullable: isDartParameterNullable(
            schema.required.contains(propertyName),
            propertySchema,
          ),
        );

        if (isHeader && result.className != 'String') {
          result = TypeResultObject(
            'Header',
            generics: BuiltList([result]),
            nullable: result.nullable,
          );
          state.resolvedTypes.add(result);
        }

        final method = generateProperty(
          result,
          propertyName,
          propertySchema.formattedDescription,
        );
        b.methods.add(method);

        final $default = propertySchema.$default;
        if ($default != null) {
          final value = $default.toString();
          defaults.add('..$dartName = ${valueToEscapedValue(result, value)}');
        }

        if (result is TypeResultOneOf && !result.isSingleValue) {
          validators.add(
            refer('b').property(dartName).nullSafeProperty('validateOneOf').call([]),
          );
        } else if (result is TypeResultAnyOf && !result.isSingleValue) {
          validators.add(
            refer('b').property(dartName).nullSafeProperty('validateAnyOf').call([]),
          );
        }

        validators.addAll(buildPatternCheck(propertySchema, 'b.$dartName', dartName));
      }
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
          );
        if (defaults.isNotEmpty) {
          b.body = Code(
            <String?>[
              'b',
              ...defaults,
            ].join(),
          );
        } else {
          b.body = const Code('');
        }
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
          );
        if (validators.isNotEmpty) {
          b.body = Block.of(
            validators.map((v) => v.statement),
          );
        } else {
          b.body = const Code('');
        }
      }),
    );
  });
}
