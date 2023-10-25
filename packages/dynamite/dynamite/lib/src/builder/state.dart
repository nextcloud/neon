import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/models/type_result.dart';

class State {
  State();

  final output = <Spec>[];
  final resolvedTypes = <TypeResult>{};
  final resolvedInterfaces = <TypeResult>{};

  /// Wether the state contains resolved types that need the built_value generator.
  bool get hasResolvedBuiltTypes => resolvedTypes
      .where(
        (final type) => type is TypeResultEnum || (type is TypeResultObject && type.className != 'ContentString'),
      )
      .isNotEmpty;
}
