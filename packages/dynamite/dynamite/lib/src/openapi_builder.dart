import 'dart:convert';

import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:dynamite/src/builder/client.dart';
import 'package:dynamite/src/builder/resolve_type.dart';
import 'package:dynamite/src/builder/serializer.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/models/open_api.dart';
import 'package:dynamite/src/type_result/type_result.dart';
import 'package:path/path.dart' as p;

class OpenAPIBuilder implements Builder {
  @override
  final buildExtensions = const {
    '.openapi.json': ['.openapi.dart'],
  };

  @override
  Future<void> build(final BuildStep buildStep) async {
    try {
      final inputId = buildStep.inputId;
      final outputId = inputId.changeExtension('.dart');

      final emitter = DartEmitter(
        orderDirectives: true,
        useNullSafetySyntax: true,
      );

      final spec = OpenAPI.fromJson(
        json.decode(
          await buildStep.readAsString(inputId),
        ) as Map<String, dynamic>,
      );

      final supportedVersions = ['3.0.3', '3.1.0'];
      if (!supportedVersions.contains(spec.version)) {
        throw Exception('Only OpenAPI ${supportedVersions.join(', ')} are supported');
      }

      final state = State(spec.info.title);

      final output = <String>[
        '// ignore_for_file: camel_case_types',
        '// ignore_for_file: public_member_api_docs',
        "import 'dart:convert';",
        "import 'dart:typed_data';",
        '',
        "import 'package:built_collection/built_collection.dart';",
        "import 'package:built_value/built_value.dart';",
        "import 'package:built_value/json_object.dart';",
        "import 'package:built_value/serializer.dart';",
        "import 'package:built_value/standard_json_plugin.dart';",
        "import 'package:dynamite_runtime/content_string.dart';",
        "import 'package:dynamite_runtime/http_client.dart';",
        "import 'package:universal_io/io.dart';",
        '',
        "export 'package:dynamite_runtime/http_client.dart';",
        '',
        "part '${p.basename(outputId.changeExtension('.g.dart').path)}';",
        '',
        ...generateDynamiteOverrides(state).map((final e) => e.accept(emitter).toString()),
        ...generateClients(spec, state).map((final e) => e.accept(emitter).toString()),
      ];

      if (spec.components?.schemas != null) {
        for (final schema in spec.components!.schemas!.entries) {
          final identifier = toDartName(schema.key, uppercaseFirstCharacter: true);
          if (schema.value.type == null && schema.value.ref == null && schema.value.ofs == null) {
            output.add('typedef $identifier = dynamic;');
          } else {
            final result = resolveType(
              spec,
              state,
              identifier,
              schema.value,
            );
            if (result is TypeResultBase) {
              output.add('typedef $identifier = ${result.name};');
            }
          }
        }
      }

      output
        ..addAll(state.output.map((final e) => e.accept(emitter).toString()))
        ..addAll(buildSerializer(state));

      final patterns = [
        RegExp(
          r'const .*\._\(\);',
        ),
        RegExp(
          r'factory .*\.fromJson\(Map<String, dynamic> json\) => _jsonSerializers\.deserializeWith\(serializer, json\)!;',
        ),
        RegExp(
          r'Map<String, dynamic> toJson\(\) => _jsonSerializers\.serializeWith\(serializer, this\)! as Map<String, dynamic>;',
        ),
        RegExp(
          r'static BuiltSet<.*> get values => _\$.*Values;',
        ),
      ];
      var outputString = output.join('\n');
      for (final pattern in patterns) {
        outputString = outputString.replaceAllMapped(
          pattern,
          (final match) => '  // coverage:ignore-start\n${match.group(0)}\n  // coverage:ignore-end',
        );
      }
      final formatter = DartFormatter(pageWidth: 120);
      await buildStep.writeAsString(
        outputId,
        formatter.format(outputString),
      );
    } catch (e, s) {
      print(s);

      rethrow;
    }
  }
}
