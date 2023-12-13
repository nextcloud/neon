import 'dart:async';
import 'dart:convert';

import 'package:build/build.dart';
import 'package:built_collection/built_collection.dart';
import 'package:checked_yaml/checked_yaml.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:dynamite/src/builder/client.dart';
import 'package:dynamite/src/builder/generate_ofs.dart';
import 'package:dynamite/src/builder/generate_schemas.dart';
import 'package:dynamite/src/builder/imports.dart';
import 'package:dynamite/src/builder/serializer.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/helpers/version_checker.dart';
import 'package:dynamite/src/models/config.dart';
import 'package:dynamite/src/models/openapi.dart' as openapi;
import 'package:version/version.dart';

class OpenAPIBuilder implements Builder {
  OpenAPIBuilder(
    final BuilderOptions options,
  ) : buildConfig = DynamiteConfig.fromJson(options.config);

  @override
  final buildExtensions = const {
    '.openapi.json': ['.openapi.dart'],
    '.openapi.yaml': ['.openapi.dart'],
  };

  /// The minimum openapi version supported by this builder.
  static final Version minSupportedVersion = Version(3, 0, 0);

  /// The maximum openapi version supported by this builder.
  static final Version maxSupportedVersion = minSupportedVersion.incrementMajor();

  /// The configuration for this builder.
  final DynamiteConfig buildConfig;

  @override
  Future<void> build(final BuildStep buildStep) async {
    final result = await helperVersionCheck(buildStep);

    if (result.messages.isNotEmpty) {
      if (result.hasFatal) {
        log.severe(result.messages);
        return;
      } else {
        log.info(result.messages);
      }
    }

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

      final state = State(buildConfig);

      // Imports need to be generated after everything else so we know if we need the local part directive,
      // but they need to be added to the beginning of the output.
      final output = ListBuilder<Spec>()
        ..addAll(generateClients(spec, state))
        ..addAll(generateSchemas(spec, state))
        ..addAll(buildOfsExtensions(spec, state))
        ..addAll(buildSerializer(state))
        ..insertAll(0, generateImports(outputId, state));

      var outputString = output.build().map((final e) => e.accept(emitter)).join('\n');

      final coverageIgnores = state.buildConfig.coverageIgnores;
      if (coverageIgnores != null) {
        for (final ignore in coverageIgnores) {
          final pattern = RegExp(ignore);

          outputString = outputString.replaceAllMapped(
            pattern,
            (final match) => '  // coverage:ignore-start\n${match.group(0)}\n  // coverage:ignore-end',
          );
        }
      }

      final formatter = DartFormatter(pageWidth: buildConfig.pageWidth);
      unawaited(
        buildStep.writeAsString(
          outputId,
          formatter.format(outputString),
        ),
      );
    } catch (e, s) {
      print(s);

      rethrow;
    }
  }
}
