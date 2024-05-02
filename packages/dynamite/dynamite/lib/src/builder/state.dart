import 'dart:convert' show jsonDecode;

import 'package:build/build.dart' show AssetId, BuildStep;
import 'package:checked_yaml/checked_yaml.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/models/dynamite_config/config.dart';
import 'package:dynamite/src/models/openapi.dart' as openapi;
import 'package:dynamite/src/models/type_result.dart';
import 'package:path/path.dart' as p;

class State {
  State(
    DynamiteConfig rootConfig,
    this.buildStep,
  ) : buildConfig = rootConfig.configFor(buildStep.inputId.path);

  final DynamiteConfig buildConfig;

  late final Map<String, dynamic> rootJson;

  final BuildStep buildStep;
  late final AssetId inputId = buildStep.inputId;
  late final AssetId outputId = buildStep.inputId.changeExtension('.dart');
  late final String partId = p.basename(outputId.changeExtension('.g.dart').path);

  late final openapi.OpenAPI spec = openapi.serializers.deserializeWith(
    openapi.OpenAPI.serializer,
    rootJson,
  )!;

  Future<void> init() async {
    rootJson = switch (inputId.extension) {
      '.json' => jsonDecode(await buildStep.readAsString(inputId)) as Map<String, dynamic>,
      '.yaml' => checkedYamlDecode<Map<String, dynamic>>(
          await buildStep.readAsString(inputId),
          (m) => m!.cast(),
        ),
      _ => throw StateError('Openapi specs can only be yaml or json.'),
    };
  }

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
