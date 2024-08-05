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
  final resolvedSerializers = <String>{};
  late final emitter = DartEmitter(
    allocator: _Allocator(partId: partId),
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
}

/// Similar to [Allocator.simplePrefixing].
///
/// Generates a part directive if the reference url is a built_value one.
class _Allocator implements Allocator {
  _Allocator({required this.partId});

  final String partId;

  static const _doNotPrefix = {
    'package:built_value/built_value.dart',
    'package:built_value/json_object.dart',
    'package:built_value/serializer.dart',
  };

  final _imports = <String, int>{};
  var _keys = 1;

  @override
  String allocate(Reference reference) {
    final symbol = reference.symbol;
    final url = reference.url;

    if (url == null || url == 'dart:core') {
      return symbol!;
    } else if (_doNotPrefix.contains(url)) {
      _imports[url] ??= 0;

      return symbol!;
    }

    return '_i${_imports.putIfAbsent(url, _nextKey)}.$symbol';
  }

  int _nextKey() => _keys++;

  @override
  Iterable<Directive> get imports sync* {
    yield* _imports.entries.map((entry) {
      if (entry.value == 0) {
        return Directive.import(entry.key);
      }

      return Directive.import(entry.key, as: '_i${entry.value}');
    });

    if (_imports.containsKey('package:built_value/built_value.dart')) {
      yield Directive.part(partId);
    }
  }
}
