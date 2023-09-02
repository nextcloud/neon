import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:dynamite/src/builder/resolve_object.dart';
import 'package:dynamite/src/builder/resolve_type.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/helpers/dynamite.dart';
import 'package:dynamite/src/helpers/type_result.dart';
import 'package:dynamite/src/models/open_api.dart';
import 'package:dynamite/src/models/path_item.dart';
import 'package:dynamite/src/models/schema.dart';
import 'package:dynamite/src/type_result/type_result.dart';

List<Spec> generateDynamiteOverrides(final State state) => [
      Class(
        (final b) => b
          ..name = '${state.classPrefix}Response'
          ..types.addAll([
            refer('T'),
            refer('U'),
          ])
          ..extend = refer('DynamiteResponse<T, U>')
          ..constructors.add(
            Constructor(
              (final b) => b
                ..requiredParameters.addAll(
                  ['data', 'headers'].map(
                    (final name) => Parameter(
                      (final b) => b
                        ..name = name
                        ..toSuper = true,
                    ),
                  ),
                ),
            ),
          )
          ..methods.add(
            Method(
              (final b) => b
                ..name = 'toString'
                ..returns = refer('String')
                ..annotations.add(refer('override'))
                ..lambda = true
                ..body = Code(
                  "'${state.classPrefix}Response(data: \$data, headers: \$headers)'",
                ),
            ),
          ),
      ),
      Class(
        (final b) => b
          ..name = '${state.classPrefix}ApiException'
          ..extend = refer('DynamiteApiException')
          ..constructors.add(
            Constructor(
              (final b) => b
                ..requiredParameters.addAll(
                  ['statusCode', 'headers', 'body'].map(
                    (final name) => Parameter(
                      (final b) => b
                        ..name = name
                        ..toSuper = true,
                    ),
                  ),
                ),
            ),
          )
          ..methods.addAll([
            Method(
              (final b) => b
                ..name = 'fromResponse'
                ..returns = refer('Future<${state.classPrefix}ApiException>')
                ..static = true
                ..modifier = MethodModifier.async
                ..requiredParameters.add(
                  Parameter(
                    (final b) => b
                      ..name = 'response'
                      ..type = refer('HttpClientResponse'),
                  ),
                )
                ..body = Block.of([
                  const Code('String body;'),
                  const Code('try {'),
                  const Code('body = await response.body;'),
                  const Code('} on FormatException {'),
                  const Code("body = 'binary';"),
                  const Code('}'),
                  const Code(''),
                  Code('return ${state.classPrefix}ApiException('),
                  const Code('response.statusCode,'),
                  const Code('response.responseHeaders,'),
                  const Code('body,'),
                  const Code(');'),
                ]),
            ),
            Method(
              (final b) => b
                ..name = 'toString'
                ..returns = refer('String')
                ..annotations.add(refer('override'))
                ..lambda = true
                ..body = Code(
                  "'${state.classPrefix}ApiException(statusCode: \$statusCode, headers: \$headers, body: \$body)'",
                ),
            ),
          ]),
      ),
    ];

Iterable<Class> generateClients(
  final OpenAPI spec,
  final State state,
) sync* {
  final tags = generateTags(spec);
  yield buildRootClient(spec, state, tags);

  for (final tag in tags) {
    yield buildClient(spec, state, tags, tag);
  }
}

Class buildRootClient(
  final OpenAPI spec,
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

        b.methods.addAll(buildTags(spec, state, tags, null));
      },
    );

Class buildClient(
  final OpenAPI spec,
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

        b.methods.addAll(buildTags(spec, state, tags, tag));
      },
    );

