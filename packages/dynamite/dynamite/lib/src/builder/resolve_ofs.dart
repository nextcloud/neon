import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/builder/resolve_interface.dart';
import 'package:dynamite/src/builder/resolve_type.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/helpers/built_value.dart';
import 'package:dynamite/src/models/openapi.dart' as openapi;
import 'package:dynamite/src/models/type_result.dart';

TypeResult resolveAllOf(
  final openapi.OpenAPI spec,
  final State state,
  final String identifier,
  final openapi.Schema schema, {
  final bool nullable = false,
}) {
  final result = TypeResultObject(
    identifier,
    nullable: nullable,
  );

  if (state.resolvedTypes.add(result)) {
    final interfaces = <TypeResultObject>{};
    final methods = ListBuilder<Method>();

    for (final s in schema.allOf!) {
      if (s.properties != null) {
        final interfaceClass = resolveInterface(
          spec,
          state,
          '${identifier}_${schema.allOf!.indexOf(s)}',
          s,
        );
        interfaces.add(interfaceClass);
      } else {
        final object = resolveType(
          spec,
          state,
          identifier,
          s,
          nullable: nullable,
        );

        if (object is TypeResultObject) {
          interfaces.add(object);
        } else {
          final property = generateProperty(
            object,
            object.className,
            s.formattedDescription,
          );

          methods.add(property);
        }
      }
    }

    final $interface = buildInterface(
      identifier,
      interfaces: interfaces,
      methods: methods.build(),
    );

    final $class = buildBuiltClass(identifier);

    state.output.addAll([
      $interface,
      $class,
    ]);
  }
  return result;
}
