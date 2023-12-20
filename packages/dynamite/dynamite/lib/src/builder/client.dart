import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:dynamite/src/builder/resolve_mime_type.dart';
import 'package:dynamite/src/builder/resolve_object.dart';
import 'package:dynamite/src/builder/resolve_type.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/helpers/dynamite.dart';
import 'package:dynamite/src/helpers/pattern_check.dart';
import 'package:dynamite/src/models/openapi.dart' as openapi;
import 'package:dynamite/src/models/type_result.dart';
import 'package:intersperse/intersperse.dart';
import 'package:uri/uri.dart';

Iterable<Class> generateClients(
  final openapi.OpenAPI spec,
  final State state,
) sync* {
  if (spec.paths == null || spec.paths!.isEmpty) {
    return;
  }

  final tags = generateTags(spec);
  yield buildRootClient(spec, state, tags);

  for (final tag in tags) {
    yield buildClient(spec, state, tags, tag);
  }
}

Class buildRootClient(
  final openapi.OpenAPI spec,
  final State state,
  final List<String> tags,
) =>
    Class(
      (final b) {
        b
          ..extend = refer('DynamiteClient')
          ..name = 'Client'
          ..docs.addAll(spec.formattedTagsFor(null))
          ..constructors.addAll([
            Constructor(
              (final b) => b
                ..requiredParameters.add(
                  Parameter(
                    (final b) => b
                      ..name = 'baseURL'
                      ..toSuper = true,
                  ),
                )
                ..optionalParameters.addAll([
                  Parameter(
                    (final b) => b
                      ..name = 'baseHeaders'
                      ..toSuper = true
                      ..named = true,
                  ),
                  Parameter(
                    (final b) => b
                      ..name = 'userAgent'
                      ..toSuper = true
                      ..named = true,
                  ),
                  Parameter(
                    (final b) => b
                      ..name = 'httpClient'
                      ..toSuper = true
                      ..named = true,
                  ),
                  Parameter(
                    (final b) => b
                      ..name = 'cookieJar'
                      ..toSuper = true
                      ..named = true,
                  ),
                  if (spec.hasAnySecurity) ...[
                    Parameter(
                      (final b) => b
                        ..name = 'authentications'
                        ..toSuper = true
                        ..named = true,
                    ),
                  ],
                ]),
            ),
            Constructor(
              (final b) => b
                ..name = 'fromClient'
                ..requiredParameters.add(
                  Parameter(
                    (final b) => b
                      ..name = 'client'
                      ..type = refer('DynamiteClient'),
                  ),
                )
                ..initializers.add(
                  const Code('''
super(
  client.baseURL,
  baseHeaders: client.baseHeaders,
  httpClient: client.httpClient,
  cookieJar: client.cookieJar,
  authentications: client.authentications,
)
'''),
                ),
            ),
          ]);

        for (final tag in tags.where((final t) => !t.contains('/'))) {
          final client = clientName(tag);

          b.methods.add(
            Method(
              (final b) => b
                ..name = toDartName(tag)
                ..lambda = true
                ..type = MethodType.getter
                ..returns = refer(client)
                ..body = Code('$client(this)'),
            ),
          );
        }

        b.methods.addAll(buildTags(spec, state, null));
      },
    );

Class buildClient(
  final openapi.OpenAPI spec,
  final State state,
  final List<String> tags,
  final String tag,
) =>
    Class(
      (final b) {
        b
          ..name = clientName(tag)
          ..docs.addAll(spec.formattedTagsFor(tag))
          ..constructors.add(
            Constructor(
              (final b) => b.requiredParameters.add(
                Parameter(
                  (final b) => b
                    ..name = '_rootClient'
                    ..toThis = true,
                ),
              ),
            ),
          )
          ..fields.add(
            Field(
              (final b) => b
                ..name = '_rootClient'
                ..type = refer('Client')
                ..modifier = FieldModifier.final$,
            ),
          );

        for (final t in tags.where((final t) => t.startsWith('$tag/'))) {
          b.methods.add(
            Method(
              (final b) => b
                ..name = toDartName(t.substring('$tag/'.length))
                ..lambda = true
                ..type = MethodType.getter
                ..returns = refer(clientName(t))
                ..body = Code('${clientName(t)}(_rootClient)'),
            ),
          );
        }

        b.methods.addAll(buildTags(spec, state, tag));
      },
    );

