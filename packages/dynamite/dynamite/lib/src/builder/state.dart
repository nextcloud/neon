import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/models/type_result.dart';

class State {
  State();

  final output = <Spec>[];
  final resolvedTypes = <TypeResult>{};
  final resolvedInterfaces = <TypeResult>{};
}
