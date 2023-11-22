import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:path/path.dart' as p;

Iterable<Spec> generateImports(final AssetId outputId, final State state) sync* {
  final analyzerIgnores = state.buildConfig.analyzerIgnores;
  if (analyzerIgnores != null) {
    for (final rule in analyzerIgnores) {
      yield Code('// ignore_for_file: $rule');
    }
  }

  yield* [
    Directive.import('dart:convert'),
    Directive.import('dart:typed_data'),
    const Code(''),
    Directive.import('package:built_collection/built_collection.dart'),
    Directive.import('package:built_value/built_value.dart'),
    Directive.import('package:built_value/json_object.dart'),
    Directive.import('package:built_value/serializer.dart'),
    Directive.import('package:built_value/standard_json_plugin.dart'),
    Directive.import('package:collection/collection.dart'),
    Directive.import('package:dynamite_runtime/built_value.dart'),
    Directive.import('package:dynamite_runtime/http_client.dart'),
    Directive.import('package:dynamite_runtime/models.dart'),
    Directive.import('package:dynamite_runtime/utils.dart'),
    Directive.import('package:meta/meta.dart'),
    Directive.import('package:universal_io/io.dart'),
    Directive.import('package:uri/uri.dart'),
    const Code(''),
  ];

  if (state.hasResolvedBuiltTypes) {
    yield Directive.part(p.basename(outputId.changeExtension('.g.dart').path));
    yield const Code('');
  }
}