Iterable<Method> buildTags(
  final openapi.OpenAPI spec,
  final State state,
  final String? tag,
) sync* {
  final client = tag == null ? 'this' : '_rootClient';
  final paths = generatePaths(spec, tag);

  for (final pathEntry in paths.entries) {
    for (final operationEntry in pathEntry.value.operations.entries) {
      final httpMethod = operationEntry.key.name;
      final operation = operationEntry.value;
      final operationName = operation.operationId ?? toDartName('$httpMethod-${pathEntry.key}');
      final parameters = [
        ...?pathEntry.value.parameters,
        ...?operation.parameters,
      ]..sort(sortRequiredParameters);
      final name = toDartName(filterMethodName(operationName, tag ?? ''));

      final hasAuthentication = needsAuthCheck(pathEntry, operation, spec, client);
      var hasUriParameters = false;
      var hasHeaderParameters = false;
      for (final parameter in parameters) {
        switch (parameter.$in) {
          case openapi.ParameterType.path:
          case openapi.ParameterType.query:
            hasUriParameters = true;
          case openapi.ParameterType.header:
            hasHeaderParameters = true;
          default:
        }

        // No need to continue searching.
        if (hasHeaderParameters && hasUriParameters) {
          break;
        }
      }

      var responses = <openapi.Response, List<String>>{};
      if (operation.responses != null) {
        for (final responseEntry in operation.responses!.entries) {
          final statusCode = responseEntry.key;
          final response = responseEntry.value;

          responses[response] ??= [];
          responses[response]!.add(statusCode);
        }

        if (responses.length > 1) {
          print('$operationName uses more than one response schema but we only generate the first one');
          responses = Map.fromEntries([responses.entries.first]);
        }
      }

      final code = StringBuffer();
      final acceptHeader = responses.keys
          .map((final response) => response.content?.keys)
          .whereNotNull()
          .expand((final element) => element)
          .toSet()
          .join(',');

      if (hasUriParameters) {
        code.writeln('final _parameters = <String, dynamic>{};');
      }
      if (acceptHeader.isNotEmpty) {
        if (hasHeaderParameters || hasAuthentication) {
          code.writeln("final _headers = <String, String>{'Accept': '$acceptHeader',};");
        } else {
          code.writeln("const _headers = <String, String>{'Accept': '$acceptHeader',};");
        }
      } else if (acceptHeader.isEmpty) {
        code.writeln('final _headers = <String, String>{};');
      }
      if (operation.requestBody != null) {
        code.writeln('Uint8List? _body;');
      }
      // Separate the declarations from the assignments
      code.writeln();

      if (hasAuthentication) {
        buildAuthCheck(
          pathEntry,
          operation,
          spec,
          client,
        ).forEach(code.writeln);
      }

      final operationParameters = ListBuilder<Parameter>();
      final annotations = operation.deprecated ? refer('Deprecated').call([refer("''")]) : null;
      var returnDataType = 'void';
      var returnHeadersType = 'void';

      for (final parameter in parameters) {
        final parameterRequired = isRequired(
          parameter.required,
          parameter.schema,
        );

        final result = resolveType(
          spec,
          state,
          toDartName(
            '$operationName-${parameter.name}',
            uppercaseFirstCharacter: true,
          ),
          parameter.schema!,
          nullable: !parameterRequired,
        );

        operationParameters.add(
          Parameter(
            (final b) {
              b
                ..named = true
                ..name = toDartName(parameter.name)
                ..required = parameterRequired
                ..type = refer(result.nullableName);
            },
          ),
        );

        code.writeln(buildParameterSerialization(result, parameter));
      }
      resolveMimeTypeEncode(operation, spec, state, operationName, operationParameters).forEach(code.writeln);

      for (final responseEntry in responses.entries) {
        final response = responseEntry.key;
        final statusCodes = responseEntry.value;

        TypeResult? headersType;

        if (response.headers != null) {
          final identifierBuilder = StringBuffer();
          if (tag != null) {
            identifierBuilder.write(toDartName(tag, uppercaseFirstCharacter: true));
          }
          identifierBuilder
            ..write(toDartName(operationName, uppercaseFirstCharacter: true))
            ..write('Headers');
          headersType = resolveObject(
            spec,
            state,
            identifierBuilder.toString(),
            openapi.Schema(
              (final b) => b
                ..properties.replace(
                  response.headers!.map(
                    (final headerName, final value) => MapEntry(
                      headerName.toLowerCase(),
                      value.schema!,
                    ),
                  ),
                ),
            ),
            isHeader: true,
          );
        }

        final identifierBuilder = StringBuffer()
          ..write(operationName)
          ..write('-response');
        if (responses.entries.length > 1) {
          identifierBuilder
            ..write('-')
            ..write(responses.entries.toList().indexOf(responseEntry));
        }

        final dataType = resolveMimeTypeDecode(
          response,
          spec,
          state,
          toDartName(identifierBuilder.toString(), uppercaseFirstCharacter: true),
        );

        if (!hasUriParameters) {
          code.writeln("const _path = '${pathEntry.key}';");
        } else {
          final queryParams = <String>[];
          for (final parameter in parameters) {
            if (parameter.$in != openapi.ParameterType.query) {
              continue;
            }

            // Default to a plain parameter without exploding.
            queryParams.add(parameter.uriTemplate(withPrefix: false) ?? parameter.pctEncodedName);
          }

          final pathBuilder = StringBuffer()..write(pathEntry.key);

          if (queryParams.isNotEmpty) {
            pathBuilder
              ..write('{?')
              ..writeAll(queryParams, ',')
              ..write('}');
          }

          final path = pathBuilder.toString();
          // Sanity check the uri at build time.
          try {
            UriTemplate(path);
          } on ParseException catch (e) {
            throw Exception('The resulting uri $path is not a valid uri template according to RFC 6570. $e');
          }

          code.writeln("final _path = UriTemplate('$path').expand(_parameters);");
        }

        if (dataType != null) {
          returnDataType = dataType.name;
        }
        if (headersType != null) {
          returnHeadersType = headersType.name;
        }

        code.writeln('''
  return DynamiteRawResponse<$returnDataType, $returnHeadersType>(
    response: $client.executeRequest(
      '$httpMethod',
      _path,
      _headers,
      ${operation.requestBody != null ? '_body' : 'null'},
''');

        if (responses.values.isNotEmpty) {
          if (statusCodes.contains('default')) {
            code.writeln('null,');
          } else {
            final codes = statusCodes.join(',');
            code.writeln('const {$codes},');
          }
        }

        code.writeln('''
    ),
    bodyType: ${dataType?.fullType},
    headersType: ${headersType?.fullType},
    serializers: jsonSerializers,
  );
''');
      }

      yield Method((final b) {
        b
          ..name = name
          ..modifier = MethodModifier.async
          ..docs.addAll(operation.formattedDescription(name));

        if (annotations != null) {
          b.annotations.add(annotations);
        }

        final parameters = operationParameters.build();
        final rawParameters = parameters.map((final p) => '${p.name}: ${p.name},').join('\n');

        b
          ..optionalParameters.addAll(parameters)
          ..returns = refer('Future<DynamiteResponse<$returnDataType, $returnHeadersType>>')
          ..body = Code('''
final rawResponse = ${name}Raw(
  $rawParameters
);

return rawResponse.future;
''');
      });

      yield Method(
        (final b) {
          b
            ..name = '${name}Raw'
            ..docs.addAll(operation.formattedDescription(name, isRawRequest: true))
            ..annotations.add(refer('experimental'));

          if (annotations != null) {
            b.annotations.add(annotations);
          }

          b
            ..optionalParameters.addAll(operationParameters.build())
            ..returns = refer('DynamiteRawResponse<$returnDataType, $returnHeadersType>')
            ..body = Code(code.toString());
        },
      );
    }
  }
}

