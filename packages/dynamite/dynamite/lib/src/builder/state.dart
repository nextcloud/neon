import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/type_result/type_result.dart';

class State {
  State({
    required this.classPrefix,
    required this.variablePrefix,
  });

  final String classPrefix;
  final String variablePrefix;
  final output = <Spec>[];
  final resolvedTypes = <TypeResult>{};
}
