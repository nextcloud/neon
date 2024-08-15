import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:dynamite/src/builder/resolve_type.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/helpers/docs.dart';
import 'package:dynamite/src/models/json_schema.dart' as json_schema;
import 'package:dynamite/src/models/type_result.dart';

TypeResult resolveSomeOf(State state, json_schema.JsonSchema schema) {
  final identifier = schema.identifier!;

  BuiltSet<TypeResult> resolveSubTypes(BuiltList<json_schema.JsonSchema> ofs) {
    return ofs.mapIndexed((index, schema) {
      return resolveType(
        state,
        schema.rebuild((b) {
          b
            ..identifier = '$identifier$index'
            ..nullable = true;
        }),
      );
    }).toBuiltSet();
  }

  TypeResultSomeOf result;
  switch (schema) {
    case json_schema.JsonSchema(:final oneOf) when oneOf != null:
      final subResults = resolveSubTypes(oneOf);

      result = TypeResultOneOf(
        identifier,
        nullable: schema.nullable,
        subTypes: subResults,
      );
    case json_schema.JsonSchema(:final anyOf) when anyOf != null:
      final subResults = resolveSubTypes(anyOf);

      result = TypeResultAnyOf(
        identifier,
        nullable: schema.nullable,
        subTypes: subResults,
      );
    default:
      throw StateError('allOf should be handled with inheritance');
  }

  if (!result.isSingleValue) {
    state.resolvedSerializers.addAll(result.serializers);
    if (state.resolvedTypes.add(result)) {
      final $typedef = TypeDef((b) {
        b
          ..docs.addAll(escapeDescription(schema.formattedDescription()))
          ..name = result.className
          ..definition = refer(result.dartType.name);

        if (schema.deprecated) {
          b.annotations.add(refer('Deprecated').call([refer("''")]));
        }
      });

      state.output.add($typedef);
    }
  }

  return result;
}
