import 'package:dynamite/src/builder/ofs_builder.dart';
import 'package:dynamite/src/builder/resolve_enum.dart';
import 'package:dynamite/src/builder/resolve_object.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/models/open_api.dart';
import 'package:dynamite/src/models/schema.dart';
import 'package:dynamite/src/type_result/type_result.dart';

TypeResult resolveType(
  final OpenAPI spec,
  final State state,
  final String identifier,
  final Schema schema, {
  final bool ignoreEnum = false,
  final bool nullable = false,
}) {
  TypeResult? result;
  if (schema.ref == null && schema.ofs == null && schema.type == null) {
    return TypeResultBase(
      'JsonObject',
      nullable: nullable,
    );
  }
  if (schema.ref != null) {
    final name = schema.ref!.split('/').last;
    result = resolveType(
      spec,
      state,
      name,
      spec.components!.schemas![name]!,
      nullable: nullable,
    );
  } else if (schema.allOf != null) {
    result = resolveAllOf(
      spec,
      state,
      identifier,
      schema,
      nullable: nullable,
    );
  } else if (schema.ofs != null) {
    result = resolveOfs(
      spec,
      state,
      identifier,
      schema,
      nullable: nullable,
    );
  } else if (schema.isContentString) {
    final subResult = resolveType(
      spec,
      state,
      identifier,
      schema.contentSchema!,
    );

    result = TypeResultObject(
      'ContentString',
      generics: [subResult],
      nullable: nullable,
    );
  } else {
    switch (schema.type) {
      case 'boolean':
        result = TypeResultBase(
          'bool',
          nullable: nullable,
        );
      case 'integer':
        result = TypeResultBase(
          'int',
          nullable: nullable,
        );
      case 'number':
        result = TypeResultBase(
          'num',
          nullable: nullable,
        );
      case 'string':
        switch (schema.format) {
          case 'binary':
            result = TypeResultBase(
              'Uint8List',
              nullable: nullable,
            );
        }

        result = TypeResultBase(
          'String',
          nullable: nullable,
        );
      case 'array':
        if (schema.items != null) {
          final subResult = resolveType(
            spec,
            state,
            identifier,
            schema.items!,
          );
          result = TypeResultList(
            'BuiltList',
            subResult,
            nullable: nullable,
          );
        } else {
          result = TypeResultList(
            'BuiltList',
            TypeResultBase('JsonObject'),
            nullable: nullable,
          );
        }
      case 'object':
        if (schema.properties == null) {
          if (schema.additionalProperties == null) {
            result = TypeResultBase(
              'JsonObject',
              nullable: nullable,
            );
          } else {
            final subResult = resolveType(
              spec,
              state,
              identifier,
              schema.additionalProperties!,
            );
            result = TypeResultMap(
              'BuiltMap',
              subResult,
              nullable: nullable,
            );
          }
        } else if (schema.properties!.isEmpty) {
          result = TypeResultMap(
            'BuiltMap',
            TypeResultBase('JsonObject'),
            nullable: nullable,
          );
        } else {
          result = resolveObject(
            spec,
            state,
            identifier,
            schema,
            nullable: nullable,
          );
        }
    }
  }

  if (result != null) {
    if (!ignoreEnum && schema.$enum != null) {
      result = resolveEnum(
        spec,
        state,
        identifier,
        schema,
        result,
        nullable: nullable,
      );
    }

    state.resolvedTypes.add(result);
    return result;
  }

  throw Exception('Can not convert OpenAPI type "$schema" to a Dart type');
}
