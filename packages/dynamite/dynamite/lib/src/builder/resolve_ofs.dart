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
  final subResults = schema.ofs!
      .mapIndexed(
        (index, s) => resolveType(
          spec,
          state,
          '$identifier$index',
          s,
          nullable: true,
        ),
      )
      .toBuiltSet();

  TypeResultSomeOf result;
  if (schema.oneOf != null) {
    result = TypeResultOneOf(
      identifier,
      nullable: nullable,
      subTypes: subResults,
    );
  } else if (schema.anyOf != null) {
    result = TypeResultAnyOf(
      identifier,
      nullable: nullable,
      subTypes: subResults,
    );
  } else {
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
