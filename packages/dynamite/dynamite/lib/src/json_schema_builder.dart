import 'dart:async';
import 'dart:convert';

import 'package:build/build.dart' hide log;
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:dynamite/src/builder/generate_ofs.dart';
import 'package:dynamite/src/builder/generate_schemas.dart';
import 'package:dynamite/src/builder/serializer.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/helpers/logger.dart';
import 'package:dynamite/src/helpers/version_checker.dart';
import 'package:dynamite/src/models/config.dart';
import 'package:dynamite/src/models/dynamite_config/builder_type.dart';
import 'package:dynamite/src/models/json_schema.dart' as json_schema;
import 'package:path/path.dart' as p;

class JsonSchemaBuilder implements Builder {
  JsonSchemaBuilder(
    BuilderOptions options,
  ) : buildConfig = DynamiteConfig.fromJson(options.config);

  @override
  final buildExtensions = const {
    '.json_schema.json': ['.json_schema.dart'],
  };

  /// The configuration for this builder.
  final DynamiteConfig buildConfig;

  /// The dynamite builder type.
  static const DynamiteBuilder builderType = DynamiteBuilder.jsonSchema;

  @override
  Future<void> build(BuildStep buildStep) async {
    log.severe('''
JsonSchema generation for dynamite is still experimental.
Features might be broken or limited.
Please provide feedback at: https://github.com/nextcloud/neon/issues
''');

    final result = await helperVersionCheck(buildStep, builderType);
    if (!result) {
      return;
    }

    final inputId = buildStep.inputId;
    final outputId = inputId.changeExtension('.dart');

    try {
      final json = jsonDecode(await buildStep.readAsString(inputId)) as Map<String, dynamic>;

      final schema = json_schema.serializers.deserializeWith(
        json_schema.JsonSchema.serializer,
        json,
      )!;

      final config = buildConfig.configFor(inputId.path);
      final state = State(config, json);

      final output = Library((b) {
        final analyzerIgnores = state.buildConfig.analyzerIgnores;
        if (analyzerIgnores != null) {
          b.ignoreForFile.addAll(analyzerIgnores);
        }

        b
          ..generatedByComment = 'JsonSchema models generated by Dynamite. Do not manually edit this file.'
          ..directives.addAll([
            Directive.import('dart:convert'),
            Directive.import('dart:typed_data'),
            Directive.import('package:built_collection/built_collection.dart'),
            Directive.import('package:built_value/built_value.dart'),
            Directive.import('package:built_value/json_object.dart'),
            Directive.import('package:built_value/serializer.dart'),
            Directive.import('package:collection/collection.dart'),
            Directive.import('package:dynamite_runtime/models.dart'),
          ]);

        final identifier = schema.id?.pathSegments.last ?? inputId.pathSegments.last;

        final result = generateSchema(
          schema,
          toDartName(identifier, className: true),
          state,
        );

        if (result != null) {
          b.body.add(result);
        }

        b
          ..body.addAll(state.output)
          ..body.addAll(buildOfsExtensions(state))
          ..body.addAll(buildSerializer(state));

        // Part directive need to be generated after everything else so we know if we need it.
        if (state.hasResolvedBuiltTypes) {
          b.directives.add(
            Directive.part(p.basename(outputId.changeExtension('.g.dart').path)),
          );
        }

        if (state.buildConfig.experimental) {
          b.annotations.add(
            refer('experimental', 'package:meta/meta.dart'),
          );
        }
      });

      var outputString = output.accept(state.emitter).toString();

      final coverageIgnores = state.buildConfig.coverageIgnores;
      if (coverageIgnores != null) {
        for (final ignore in coverageIgnores) {
          final pattern = RegExp(ignore);

          outputString = outputString.replaceAllMapped(
            pattern,
            (match) => '  // coverage:ignore-start\n${match.group(0)}\n  // coverage:ignore-end',
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
    } catch (error, stackTrace) {
      log.severe(
        'Issue generating the library for $inputId',
        error,
        stackTrace,
      );

      rethrow;
    }
  }
}
