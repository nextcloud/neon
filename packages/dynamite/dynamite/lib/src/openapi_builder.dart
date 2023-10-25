import 'dart:convert';

import 'package:build/build.dart';
import 'package:built_collection/built_collection.dart';
import 'package:checked_yaml/checked_yaml.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:dynamite/src/builder/client.dart';
import 'package:dynamite/src/builder/generate_schemas.dart';
import 'package:dynamite/src/builder/imports.dart';
import 'package:dynamite/src/builder/serializer.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/models/openapi.dart' as openapi;
import 'package:version/version.dart';

class OpenAPIBuilder implements Builder {
  @override
  final buildExtensions = const {
    '.openapi.json': ['.openapi.dart'],
    '.openapi.yaml': ['.openapi.dart'],
  };

  /// The minimum openapi version supported by this builder.
  static final Version minSupportedVersion = Version(3, 0, 0);

  /// The maximum openapi version supported by this builder.
  static final Version maxSupportedVersion = minSupportedVersion.incrementMajor();

  @override
  Future<void> build(final BuildStep buildStep) async {
    try {
      final inputId = buildStep.inputId;
      final outputId = inputId.changeExtension('.dart');

      final emitter = DartEmitter(
        orderDirectives: true,
        useNullSafetySyntax: true,
      );

      final spec = switch (inputId.extension) {
        '.json' => openapi.serializers.deserializeWith(
            openapi.OpenAPI.serializer,
            json.decode(await buildStep.readAsString(inputId)),
          )!,
        '.yaml' => checkedYamlDecode(
            await buildStep.readAsString(inputId),
            (final m) => openapi.serializers.deserializeWith(openapi.OpenAPI.serializer, m)!,
          ),
        _ => throw StateError('Openapi specs can only be yaml or json.'),
      };

      final version = Version.parse(spec.version);
      if (version < minSupportedVersion || version > maxSupportedVersion) {
        throw Exception('Only OpenAPI between $minSupportedVersion and $maxSupportedVersion are supported.');
      }

      final state = State();

      // Imports need to be generated after everything else so we know if we need the local part directive,
      // but they need to be added to the beginning of the output.
      final output = ListBuilder<Spec>()
        ..addAll(generateClients(spec, state))
        ..addAll(generateSchemas(spec, state))
        ..addAll(buildSerializer(state))
        ..insertAll(0, generateImports(outputId, state));

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

      var outputString = output.build().map((final e) => e.accept(emitter)).join('\n');
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