String buildParameterSerialization(
  final TypeResult result,
  final openapi.Parameter parameter,
) {
  final $default = parameter.schema?.$default;
  var defaultValueCode = $default?.value;
  if ($default != null && $default.isString) {
    defaultValueCode = "'${$default.asString}'";
  }
  final dartName = toDartName(parameter.name);
  final serializedName = '\$$dartName';

  final buffer = StringBuffer()..write('var $serializedName = ${result.serialize(dartName)};');

  if ($default != null) {
    buffer.writeln('$serializedName ??= $defaultValueCode;');
  }

  if (parameter.schema != null) {
    buildPatternCheck(parameter.schema!, serializedName, dartName).forEach(buffer.writeln);
  }

  if (parameter.$in == openapi.ParameterType.header) {
    final assignment =
        "_headers['${parameter.pctEncodedName}'] = const dynamite_utils.HeaderEncoder(explode: ${parameter.explode}).convert($serializedName);";

    if ($default == null) {
      buffer
        ..writeln('if ($serializedName != null) {')
        ..writeln(assignment)
        ..writeln('}');
    } else {
      buffer.writeln(assignment);
    }
  } else {
    buffer.writeln("_parameters['${parameter.pctEncodedName}'] = $serializedName;");
  }

  return buffer.toString();
}

