import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/models/type_result.dart';

class State {
  State(final String prefix)
      : classPrefix = toDartName(prefix, uppercaseFirstCharacter: true),
        variablePrefix = toDartName(prefix);

  final String classPrefix;
  final String variablePrefix;

  final output = <Spec>[];
  final resolvedTypes = <TypeResult>{};
  final resolvedInterfaces = <TypeResult>{};
}
