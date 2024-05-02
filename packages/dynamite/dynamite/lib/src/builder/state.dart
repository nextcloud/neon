import 'package:build/build.dart' show AssetId;
import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/models/dynamite_config/config.dart';
import 'package:dynamite/src/models/type_result.dart';
import 'package:path/path.dart' as p;

class State {
  State(
    DynamiteConfig rootConfig,
    this.rootJson,
    this.inputId,
  ) : buildConfig = rootConfig.configFor(inputId.path);

  final DynamiteConfig buildConfig;

  final Map<String, dynamic> rootJson;

  final AssetId inputId;
  late final AssetId outputId = inputId.changeExtension('.dart');
  late final String partId = p.basename(outputId.changeExtension('.g.dart').path);

  final output = <Spec>[];
  final resolvedTypes = <TypeResult>{};
  final emitter = DartEmitter.scoped(
    orderDirectives: true,
    useNullSafetySyntax: true,
  );

  Iterable<TypeResultSomeOf> get uniqueSomeOfTypes {
    final someOfs = resolvedTypes.whereType<TypeResultSomeOf>();
    final uniqueTypes = <String, TypeResultSomeOf>{};

    for (final result in someOfs) {
      uniqueTypes[result.typeName] = result;
    }

    return uniqueTypes.values;
  }

  /// Wether the state contains resolved types that need the built_value generator.
  bool get hasResolvedBuiltTypes => resolvedTypes
      .where(
        (type) => type is TypeResultEnum || type is TypeResultObject && type.className != 'ContentString',
      )
      .isNotEmpty;
}