bool needsAuthCheck(
  final MapEntry<String, openapi.PathItem> pathEntry,
  final openapi.Operation operation,
  final openapi.OpenAPI spec,
  final String client,
) {
  final security = operation.security ?? spec.security ?? BuiltList();
  final securityRequirements = security.where((final requirement) => requirement.isNotEmpty);

  return securityRequirements.isNotEmpty;
}

Iterable<String> buildAuthCheck(
  final MapEntry<String, openapi.PathItem> pathEntry,
  final openapi.Operation operation,
  final openapi.OpenAPI spec,
  final String client,
) sync* {
  final security = operation.security ?? spec.security ?? BuiltList();
  final securityRequirements = security.where((final requirement) => requirement.isNotEmpty);
  final isOptionalSecurity = securityRequirements.length != security.length;

  if (securityRequirements.isEmpty) {
    return;
  }

  yield '''
// coverage:ignore-start
final authentication = $client.authentications.firstWhereOrNull(
    (auth) => switch (auth) {
''';

  yield* securityRequirements.map((final requirement) {
    final securityScheme = spec.components!.securitySchemes![requirement.keys.single]!;
    final dynamiteAuth = toDartName(
      'Dynamite-${securityScheme.fullName.join('-')}-Authentication',
      uppercaseFirstCharacter: true,
    );
    return '$dynamiteAuth()';
  }).intersperse(' || ');

  yield '''
        => true,
      _ => false,
    },
  );
''';

  yield '''
if(authentication != null) {
  _headers.addAll(
    authentication.headers,
  );
} 
''';

  if (!isOptionalSecurity) {
    yield '''
else {
  throw Exception('Missing authentication for ${securityRequirements.map((final r) => r.keys.single).join(' or ')}');
}
''';
  }
  yield '// coverage:ignore-end';
}

Map<String, openapi.PathItem> generatePaths(final openapi.OpenAPI spec, final String? tag) {
  final paths = <String, openapi.PathItem>{};

  if (spec.paths != null) {
    for (final path in spec.paths!.entries) {
      for (final operationEntry in path.value.operations.entries) {
        final operation = operationEntry.value;
        if ((operation.tags != null && operation.tags!.contains(tag)) ||
            (tag == null && (operation.tags == null || operation.tags!.isEmpty))) {
          paths[path.key] ??= path.value;
          paths[path.key]!.rebuild((final b) {
            switch (operationEntry.key) {
              case openapi.PathItemOperation.get:
                b.get.replace(operation);
              case openapi.PathItemOperation.put:
                b.put.replace(operation);
              case openapi.PathItemOperation.post:
                b.post.replace(operation);
              case openapi.PathItemOperation.delete:
                b.delete.replace(operation);
              case openapi.PathItemOperation.options:
                b.options.replace(operation);
              case openapi.PathItemOperation.head:
                b.head.replace(operation);
              case openapi.PathItemOperation.patch:
                b.patch.replace(operation);
              case openapi.PathItemOperation.trace:
                b.trace.replace(operation);
            }
          });
        }
      }
    }
  }

  return paths;
}

List<String> generateTags(final openapi.OpenAPI spec) {
  final tags = <String>[];

  if (spec.paths != null) {
    for (final pathItem in spec.paths!.values) {
      for (final operation in pathItem.operations.values) {
        if (operation.tags != null) {
          for (final tag in operation.tags!) {
            final tagPart = tag.split('/').first;
            if (!tags.contains(tagPart)) {
              tags.add(tagPart);
            }
          }
        }
      }
    }
  }

  return tags..sort((final a, final b) => a.compareTo(b));
}
