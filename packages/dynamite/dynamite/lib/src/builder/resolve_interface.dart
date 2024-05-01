import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/builder/resolve_type.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/helpers/built_value.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/helpers/docs.dart';
import 'package:dynamite/src/helpers/dynamite.dart';
import 'package:dynamite/src/helpers/pattern_check.dart';
import 'package:dynamite/src/models/json_schema.dart' as json_schema;
import 'package:dynamite/src/models/type_result.dart';

Spec buildInterface(
  State state,
  json_schema.JsonSchema schema, {
  bool isHeader = false,
}) {
  final identifier = schema.identifier!;

  return Class((b) {
    final className = '\$$identifier$interfaceSuffix';

    b
      ..docs.addAll(escapeDescription(schema.formattedDescription()))
      ..sealed = true
      ..name = className
      ..annotations.add(refer('BuiltValue').call([], {'instantiable': literalFalse}));

    final defaults = StringBuffer();
    final validators = BlockBuilder();

    if (schema case json_schema.JsonSchema(:final allOf) when allOf != null) {
      for (final schema in allOf) {
        if (schema case json_schema.ObjectSchema(properties: != null)) {
          _generateProperties(
            schema,
            state,
            identifier,
            b,
            defaults,
            validators,
            isHeader: isHeader,
          );
        } else {
          final object = resolveType(
            state,
            schema,
          );

          if (object is TypeResultObject) {
            final interfaceName = '\$${object.name}$interfaceSuffix';
            defaults.writeln('$interfaceName._defaults(b);');
            validators.addExpression(refer('$interfaceName._validate').call([refer('b')]));

            b.implements.add(refer(interfaceName));
          } else {
            _generateProperty(
              b,
              object.className,
              object,
              schema,
              defaults,
              validators,
            );
          }
        }
      }
    } else {
      _generateProperties(
        schema as json_schema.ObjectSchema,
        state,
        identifier,
        b,
        defaults,
        validators,
        isHeader: isHeader,
      );
    }

    final builderName = '${className}Builder';

    b.methods.add(
      Method((b) {
        b
          ..docs.add('''
/// Rebuilds the instance.
///
/// The result is the same as this instance but with [updates] applied.
/// [updates] is a function that takes a builder [$builderName].''')
          ..returns = refer(className)
          ..name = 'rebuild'
          ..requiredParameters.add(
            Parameter((b) {
              b
                ..name = 'updates'
                ..type = refer('void Function($builderName)');
            }),
          );
      }),
    );

    b.methods.add(
      Method((b) {
        b
          ..docs.add('/// Converts the instance to a builder [$builderName].')
          ..returns = refer(builderName)
          ..name = 'toBuilder';
      }),
    );

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
                ..type = refer(builderName),
            ),
          );
        if (defaults.isNotEmpty) {
          b.body = Code(defaults.toString());
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
                ..type = refer(builderName),
            ),
          )
          ..body = validators.build();
      }),
    );
  });
}

void _generateProperties(
  json_schema.ObjectSchema schema,
  State state,
  String identifier,
  ClassBuilder b,
  StringSink defaults,
  BlockBuilder validators, {
  required bool isHeader,
}) {
  final properties = schema.properties?.entries;

  if (properties == null || properties.isEmpty) {
    throw StateError('The schema must have a non empty properties field.');
  }

  for (final property in properties) {
    final propertyName = property.key;
    final propertySchema = property.value;

    var result = resolveType(
      state,
      propertySchema.rebuild((b) {
        b
          ..identifier = toDartName(
            propertyName,
            identifier: identifier,
          )
          ..nullable = isDartParameterNullable(
            schema.required.contains(propertyName),
            propertySchema,
          );
      }),
    );

    if (isHeader && result.className != 'String') {
      result = TypeResultObject(
        'Header',
        generics: BuiltList([result]),
        nullable: result.nullable,
      );
      state.resolvedSerializers.addAll(result.serializers);
      state.resolvedTypes.add(result);
    }

    _generateProperty(
      b,
      propertyName,
      result,
      propertySchema,
      defaults,
      validators,
    );
  }
}

void _generateProperty(
  ClassBuilder b,
  String propertyName,
  TypeResult result,
  json_schema.JsonSchema schema,
  StringSink defaults,
  BlockBuilder validators,
) {
  final dartName = toDartName(propertyName);

  b.methods.add(
    Method(
      (b) {
        b
          ..name = dartName
          ..type = MethodType.getter
          ..docs.addAll(
            escapeDescription(schema.formattedDescription()),
          );

        if (schema.deprecated) {
          b.annotations.add(refer('Deprecated').call([refer("''")]));
        }

        if (result is TypeResultSomeOf && result.isSingleValue) {
          b.returns = refer(result.dartType.name);
        } else {
          b.returns = refer(result.nullableName);
        }

        final builtValueFieldAnnotations = <String, Expression>{};
        if (dartName != propertyName) {
          builtValueFieldAnnotations['wireName'] = literalString(propertyName);
        }

        if (builtValueFieldAnnotations.isNotEmpty) {
          b.annotations.add(
            refer('BuiltValueField').call([], builtValueFieldAnnotations),
          );
        }
      },
    ),
  );

  final $default = schema.$default;
  if ($default != null) {
    b.fields.add(
      Field((b) {
        b
          ..name = '_\$$dartName'
          ..modifier = FieldModifier.final$
          ..static = true
          ..assignment = Code(
            result.deserialize($default),
          );
      }),
    );

    if (result is TypeResultBase || result is TypeResultEnum || result is TypeResultSomeOf) {
      defaults.writeln('b.$dartName = _\$$dartName;');
    } else {
      defaults.writeln('b.$dartName.replace(_\$$dartName);');
    }
  }

  if (result is TypeResultOneOf && !result.isSingleValue) {
    final expression = refer('b').property(dartName).nullSafeProperty('validateOneOf').call([]);
    validators.addExpression(expression);
  } else if (result is TypeResultAnyOf && !result.isSingleValue) {
    final expression = refer('b').property(dartName).nullSafeProperty('validateAnyOf').call([]);
    validators.addExpression(expression);
  }

  buildPatternCheck(schema, 'b.$dartName', dartName).forEach(validators.addExpression);
}
