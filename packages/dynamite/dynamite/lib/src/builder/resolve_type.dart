import 'package:built_collection/built_collection.dart';
import 'package:dynamite/src/builder/resolve_enum.dart';
import 'package:dynamite/src/builder/resolve_object.dart';
import 'package:dynamite/src/builder/resolve_ofs.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/models/json_schema.dart' as json_schema;
import 'package:dynamite/src/models/type_result.dart';

/// Resolves the [schema] into a `TypeResult`.
///
/// Resolved types are always added to the [state].
TypeResult resolveType(State state, json_schema.JsonSchema schema) {
  final result = _resolveType(
    state,
    schema,
  );

  state.resolvedSerializers.addAll(result.serializers);
  state.resolvedTypes.add(result);
  return result;
}

TypeResult _resolveType(State state, json_schema.JsonSchema schema) {
  switch (schema) {
    case json_schema.JsonSchema($enum: != null):
      final subResult = resolveType(
        state,
        schema.rebuild((b) {
          b.$enum = null;
        }),
      );

      return resolveEnum(
        state,
        schema,
        subResult,
      );

    case json_schema.JsonSchema(allOf: != null):
      return resolveObject(
        state,
        schema,
      );

    case json_schema.GenericSchema(ref: null, allOf: null, anyOf: null, oneOf: null):
      return TypeResultBase(
        'JsonObject',
        nullable: schema.nullable,
      );

    case json_schema.JsonSchema(ref: != null):
      final subResult = resolveType(
        state,
        schema.resolveRef(state.rootJson),
      );

      return subResult.asTypeDef;

    case json_schema.JsonSchema(anyOf: != null) || json_schema.JsonSchema(oneOf: != null):
      return resolveSomeOf(
        state,
        schema,
      );

    case json_schema.StringSchema(isContentString: true):
      final subResult = resolveType(
        state,
        schema.contentSchema!.rebuild((b) {
          b.identifier = schema.identifier;
        }),
      );

      return TypeResultObject(
        'ContentString',
        generics: BuiltList([subResult]),
        nullable: schema.nullable,
      );

    case json_schema.BooleanSchema():
      return TypeResultBase(
        'bool',
        nullable: schema.nullable,
      );

    case json_schema.IntegerSchema():
      return TypeResultBase(
        'int',
        nullable: schema.nullable,
      );

    case json_schema.NumberSchema(format: 'float' || 'double'):
      return TypeResultBase(
        'double',
        nullable: schema.nullable,
      );

    case json_schema.NumberSchema():
      return TypeResultBase(
        'num',
        nullable: schema.nullable,
      );

    case json_schema.StringSchema(format: 'binary'):
      return TypeResultBase(
        'Uint8List',
        nullable: schema.nullable,
      );

    case json_schema.StringSchema():
      return TypeResultBase(
        'String',
        nullable: schema.nullable,
      );

    case json_schema.ArraySchema():
      final TypeResult subResult;
      if (schema.maxItems == 0) {
        subResult = TypeResultBase('Never');
      } else if (schema.items != null) {
        subResult = resolveType(
          state,
          schema.items!.rebuild((b) {
            b.identifier = schema.identifier;
          }),
        );
      } else {
        subResult = TypeResultBase('JsonObject');
      }

      return TypeResultList(
        schema.uniqueItems ? 'BuiltSet' : 'BuiltList',
        subResult,
        builderName: schema.uniqueItems ? 'SetBuilder' : 'ListBuilder',
        nullable: schema.nullable,
      );

    case json_schema.ObjectSchema(properties: null):
      if (schema.additionalProperties == null) {
        return TypeResultBase(
          'JsonObject',
          nullable: schema.nullable,
        );
      } else {
        final subResult = resolveType(
          state,
          schema.additionalProperties!.rebuild((b) {
            b.identifier = schema.identifier;
          }),
        );
        return TypeResultMap(
          'BuiltMap',
          subResult,
          nullable: schema.nullable,
        );
      }

    case json_schema.ObjectSchema(:final properties) when properties != null && properties.isEmpty:
      return TypeResultMap(
        'BuiltMap',
        TypeResultBase('JsonObject'),
        nullable: schema.nullable,
      );

    case json_schema.ObjectSchema():
      return resolveObject(
        state,
        schema,
      );

    default:
      throw Exception('Can not convert OpenAPI type "$schema" to a Dart type');
  }
}
