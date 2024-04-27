import 'package:dynamite/src/builder/resolve_interface.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/helpers/built_value.dart';
import 'package:dynamite/src/models/json_schema.dart' as json_schema;
import 'package:dynamite/src/models/openapi.dart' as openapi;
import 'package:dynamite/src/models/type_result.dart';

TypeResultObject resolveObject(
  openapi.OpenAPI spec,
  State state,
  String identifier,
  json_schema.JsonSchema schema, {
  bool nullable = false,
  bool isHeader = false,
}) {
  final result = TypeResultObject(
    identifier,
    nullable: nullable,
  );

  if (state.resolvedTypes.add(result)) {
    if (schema.allOf == null) {
      state.resolvedInterfaces.add(result);
    }

    final $interface = buildInterface(
      spec,
      state,
      identifier,
      schema,
      nullable: nullable,
      isHeader: isHeader,
    );

    final $class = buildBuiltClass(
      identifier,
      documentation: schema.formattedDescription,
    );

    state.output.addAll([
      $interface,
      $class,
    ]);
  }
  return result;
}
