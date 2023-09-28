import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:dynamite/src/builder/resolve_mime_type.dart';
import 'package:dynamite/src/builder/resolve_object.dart';
import 'package:dynamite/src/builder/resolve_type.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/helpers/dynamite.dart';
import 'package:dynamite/src/helpers/type_result.dart';
import 'package:dynamite/src/models/openapi.dart' as openapi;
import 'package:dynamite/src/models/type_result.dart';
import 'package:intersperse/intersperse.dart';

Iterable<Class> generateClients(
  final openapi.OpenAPI spec,
  final State state,
) sync* {
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
          ..name = '${state.classPrefix}Client'
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
          final client = '${state.classPrefix}${clientName(tag)}';

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
          ..name = '${state.classPrefix}${clientName(tag)}'
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
                ..type = refer('${state.classPrefix}Client')
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
                ..returns = refer('${state.classPrefix}${clientName(t)}')
                ..body = Code('${state.classPrefix}${clientName(t)}(_rootClient)'),
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
      final operationId = operation.operationId ?? toDartName('$httpMethod-${pathEntry.key}');
      final parameters = [
        ...?pathEntry.value.parameters,
        ...?operation.parameters,
      ]..sort(sortRequiredParameters);
      final name = toDartName(filterMethodName(operationId, tag ?? ''));

      var responses = <openapi.Response, List<int>>{};
      if (operation.responses != null) {
        for (final responseEntry in operation.responses!.entries) {
          final statusCode = int.parse(responseEntry.key);
          final response = responseEntry.value;

          responses[response] ??= [];
          responses[response]!.add(statusCode);
        }

        if (responses.length > 1) {
          print('$operationId uses more than one response schema but we only generate the first one');
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

      code.writeln('''
  var _path = '${pathEntry.key}';
  final _queryParameters = <String, dynamic>{};
  final _headers = <String, String>{${acceptHeader.isNotEmpty ? "'Accept': '$acceptHeader'," : ''}};
  Uint8List? _body;
  ''');

      buildAuthCheck(
        responses,
        pathEntry,
        operation,
        spec,
        client,
      ).forEach(code.writeln);

      final operationParameters = ListBuilder<Parameter>();
      final annotations = operation.deprecated ?? false ? refer('Deprecated').call([refer("''")]) : null;
      var returnDataType = 'void';
      var returnHeadersType = 'void';

      for (final parameter in parameters) {
        final dartParameterNullable = isDartParameterNullable(
          parameter.required,
          parameter.schema,
        );

        final result = resolveType(
          spec,
          state,
          toDartName(
            '$operationId-${parameter.name}',
            uppercaseFirstCharacter: true,
          ),
          parameter.schema!,
          nullable: dartParameterNullable,
        ).dartType;

        buildPatternCheck(result, parameter).forEach(code.writeln);

        final defaultValueCode = parameter.schema?.$default != null
            ? valueToEscapedValue(result, parameter.schema!.$default.toString())
            : null;

        operationParameters.add(
          Parameter(
            (final b) {
              b
                ..named = true
                ..name = toDartName(parameter.name)
                ..required = parameter.isDartRequired;
              if (parameter.schema != null) {
                b.type = refer(result.nullableName);
              }
              if (defaultValueCode != null) {
                b.defaultTo = Code(defaultValueCode);
              }
            },
          ),
        );

        if (dartParameterNullable) {
          code.writeln('if (${toDartName(parameter.name)} != null) {');
        }
        final value = result.encode(
          toDartName(parameter.name),
          onlyChildren: result is TypeResultList && parameter.$in == 'query',
        );
        if (defaultValueCode != null && parameter.$in == 'query') {
          code.writeln('if (${toDartName(parameter.name)} != $defaultValueCode) {');
        }
        switch (parameter.$in) {
          case 'path':
            code.writeln(
              "_path = _path.replaceAll('{${parameter.name}}', Uri.encodeQueryComponent($value));",
            );
          case 'query':
            code.writeln(
              "_queryParameters['${parameter.name}'] = $value;",
            );
          case 'header':
            code.writeln(
              "_headers['${parameter.name}'] = $value;",
            );
          default:
            throw Exception('Can not work with parameter in "${parameter.$in}"');
        }
        if (defaultValueCode != null && parameter.$in == 'query') {
          code.writeln('}');
        }
        if (dartParameterNullable) {
          code.writeln('}');
        }
      }
      resolveMimeTypeEncode(operation, spec, state, operationId, operationParameters).forEach(code.writeln);

      for (final responseEntry in responses.entries) {
        final response = responseEntry.key;
        final statusCodes = responseEntry.value;

        TypeResult? headersType;
        if (response.headers != null) {
          final identifier =
              '${tag != null ? toDartName(tag, uppercaseFirstCharacter: true) : null}${toDartName(operationId, uppercaseFirstCharacter: true)}Headers';
          headersType = resolveObject(
            spec,
            state,
            identifier,
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

        final dataType = resolveMimeTypeDecode(
          response,
          spec,
          state,
          toDartName(
            '$operationId-response${responses.entries.length > 1 ? '-${responses.entries.toList().indexOf(responseEntry)}' : ''}',
            uppercaseFirstCharacter: true,
          ),
        );

        code.writeln(
          'final _uri = Uri(path: _path, queryParameters: _queryParameters.isNotEmpty ? _queryParameters : null);',
        );

        if (dataType != null) {
          returnDataType = dataType.name;
        }
        if (headersType != null) {
          returnHeadersType = headersType.name;
        }

        code.writeln('''
  return DynamiteRawResponse<$returnDataType, $returnHeadersType>(
    response: $client.doRequest(
      '$httpMethod',
      _uri,
      _headers,
      _body,
''');

        if (responses.values.isNotEmpty) {
          final codes = statusCodes.join(',');
          code.writeln('const {$codes},');
        }

        code.writeln('''
    ),
    bodyType: ${dataType?.fullType},
    headersType: ${headersType?.fullType},
    serializers: _jsonSerializers,
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

Iterable<String> buildPatternCheck(
  final TypeResult result,
  final openapi.Parameter parameter,
) sync* {
  final value = toDartName(parameter.name);
  final name = "'$value'";

  final schema = parameter.schema;
  if (result.name == 'String' && schema != null) {
    if (schema.pattern != null) {
      yield "checkPattern($value, RegExp(r'${schema.pattern!}'), $name); // coverage:ignore-line";
    }
    if (schema.minLength != null) {
      yield 'checkMinLength($value, ${schema.minLength}, $name); // coverage:ignore-line';
    }
    if (schema.maxLength != null) {
      yield 'checkMaxLength($value, ${schema.maxLength}, $name); // coverage:ignore-line';
    }
  }
}

Iterable<String> buildAuthCheck(
  final Map<openapi.Response, List<int>> responses,
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
    (final auth) => switch (auth) {
''';

  yield* securityRequirements.map((final requirement) {
    final securityScheme = spec.components!.securitySchemes![requirement.keys.single]!;
    final dynamiteAuth = toDartName(
      'Dynamite-${securityScheme.type}-${securityScheme.scheme}-Authentication',
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
