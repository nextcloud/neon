import 'dart:convert';

import 'package:build/build.dart';
import 'package:built_collection/built_collection.dart';
import 'package:checked_yaml/checked_yaml.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:dynamite/src/builder/client.dart';
import 'package:dynamite/src/builder/imports.dart';
import 'package:dynamite/src/builder/resolve_type.dart';
import 'package:dynamite/src/builder/serializer.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/models/openapi.dart' as openapi;
import 'package:dynamite/src/models/type_result.dart';
import 'package:version/version.dart';

class OpenAPIBuilder implements Builder {
  @override
  final buildExtensions = const {
    '.openapi.json': ['.openapi.dart'],
    '.openapi.yaml': ['.openapi.dart'],
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

      if (Version.parse(spec.version).major != 3) {
        throw Exception('Only OpenAPI 3.0.0 and later are supported');
      }

      final state = State(spec.info.title);

      final output = ListBuilder<Spec>()
        ..addAll(generateImports(outputId))
        ..addAll(generateClients(spec, state));

      if (spec.components?.schemas != null) {
        for (final schema in spec.components!.schemas!.entries) {
          final identifier = toDartName(schema.key, uppercaseFirstCharacter: true);
          if (schema.value.type == null && schema.value.ref == null && schema.value.ofs == null) {
            output.add(
              TypeDef(
                (final b) => b
                  ..name = identifier
                  ..definition = refer('dynamic'),
              ),
            );
          } else {
            final result = resolveType(
              spec,
              state,
              identifier,
              schema.value,
            );
            if (result is TypeResultBase) {
              output.add(
                TypeDef(
                  (final b) => b
                    ..name = identifier
                    ..definition = refer(result.name),
                ),
              );
            }
          }
        }
      }

      output
        ..addAll(state.output)
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