Iterable<Method> buildTags(
  final OpenAPI spec,
  final State state,
  final List<String> tags,
  final String? tag,
) sync* {
  final isRootClient = tag == null;
  final paths = generatePaths(spec, tag);

  for (final pathEntry in paths.entries) {
    for (final operationEntry in pathEntry.value.operations.entries) {
      yield Method(
        (final b) {
          final httpMethod = operationEntry.key;
          final operation = operationEntry.value;
          final operationId = operation.operationId ?? toDartName('$httpMethod-${pathEntry.key}');
          final parameters = [
            ...?pathEntry.value.parameters,
            ...?operation.parameters,
          ]..sort(sortRequiredParameters);
          b
            ..name = toDartName(filterMethodName(operationId, tag ?? ''))
            ..modifier = MethodModifier.async
            ..docs.addAll(operation.formattedDescription);
          if (operation.deprecated ?? false) {
            b.annotations.add(refer('Deprecated').call([refer("''")]));
          }

          final acceptHeader = operation.responses?.values
                  .map((final response) => response.content?.keys)
                  .whereNotNull()
                  .expand((final element) => element)
                  .toSet()
                  .join(',') ??
              '';
          final code = StringBuffer('''
                            var _path = '${pathEntry.key}';
                            final _queryParameters = <String, dynamic>{};
                            final _headers = <String, String>{${acceptHeader.isNotEmpty ? "'Accept': '$acceptHeader'," : ''}};
                            Uint8List? _body;
                          ''');

          final security = operation.security ?? spec.security ?? [];
          final securityRequirements = security.where((final requirement) => requirement.isNotEmpty);
          final isOptionalSecurity = securityRequirements.length != security.length;
          code.write('    // coverage:ignore-start\n');
          for (final requirement in securityRequirements) {
            final securityScheme = spec.components!.securitySchemes![requirement.keys.single]!;
            code.write('''
                                if (${isRootClient ? 'this' : '_rootClient'}.authentications.where((final a) => a.type == '${securityScheme.type}' && a.scheme == '${securityScheme.scheme}').isNotEmpty) {
                                  _headers.addAll(${isRootClient ? 'this' : '_rootClient'}.authentications.singleWhere((final a) => a.type == '${securityScheme.type}' && a.scheme == '${securityScheme.scheme}').headers);
                                }
                              ''');
            if (securityRequirements.last != requirement) {
              code.write('else');
            }
          }
          if (securityRequirements.isNotEmpty && !isOptionalSecurity) {
            code.write('''
                                else {
                                  throw Exception('Missing authentication for ${securityRequirements.map((final r) => r.keys.single).join(' or ')}');
                                }
                              ''');
          }
          code.write('    // coverage:ignore-end\n');

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

            if (result.name == 'String') {
              if (parameter.schema?.pattern != null) {
                code.write('''
                                  if (!RegExp(r'${parameter.schema!.pattern!}').hasMatch(${toDartName(parameter.name)})) {
                                    throw Exception('Invalid value "\$${toDartName(parameter.name)}" for parameter "${toDartName(parameter.name)}" with pattern "\${r'${parameter.schema!.pattern!}'}"'); // coverage:ignore-line
                                  }
                                  ''');
              }
              if (parameter.schema?.minLength != null) {
                code.write('''
                                  if (${toDartName(parameter.name)}.length < ${parameter.schema!.minLength!}) {
                                    throw Exception('Parameter "${toDartName(parameter.name)}" has to be at least ${parameter.schema!.minLength!} characters long'); // coverage:ignore-line
                                  }
                                  ''');
              }
              if (parameter.schema?.maxLength != null) {
                code.write('''
                                  if (${toDartName(parameter.name)}.length > ${parameter.schema!.maxLength!}) {
                                    throw Exception('Parameter "${toDartName(parameter.name)}" has to be at most ${parameter.schema!.maxLength!} characters long'); // coverage:ignore-line
                                  }
                                  ''');
              }
            }

            final defaultValueCode = parameter.schema?.default_ != null
                ? valueToEscapedValue(result, parameter.schema!.default_.toString())
                : null;

            b.optionalParameters.add(
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
              code.write('if (${toDartName(parameter.name)} != null) {');
            }
            final value = result.encode(
              toDartName(parameter.name),
              onlyChildren: result is TypeResultList && parameter.in_ == 'query',
            );
            if (defaultValueCode != null && parameter.in_ == 'query') {
              code.write('if (${toDartName(parameter.name)} != $defaultValueCode) {');
            }
            switch (parameter.in_) {
              case 'path':
                code.write(
                  "_path = _path.replaceAll('{${parameter.name}}', Uri.encodeQueryComponent($value));",
                );
              case 'query':
                code.write(
                  "_queryParameters['${parameter.name}'] = $value;",
                );
              case 'header':
                code.write(
                  "_headers['${parameter.name}'] = $value;",
                );
              default:
                throw Exception('Can not work with parameter in "${parameter.in_}"');
            }
            if (defaultValueCode != null && parameter.in_ == 'query') {
              code.write('}');
            }
            if (dartParameterNullable) {
              code.write('}');
            }
          }

          if (operation.requestBody != null) {
            if (operation.requestBody!.content!.length > 1) {
              throw Exception('Can not work with multiple mime types right now');
            }
            for (final content in operation.requestBody!.content!.entries) {
              final mimeType = content.key;
              final mediaType = content.value;

              code.write("_headers['Content-Type'] = '$mimeType';");

              final dartParameterNullable = isDartParameterNullable(
                operation.requestBody!.required,
                mediaType.schema,
              );

              final result = resolveType(
                spec,
                state,
                toDartName('$operationId-request-$mimeType', uppercaseFirstCharacter: true),
                mediaType.schema!,
                nullable: dartParameterNullable,
              );
              final parameterName = toDartName(result.name.replaceFirst(state.classPrefix, ''));
              switch (mimeType) {
                case 'application/json':
                case 'application/x-www-form-urlencoded':
                  final dartParameterRequired = isRequired(
                    operation.requestBody!.required,
                    mediaType.schema?.default_,
                  );
                  b.optionalParameters.add(
                    Parameter(
                      (final b) => b
                        ..name = parameterName
                        ..type = refer(result.nullableName)
                        ..named = true
                        ..required = dartParameterRequired,
                    ),
                  );

                  if (dartParameterNullable) {
                    code.write('if ($parameterName != null) {');
                  }
                  code.write(
                    '_body = utf8.encode(${result.encode(parameterName, mimeType: mimeType)}) as Uint8List;',
                  );
                  if (dartParameterNullable) {
                    code.write('}');
                  }
                default:
                  throw Exception('Can not parse mime type "$mimeType"');
              }
            }
          }

          code.write(
            '''
                            final _response = await ${isRootClient ? 'this' : '_rootClient'}.doRequest(
                              '$httpMethod',
                              Uri(path: _path, queryParameters: _queryParameters.isNotEmpty ? _queryParameters : null),
                              _headers,
                              _body,
                            );
                          ''',
          );

          if (operation.responses != null) {
            if (operation.responses!.length > 1) {
              throw Exception('Can not work with multiple status codes right now');
            }
            for (final responseEntry in operation.responses!.entries) {
              final statusCode = responseEntry.key;
              final response = responseEntry.value;
              code.write('if (_response.statusCode == $statusCode) {');

              String? headersType;
              String? headersValue;
              if (response.headers != null) {
                final identifier =
                    '${tag != null ? toDartName(tag, uppercaseFirstCharacter: true) : null}${toDartName(operationId, uppercaseFirstCharacter: true)}Headers';
                final result = resolveObject(
                  spec,
                  state,
                  identifier,
                  Schema(
                    properties: response.headers!.map(
                      (final headerName, final value) => MapEntry(
                        headerName.toLowerCase(),
                        value.schema!,
                      ),
                    ),
                  ),
                  isHeader: true,
                );
                headersType = result.name;
                headersValue = result.deserialize('_response.responseHeaders');
              }

              String? dataType;
              String? dataValue;
              bool? dataNeedsAwait;
              if (response.content != null) {
                if (response.content!.length > 1) {
                  throw Exception('Can not work with multiple mime types right now');
                }
                for (final content in response.content!.entries) {
                  final mimeType = content.key;
                  final mediaType = content.value;

                  final result = resolveType(
                    spec,
                    state,
                    toDartName(
                      '$operationId-response-$statusCode-$mimeType',
                      uppercaseFirstCharacter: true,
                    ),
                    mediaType.schema!,
                  );

                  if (mimeType == '*/*' || mimeType == 'application/octet-stream' || mimeType.startsWith('image/')) {
                    dataType = 'Uint8List';
                    dataValue = '_response.bodyBytes';
                    dataNeedsAwait = true;
                  } else if (mimeType.startsWith('text/') || mimeType == 'application/javascript') {
                    dataType = 'String';
                    dataValue = '_response.body';
                    dataNeedsAwait = true;
                  } else if (mimeType == 'application/json') {
                    dataType = result.name;
                    if (result.name == 'dynamic') {
                      dataValue = '';
                    } else if (result.name == 'String') {
                      dataValue = '_response.body';
                      dataNeedsAwait = true;
                    } else if (result is TypeResultEnum || result is TypeResultBase) {
                      dataValue = result.deserialize(result.decode('await _response.body'));
                      dataNeedsAwait = false;
                    } else {
                      dataValue = result.deserialize('await _response.jsonBody');
                      dataNeedsAwait = false;
                    }
                  } else {
                    throw Exception('Can not parse mime type "$mimeType"');
                  }
                }
              }

              if (headersType != null && dataType != null) {
                b.returns = refer('Future<${state.classPrefix}Response<$dataType, $headersType>>');
                code.write(
                  'return ${state.classPrefix}Response<$dataType, $headersType>(${dataNeedsAwait ?? false ? 'await ' : ''}$dataValue, $headersValue,);',
                );
              } else if (headersType != null) {
                b.returns = refer('Future<$headersType>');
                code.write('return $headersValue;');
              } else if (dataType != null) {
                b.returns = refer('Future<$dataType>');
                code.write('return $dataValue;');
              } else {
                b.returns = refer('Future');
                code.write('return;');
              }

              code.write('}');
            }
            code.write(
              'throw await ${state.classPrefix}ApiException.fromResponse(_response); // coverage:ignore-line\n',
            );
          } else {
            b.returns = refer('Future');
          }
          b.body = Code(code.toString());
        },
      );
    }
  }
}

Map<String, PathItem> generatePaths(final OpenAPI spec, final String? tag) {
  final paths = <String, PathItem>{};

  if (spec.paths != null) {
    for (final path in spec.paths!.entries) {
      for (final operationEntry in path.value.operations.entries) {
        final operation = operationEntry.value;
        if ((operation.tags != null && operation.tags!.contains(tag)) ||
            (tag == null && (operation.tags == null || operation.tags!.isEmpty))) {
          paths[path.key] ??= PathItem(
            description: path.value.description,
            parameters: path.value.parameters,
          );
          paths[path.key] = paths[path.key]!.copyWithOperations({operationEntry.key: operation});
        }
      }
    }
  }

  return paths;
}

List<String> generateTags(final OpenAPI spec) {
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
