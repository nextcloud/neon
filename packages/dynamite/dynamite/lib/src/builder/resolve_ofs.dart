import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:dynamite/src/builder/resolve_type.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/helpers/docs.dart';
import 'package:dynamite/src/models/json_schema.dart' as json_schema;
import 'package:dynamite/src/models/openapi.dart' as openapi;
import 'package:dynamite/src/models/type_result.dart';

TypeResult resolveSomeOf(
  openapi.OpenAPI spec,
  State state,
  String identifier,
  json_schema.JsonSchema schema, {
  bool nullable = false,
}) {
  BuiltSet<TypeResult> resolveSubTypes(BuiltList<json_schema.JsonSchema> ofs) {
    return ofs.mapIndexed((index, schema) {
      return resolveType(
        spec,
        state,
        '$identifier$index',
        schema,
        nullable: true,
      );
    }).toBuiltSet();
  }

  TypeResultSomeOf result;
  switch (schema) {
    case json_schema.JsonSchema(:final oneOf) when oneOf != null:
      final subResults = resolveSubTypes(oneOf);

      result = TypeResultOneOf(
        identifier,
        nullable: nullable,
        subTypes: subResults,
      );
    case json_schema.JsonSchema(:final anyOf) when anyOf != null:
      final subResults = resolveSubTypes(anyOf);

      result = TypeResultAnyOf(
        identifier,
        nullable: nullable,
        subTypes: subResults,
      );
    default:
      throw StateError('allOf should be handled with inheritance');
  }

  if (state.resolvedTypes.add(result) && !result.isSingleValue) {
    final $typedef = TypeDef((b) {
      b
        ..docs.addAll(escapeDescription(schema.formattedDescription))
        ..name = result.className
        ..definition = refer(result.dartType.name);
    });

    state.output.add($typedef);
  }

  return result;
}
