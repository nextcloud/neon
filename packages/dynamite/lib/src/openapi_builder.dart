part of '../dynamite.dart';

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
      if (spec.version != '3.1.0') {
        throw Exception('Only OpenAPI 3.1.0 is supported');
      }

      final tags = <Tag?>[
        null,
        if (spec.tags != null) ...[
          ...spec.tags!,
        ],
      ];
      final hasAnySecurity = spec.security?.isNotEmpty ?? false;

      final state = State();
      final output = <String>[
        "import 'dart:convert';",
        "import 'dart:io';",
        "import 'dart:typed_data';",
        '',
        "import 'package:cookie_jar/cookie_jar.dart';",
        "import 'package:json_annotation/json_annotation.dart';",
        '',
        "export 'package:cookie_jar/cookie_jar.dart';",
        '',
        "part '${p.basename(outputId.changeExtension('.g.dart').path)}';",
        '',
        Extension(
          (final b) => b
            ..name = 'HttpClientResponseBody'
            ..on = refer('HttpClientResponse')
            ..methods.addAll([
              Method(
                (final b) => b
                  ..name = 'bodyBytes'
                  ..returns = refer('Future<Uint8List>')
                  ..type = MethodType.getter
                  ..modifier = MethodModifier.async
                  ..body = const Code(
                    '''
                  final chunks = await toList();
                  if (chunks.isEmpty) {
                    return Uint8List(0);
                  }
                  return Uint8List.fromList(chunks.reduce((final value, final element) => [...value, ...element]));
                    ''',
                  ),
              ),
              Method(
                (final b) => b
                  ..name = 'body'
                  ..returns = refer('Future<String>')
                  ..type = MethodType.getter
                  ..modifier = MethodModifier.async
                  ..lambda = true
                  ..body = const Code(
                    'utf8.decode(await bodyBytes)',
                  ),
              ),
            ]),
        ).accept(emitter).toString(),
        Class(
          (final b) => b
            ..name = 'Response'
            ..types.addAll([
              refer('T'),
              refer('U'),
            ])
            ..fields.addAll([
              Field(
                (final b) => b
                  ..name = 'data'
                  ..type = refer('T')
                  ..modifier = FieldModifier.final$,
              ),
              Field(
                (final b) => b
                  ..name = 'headers'
                  ..type = refer('U')
                  ..modifier = FieldModifier.final$,
              ),
            ])
            ..constructors.add(
              Constructor(
                (final b) => b
                  ..requiredParameters.addAll(
                    ['data', 'headers'].map(
                      (final name) => Parameter(
                        (final b) => b
                          ..name = name
                          ..toThis = true,
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
                  ..body = const Code(
                    r"'Response(data: $data, headers: $headers)'",
                  ),
              ),
            ),
        ).accept(emitter).toString(),
        Class(
          (final b) => b
            ..name = '_Response'
            ..fields.addAll([
              Field(
                (final b) => b
                  ..name = 'statusCode'
                  ..type = refer('int')
                  ..modifier = FieldModifier.final$,
              ),
              Field(
                (final b) => b
                  ..name = 'headers'
                  ..type = refer('Map<String, String>')
                  ..modifier = FieldModifier.final$,
              ),
              Field(
                (final b) => b
                  ..name = 'body'
                  ..type = refer('Uint8List')
                  ..modifier = FieldModifier.final$,
              ),
            ])
            ..constructors.add(
              Constructor(
                (final b) => b
                  ..requiredParameters.addAll(
                    ['statusCode', 'headers', 'body'].map(
                      (final name) => Parameter(
                        (final b) => b
                          ..name = name
                          ..toThis = true,
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
                  ..body = const Code(
                    r"'_Response(statusCode: $statusCode, headers: $headers, body: ${utf8.decode(body)})'",
                  ),
              ),
            ),
        ).accept(emitter).toString(),
        Class(
          (final b) => b
            ..name = 'ApiException'
            ..extend = refer('_Response')
            ..implements.add(refer('Exception'))
            ..constructors.addAll(
              [
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
                Constructor(
                  (final b) => b
                    ..name = 'fromResponse'
                    ..factory = true
                    ..lambda = true
                    ..requiredParameters.add(
                      Parameter(
                        (final b) => b
                          ..name = 'response'
                          ..type = refer('_Response'),
                      ),
                    )
                    ..body = const Code('ApiException(response.statusCode, response.headers, response.body,)'),
                ),
              ],
            )
            ..methods.add(
              Method(
                (final b) => b
                  ..name = 'toString'
                  ..returns = refer('String')
                  ..annotations.add(refer('override'))
                  ..lambda = true
                  ..body = const Code(
                    r"'ApiException(statusCode: ${super.statusCode}, headers: ${super.headers}, body: ${utf8.decode(super.body)})'",
                  ),
              ),
            ),
        ).accept(emitter).toString(),
        if (hasAnySecurity) ...[
          Class(
            (final b) => b
              ..name = 'Authentication'
              ..abstract = true
              ..methods.add(
                Method(
                  (final b) => b
                    ..name = 'headers'
                    ..type = MethodType.getter
                    ..returns = refer('Map<String, String>'),
                ),
              ),
          ).accept(emitter).toString(),
        ],
      ];

      if (spec.security != null) {
        for (final securityRequirement in spec.security!) {
          for (final name in securityRequirement.keys) {
            final securityScheme = spec.components!.securitySchemes![name]!;
            switch (securityScheme.type) {
              case 'http':
                switch (securityScheme.scheme) {
                  case 'basic':
                    output.add(
                      Class(
                        (final b) {
                          final fields = ['username', 'password'];
                          b
                            ..name = 'HttpBasicAuthentication'
                            ..extend = refer('Authentication')
                            ..constructors.add(
                              Constructor(
                                (final b) => b
                                  ..optionalParameters.addAll(
                                    fields.map(
                                      (final name) => Parameter(
                                        (final b) => b
                                          ..name = name
                                          ..toThis = true
                                          ..named = true
                                          ..required = true,
                                      ),
                                    ),
                                  ),
                              ),
                            )
                            ..fields.addAll(
                              fields.map(
                                (final name) => Field(
                                  (final b) => b
                                    ..name = name
                                    ..type = refer('String')
                                    ..modifier = FieldModifier.final$,
                                ),
                              ),
                            )
                            ..methods.add(
                              Method(
                                (final b) => b
                                  ..name = 'headers'
                                  ..type = MethodType.getter
                                  ..returns = refer('Map<String, String>')
                                  ..lambda = true
                                  ..body = const Code(r'''
                                    {
                                      'Authorization': 'Basic ${base64.encode(utf8.encode('$username:$password'))}',
                                    }
                                  '''),
                              ),
                            );
                        },
                      ).accept(emitter).toString(),
                    );
                    continue;
                }
            }
            throw Exception('Can not work with security scheme ${securityScheme.toJson()}');
          }
        }
      }

      for (final tag in tags) {
        final isRootClient = tag == null;
        final paths = <String, PathItem>{};

        if (spec.paths != null) {
          for (final path in spec.paths!.keys) {
            final pathItem = spec.paths![path]!;
            for (final method in pathItem.operations.keys) {
              final operation = pathItem.operations[method]!;
              if ((tag != null && operation.tags != null && operation.tags!.contains(tag.name)) ||
                  (tag == null && (operation.tags == null || operation.tags!.isEmpty))) {
                if (paths[path] == null) {
                  paths[path] = PathItem(
                    description: pathItem.description,
                    parameters: pathItem.parameters,
                  );
                }
                paths[path] = paths[path]!.copyWithOperations({method: operation});
              }
            }
          }
        }

        if (paths.isEmpty && !isRootClient) {
          continue;
        }

        output.add(
          Class(
            (final b) {
              if (isRootClient) {
                b
                  ..fields.addAll([
                    Field(
                      (final b) => b
                        ..name = 'baseURL'
                        ..type = refer('String')
                        ..modifier = FieldModifier.final$,
                    ),
                    Field(
                      (final b) => b
                        ..name = 'baseHeaders'
                        ..type = refer('Map<String, String>')
                        ..modifier = FieldModifier.final$
                        ..late = true,
                    ),
                    Field(
                      (final b) => b
                        ..name = 'httpClient'
                        ..type = refer('HttpClient')
                        ..modifier = FieldModifier.final$
                        ..late = true,
                    ),
                    Field(
                      (final b) => b
                        ..name = 'cookieJar'
                        ..type = refer('CookieJar?')
                        ..modifier = FieldModifier.final$,
                    ),
                    if (hasAnySecurity) ...[
                      Field(
                        (final b) => b
                          ..name = 'authentication'
                          ..type = refer('Authentication?')
                          ..modifier = FieldModifier.final$,
                      ),
                    ],
                  ])
                  ..constructors.add(
                    Constructor(
                      (final b) => b
                        ..requiredParameters.add(
                          Parameter(
                            (final b) => b
                              ..name = 'baseURL'
                              ..toThis = true,
                          ),
                        )
                        ..optionalParameters.addAll([
                          Parameter(
                            (final b) => b
                              ..name = 'baseHeaders'
                              ..type = refer('Map<String, String>?')
                              ..named = true,
                          ),
                          Parameter(
                            (final b) => b
                              ..name = 'userAgent'
                              ..type = refer('String?')
                              ..named = true,
                          ),
                          Parameter(
                            (final b) => b
                              ..name = 'httpClient'
                              ..type = refer('HttpClient?')
                              ..named = true,
                          ),
                          Parameter(
                            (final b) => b
                              ..name = 'cookieJar'
                              ..toThis = true
                              ..named = true,
                          ),
                          if (hasAnySecurity) ...[
                            Parameter(
                              (final b) => b
                                ..name = 'authentication'
                                ..toThis = true
                                ..named = true,
                            ),
                          ],
                        ])
                        ..body = Code('''
                        this.baseHeaders = {
                          if (baseHeaders != null) ...{
                            ...baseHeaders,
                          },
                        ${hasAnySecurity ? '''
                          if (authentication != null) ...{
                            ...authentication!.headers,
                          },
                        ''' : ''}
                        };
                        this.httpClient = (httpClient ?? HttpClient())..userAgent = userAgent;
                      '''),
                    ),
                  )
                  ..methods.addAll([
                    if (isRootClient) ...[
                      for (final tag in tags.where((final tag) => tag != null).toList().cast<Tag>()) ...[
                        Method(
                          (final b) => b
                            ..name = _toDartName(tag.name)
                            ..lambda = true
                            ..type = MethodType.getter
                            ..returns = refer(_clientName(tag))
                            ..body = Code('${_clientName(tag)}(this)'),
                        ),
                      ],
                    ],
                    Method(
                      (final b) => b
                        ..name = 'doRequest'
                        ..returns = refer('Future<_Response>')
                        ..modifier = MethodModifier.async
                        ..requiredParameters.addAll([
                          Parameter(
                            (final b) => b
                              ..name = 'method'
                              ..type = refer('String'),
                          ),
                          Parameter(
                            (final b) => b
                              ..name = 'path'
                              ..type = refer('String'),
                          ),
                          Parameter(
                            (final b) => b
                              ..name = 'headers'
                              ..type = refer('Map<String, String>'),
                          ),
                          Parameter(
                            (final b) => b
                              ..name = 'body'
                              ..type = refer('Uint8List?'),
                          ),
                        ])
                        ..body = const Code(r'''
                        final uri = Uri.parse('$baseURL$path');
                        final request = await httpClient.openUrl(method, uri);
                        for (final header in {...baseHeaders, ...headers}.entries) {
                          request.headers.add(header.key, header.value);
                        }
                        if (body != null) {
                          request.add(body.toList());
                        }
                        if (cookieJar != null) {
                          request.cookies.addAll(await cookieJar!.loadForRequest(uri));
                        }

                        final response = await request.close();
                        if (cookieJar != null) {
                          await cookieJar!.saveFromResponse(uri, response.cookies);
                        }
                        final responseHeaders = <String, String>{};
                        response.headers.forEach((final name, final values) {
                          responseHeaders[name] = values.last;
                        });
                        return _Response(
                          response.statusCode,
                          responseHeaders,
                          await response.bodyBytes,
                        );
                      '''),
                    ),
                  ]);
              } else {
                b
                  ..fields.add(
                    Field(
                      (final b) => b
                        ..name = 'rootClient'
                        ..type = refer('Client')
                        ..modifier = FieldModifier.final$,
                    ),
                  )
                  ..constructors.add(
                    Constructor(
                      (final b) => b.requiredParameters.add(
                        Parameter(
                          (final b) => b
                            ..name = 'rootClient'
                            ..toThis = true,
                        ),
                      ),
                    ),
                  );
              }
              b
                ..name = isRootClient ? 'Client' : _clientName(tag)
                ..methods.addAll(
                  [
                    for (final path in paths.keys) ...[
                      for (final httpMethod in paths[path]!.operations.keys) ...[
                        Method(
                          (final b) {
                            final operation = paths[path]!.operations[httpMethod]!;
                            final operationId = operation.operationId ?? _toDartName('$httpMethod-$path');
                            final pathParameters = <spec_parameter.Parameter>[
                              if (paths[path]!.parameters != null) ...paths[path]!.parameters!,
                            ];
                            final parameters = <spec_parameter.Parameter>[
                              ...pathParameters,
                              if (operation.parameters != null) ...operation.parameters!,
                            ];
                            final methodName = _toDartName(operationId);
                            b
                              ..name = methodName
                              ..modifier = MethodModifier.async;

                            final code = StringBuffer('''
                            var path = '$path';
                            final queryParameters = <String, dynamic>{};
                            final headers = <String, String>{};
                            Uint8List? body;
                          ''');

                            for (final parameter in parameters) {
                              final nullable = _isParameterNullable(
                                parameter.required,
                                parameter.schema?.default_,
                              );

                              final result = resolveType(
                                spec,
                                state,
                                _toDartName(
                                  parameter.name,
                                  uppercaseFirstCharacter: true,
                                ),
                                parameter.schema!,
                              );

                              b.optionalParameters.add(
                                Parameter(
                                  (final b) {
                                    b
                                      ..named = true
                                      ..name = _toDartName(parameter.name)
                                      ..required = parameter.required ?? false;
                                    if (parameter.schema != null) {
                                      if (parameter.schema!.default_ != null) {
                                        final value = parameter.schema!.default_!.toString();
                                        final result = resolveType(
                                          spec,
                                          state,
                                          parameter.schema!.type!,
                                          parameter.schema!,
                                        );
                                        b.defaultTo = Code(_valueToEscapedValue(result.name, value));
                                      }

                                      b.type = refer(
                                        _makeNullable(
                                          result.name,
                                          nullable,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              );

                              if (nullable) {
                                code.write('if (${_toDartName(parameter.name)} != null) {');
                              }
                              final isPlainList = result is TypeResultList && !result.fromJsonString;
                              final value = result.encode(
                                result.serialize(_toDartName(parameter.name)),
                                onlyChildren: isPlainList && parameter.in_ == 'query',
                              );
                              switch (parameter.in_) {
                                case 'path':
                                  code.write(
                                    "path = path.replaceAll('{${parameter.name}}', Uri.encodeQueryComponent($value));",
                                  );
                                  break;
                                case 'query':
                                  code.write(
                                    "queryParameters['${parameter.name}${isPlainList ? '[]' : ''}'] = $value;",
                                  );
                                  break;
                                case 'header':
                                  code.write(
                                    "headers['${parameter.name}'] = $value;",
                                  );
                                  break;
                                default:
                                  throw Exception('Can not work with parameter in "${parameter.in_}"');
                              }
                              if (nullable) {
                                code.write('}');
                              }
                            }

                            if (operation.requestBody != null) {
                              if (operation.requestBody!.content!.length > 1) {
                                throw Exception('Can not work with multiple mime types right now');
                              }
                              for (final mimeType in operation.requestBody!.content!.keys) {
                                final mediaType = operation.requestBody!.content![mimeType]!;

                                code.write("headers['Content-Type'] = '$mimeType';");

                                final result = resolveType(
                                  spec,
                                  state,
                                  _toDartName(methodName, uppercaseFirstCharacter: true),
                                  mediaType.schema!,
                                );
                                switch (mimeType) {
                                  case 'application/json':
                                    b.optionalParameters.add(
                                      Parameter(
                                        (final b) => b
                                          ..name = _toDartName(result.name)
                                          ..type = refer(result.name)
                                          ..named = true
                                          ..required = operation.requestBody!.required ?? false,
                                      ),
                                    );
                                    final nullable = _isParameterNullable(
                                      operation.requestBody!.required,
                                      mediaType.schema?.default_,
                                    );
                                    if (nullable) {
                                      code.write('if (${_toDartName(result.name)} != null) {');
                                    }
                                    code.write(
                                      'body = Uint8List.fromList(utf8.encode(${result.encode(result.serialize(_toDartName(result.name)))}));',
                                    );
                                    if (nullable) {
                                      code.write('}');
                                    }
                                    break;
                                  default:
                                    throw Exception('Can not parse mime type "$mimeType"');
                                }
                              }
                            }

                            code.write(
                              '''
                            final response = await ${isRootClient ? '' : 'rootClient.'}doRequest(
                              '$httpMethod',
                              Uri(path: path, queryParameters: queryParameters).toString(),
                              headers,
                              body,
                            );
                          ''',
                            );

                            if (operation.responses != null) {
                              if (operation.responses!.length > 1) {
                                throw Exception('Can not work with multiple status codes right now');
                              }
                              for (final statusCode in operation.responses!.keys) {
                                final response = operation.responses![statusCode]!;
                                code.write('if (response.statusCode == $statusCode) {');

                                String? headersType;
                                String? headersValue;
                                if (response.headers != null) {
                                  final identifier =
                                      '${tag != null ? _toDartName(tag.name, uppercaseFirstCharacter: true) : null}${_toDartName(operationId, uppercaseFirstCharacter: true)}Headers';
                                  final headerParseFunctions = <String, String>{};
                                  for (final headerName in response.headers!.keys) {
                                    final functionIdentifier = '_${_toDartName('${identifier}Parse$headerName')}';
                                    headerParseFunctions[headerName] = functionIdentifier;
                                    final result = resolveType(
                                      spec,
                                      state,
                                      identifier,
                                      response.headers![headerName]!.schema!,
                                    );
                                    output.add(
                                      '${result.name} $functionIdentifier(final Map data, final String key) => ${result.deserialize(result.decode('data[key]'))};',
                                    );
                                  }
                                  final result = resolveType(
                                    spec,
                                    state,
                                    identifier,
                                    Schema(
                                      type: 'object',
                                      properties: {
                                        for (final headerName in response.headers!.keys) ...{
                                          headerName.toLowerCase(): response.headers![headerName]!.schema!,
                                        },
                                      },
                                    ),
                                    extraJsonSerializableValues: {
                                      'disallowUnrecognizedKeys': 'false',
                                    },
                                    extraJsonKeyValues: {
                                      for (final headerName in response.headers!.keys) ...{
                                        headerName.toLowerCase(): {
                                          'readValue': headerParseFunctions[headerName]!,
                                        },
                                      },
                                    },
                                  );
                                  headersType = result.name;
                                  headersValue = result.deserialize('response.headers');
                                }

                                String? dataType;
                                String? dataValue;
                                if (response.content != null) {
                                  if (response.content!.length > 1) {
                                    throw Exception('Can not work with multiple mime types right now');
                                  }
                                  for (final mimeType in response.content!.keys) {
                                    final mediaType = response.content![mimeType]!;

                                    final result = resolveType(
                                      spec,
                                      state,
                                      _toDartName(methodName, uppercaseFirstCharacter: true),
                                      mediaType.schema!,
                                    );
                                    switch (mimeType) {
                                      case 'application/json':
                                        dataType = result.name;
                                        dataValue = result.deserialize(result.decode('utf8.decode(response.body)'));
                                        break;
                                      case 'image/png':
                                        dataType = 'Uint8List';
                                        dataValue = 'response.body';
                                        break;
                                      default:
                                        throw Exception('Can not parse mime type "$mimeType"');
                                    }
                                  }
                                }

                                if (headersType != null && dataType != null) {
                                  b.returns = refer('Future<Response<$dataType, $headersType>>');
                                  code.write('return Response<$dataType, $headersType>($dataValue, $headersValue,);');
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
                              code.write('throw ApiException.fromResponse(response); // coverage:ignore-line\n');
                            } else {
                              b.returns = refer('Future');
                            }
                            b.body = Code(code.toString());
                          },
                        ),
                      ],
                    ],
                  ],
                );
            },
          ).accept(emitter).toString(),
        );
      }

      if (spec.components?.schemas != null) {
        for (final name in spec.components!.schemas!.keys) {
          final schema = spec.components!.schemas![name]!;

          final identifier = _toDartName(name, uppercaseFirstCharacter: true);
          if (schema.type == null && schema.ref == null && schema.ofs == null) {
            output.add('typedef $identifier = dynamic;');
          } else {
            final result = resolveType(
              spec,
              state,
              identifier,
              schema,
            );
            if (result is TypeResultBase) {
              output.add('typedef $identifier = ${result.name};');
            }
          }
        }
      }

      output.addAll(state.output.map((final e) => e.accept(emitter).toString()));

      if (state.registeredJsonObjects.isNotEmpty) {
        output.addAll([
          '// coverage:ignore-start',
          'final _deserializers = <Type, dynamic Function(dynamic)>{',
          for (final name in state.registeredJsonObjects) ...[
            '$name: (final data) => ${TypeResultObject(name).deserialize('data')},',
            'List<$name>: (final data) => ${TypeResultList('List<$name>', TypeResultObject(name)).deserialize('data')},',
          ],
          '};',
          '',
          'final _serializers = <Type, dynamic Function(dynamic)>{',
          for (final name in state.registeredJsonObjects) ...[
            '$name: (final data) => ${TypeResultObject(name).serialize('data')},',
            'List<$name>: (final data) => ${TypeResultList('List<$name>', TypeResultObject(name)).serialize('data')},',
          ],
          '};',
          '',
          'T deserialize<T>(final dynamic data) => _deserializers[T]!(data) as T;',
          '',
          'dynamic serialize<T>(final T data) => _serializers[T]!(data);',
          '// coverage:ignore-end',
        ]);
      }

      final formatter = DartFormatter(
        pageWidth: 120,
      );
      await buildStep.writeAsString(
        outputId,
        formatter.format(
          output
              .join('\n')
              .replaceAll(
                'Map<String, dynamic> toJson()',
                '  // coverage:ignore-start\nMap<String, dynamic> toJson()',
              )
              .replaceAll(
                'ToJson(this);',
                'ToJson(this);\n  // coverage:ignore-end\n',
              )
              .replaceAll(
                'dynamic toJson() => _data;',
                '  // coverage:ignore-start\ndynamic toJson() => _data;\n  // coverage:ignore-end\n',
              ),
        ),
      );
    } catch (e, s) {
      print(s);

      rethrow;
    }
  }
}

String _clientName(final Tag tag) => '${_toDartName(tag.name, uppercaseFirstCharacter: true)}Client';

String _toDartName(
  final String input, {
  final bool uppercaseFirstCharacter = false,
}) {
  final result = StringBuffer();

  final parts = input.split('');
  for (var i = 0; i < parts.length; i++) {
    var char = parts[i];
    final prevChar = i > 0 ? parts[i - 1] : null;
    if (_isNonAlphaNumericString(char)) {
      continue;
    }
    if (prevChar != null && _isNonAlphaNumericString(prevChar)) {
      char = char.toUpperCase();
    }
    if (i == 0) {
      if (uppercaseFirstCharacter) {
        char = char.toUpperCase();
      } else {
        char = char.toLowerCase();
      }
    }
    result.write(char);
  }

  final out = result.toString();
  if (_dartKeywords.contains(out) || RegExp(r'^[0-9]+$', multiLine: true).hasMatch(out)) {
    return '\$$out';
  }

  return out;
}

final _dartKeywords = [
  'assert',
  'break',
  'case',
  'catch',
  'class',
  'const',
  'continue',
  'default',
  'do',
  'else',
  'enum',
  'extends',
  'false',
  'final',
  'finally',
  'for',
  'if',
  'in',
  'is',
  'new',
  'null',
  'rethrow',
  'return',
  'super',
  'switch',
  'this',
  'throw',
  'true',
  'try',
  'var',
  'void',
  'while',
  'with',
  'async',
  'hide',
  'on',
  'show',
  'sync',
  'abstract',
  'as',
  'covariant',
  'deferred',
  'dynamic',
  'export',
  'extension',
  'external',
  'factory',
  'function',
  'get',
  'implements',
  'import',
  'interface',
  'library',
  'mixin',
  'operator',
  'part',
  'set',
  'static',
  'typedef',
];

bool _isNonAlphaNumericString(final String input) => !RegExp(r'^[a-zA-Z0-9]$').hasMatch(input);

String _makeNullable(final String type, final bool nullable) => nullable && type != 'dynamic' ? '$type?' : type;

String _toFieldName(final String dartName, final String type) => dartName == type ? '\$$dartName' : dartName;

bool _isParameterNullable(final bool? required, final dynamic default_) => !(required ?? false) && default_ == null;

String _valueToEscapedValue(final String type, final dynamic value) => type == 'String' ? "'$value'" : value.toString();

class State {
  final resolvedTypes = <String>[];
  final registeredJsonObjects = <String>[];
  final output = <Spec>[];
}

TypeResult resolveObject(
  final OpenAPI spec,
  final State state,
  final String identifier,
  final Schema schema, {
  required final Map<String, String>? extraJsonSerializableValues,
  required final Map<String, Map<String, String>>? extraJsonKeyValues,
  final bool fromJsonString = false,
}) {
  if (!state.resolvedTypes.contains(identifier)) {
    state.resolvedTypes.add(identifier);
    state.registeredJsonObjects.add(identifier);
    state.output.add(
      Class(
        (final b) {
          b
            ..name = identifier
            ..docs.addAll([
              if (schema.description != null && schema.description!.isNotEmpty) ...[
                '/// ${schema.description!}',
              ],
            ])
            ..annotations.add(
              refer('JsonSerializable').call(
                [],
                {
                  if (schema.additionalProperties ?? false) ...{
                    'disallowUnrecognizedKeys': refer('false'),
                  },
                  if (extraJsonSerializableValues != null) ...{
                    for (final key in extraJsonSerializableValues.keys) ...{
                      key: refer(extraJsonSerializableValues[key]!),
                    },
                  },
                },
              ),
            )
            ..constructors.addAll(
              [
                Constructor(
                  (final b) => b
                    ..optionalParameters.addAll(
                      schema.properties!.keys.map(
                        (final propertyName) => Parameter(
                          (final b) {
                            final propertySchema = schema.properties![propertyName]!;
                            b
                              ..name = _toDartName(propertyName)
                              ..toThis = true
                              ..named = true
                              ..required =
                                  (schema.required ?? []).contains(propertyName) && propertySchema.default_ == null;
                            if (propertySchema.default_ != null) {
                              final value = propertySchema.default_!.toString();
                              final result = resolveType(
                                spec,
                                state,
                                propertySchema.type!,
                                propertySchema,
                              );
                              b.defaultTo = Code(_valueToEscapedValue(result.name, value));
                            }
                          },
                        ),
                      ),
                    ),
                ),
                Constructor(
                  (final b) => b
                    ..factory = true
                    ..name = 'fromJson'
                    ..lambda = true
                    ..requiredParameters.add(
                      Parameter(
                        (final b) => b
                          ..name = 'json'
                          ..type = refer('Map<String, dynamic>'),
                      ),
                    )
                    ..body = Code('_\$${identifier}FromJson(json)'),
                ),
                Constructor(
                  (final b) => b
                    ..factory = true
                    ..name = 'fromJsonString'
                    ..lambda = true
                    ..requiredParameters.add(
                      Parameter(
                        (final b) => b
                          ..name = 'data'
                          ..type = refer('String'),
                      ),
                    )
                    ..body = Code('$identifier.fromJson(json.decode(data) as Map<String, dynamic>)'),
                ),
              ],
            )
            ..methods.addAll([
              Method(
                (final b) => b
                  ..name = 'toJson'
                  ..returns = refer('Map<String, dynamic>')
                  ..lambda = true
                  ..body = Code('_\$${identifier}ToJson(this)'),
              ),
              Method(
                (final b) => b
                  ..name = 'toJsonString'
                  ..returns = refer('String')
                  ..lambda = true
                  ..static = true
                  ..requiredParameters.add(
                    Parameter(
                      (final b) => b
                        ..name = 'data'
                        ..type = refer(identifier),
                    ),
                  )
                  ..body = const Code('json.encode(data.toJson())'),
              ),
            ])
            ..fields.addAll([
              for (final propertyName in schema.properties!.keys) ...[
                Field(
                  (final b) {
                    final propertySchema = schema.properties![propertyName]!;
                    final result = resolveType(
                      spec,
                      state,
                      '${identifier}_${_toDartName(propertyName, uppercaseFirstCharacter: true)}',
                      propertySchema,
                      extraJsonSerializableValues: extraJsonSerializableValues,
                    );

                    b
                      ..name = _toDartName(propertyName)
                      ..type = refer(
                        _makeNullable(
                          result.name,
                          !(schema.required ?? []).contains(propertyName),
                        ),
                      )
                      ..modifier = FieldModifier.final$
                      ..docs.addAll([
                        if (propertySchema.description != null && propertySchema.description!.isNotEmpty) ...[
                          '/// ${propertySchema.description!}',
                        ],
                      ]);
                    if (_toDartName(propertyName) != propertyName ||
                        propertySchema.isJsonString ||
                        extraJsonKeyValues != null) {
                      b.annotations.add(
                        refer('JsonKey').call(
                          [],
                          {
                            if (_toDartName(propertyName) != propertyName) ...{
                              'name': refer("'$propertyName'"),
                            },
                            if (propertySchema.isJsonString) ...{
                              'fromJson': refer('${result.name}.fromJsonString'),
                              'toJson': refer('${result.name}.toJsonString'),
                            },
                            if (extraJsonKeyValues != null && extraJsonKeyValues.containsKey(propertyName)) ...{
                              for (final key in extraJsonKeyValues[propertyName]!.keys) ...{
                                key: refer(extraJsonKeyValues[propertyName]![key]!),
                              },
                            },
                          },
                        ),
                      );
                    }
                  },
                )
              ],
            ]);
        },
      ),
    );
  }
  return TypeResultObject(
    identifier,
    fromJsonString: fromJsonString,
  );
}

TypeResult resolveType(
  final OpenAPI spec,
  final State state,
  final String identifier,
  final Schema schema, {
  final Map<String, String>? extraJsonSerializableValues,
  final Map<String, Map<String, String>>? extraJsonKeyValues,
  final bool ignoreEnum = false,
  final bool fromJsonString = false,
}) {
  TypeResult? result;
  if (schema.ref != null) {
    final name = schema.ref!.split('/').last;
    result = resolveType(
      spec,
      state,
      name,
      spec.components!.schemas![name]!,
      extraJsonSerializableValues: extraJsonSerializableValues,
      fromJsonString: fromJsonString,
    );
  } else if (schema.ofs != null) {
    if (!state.resolvedTypes.contains(identifier)) {
      state.resolvedTypes.add(identifier);
      final results = schema.ofs!
          .map(
            (final s) => resolveType(
              spec,
              state,
              '$identifier${schema.ofs!.indexOf(s)}',
              s,
              extraJsonSerializableValues: extraJsonSerializableValues,
            ),
          )
          .toList();
      state.output.add(
        Class(
          (final b) {
            final fields = <String, String>{};
            for (final result in results) {
              final dartName = _toDartName(result.name);
              fields[result.name] = _toFieldName(dartName, result.name);
            }

            b
              ..name = identifier
              ..fields.addAll([
                Field(
                  (final b) {
                    b
                      ..name = '_data'
                      ..type = refer('dynamic')
                      ..modifier = FieldModifier.final$;
                  },
                ),
                for (final result in results) ...[
                  Field(
                    (final b) {
                      final s = schema.ofs![results.indexOf(result)];
                      b
                        ..name = fields[result.name]!
                        ..type = refer(_makeNullable(result.name, true))
                        ..modifier = FieldModifier.final$
                        ..docs.addAll([
                          if (s.description != null && s.description!.isNotEmpty) ...[
                            '/// ${s.description!}',
                          ],
                        ]);
                    },
                  ),
                ],
              ])
              ..constructors.addAll([
                Constructor(
                  (final b) => b
                    ..requiredParameters.add(
                      Parameter(
                        (final b) => b
                          ..name = '_data'
                          ..toThis = true,
                      ),
                    )
                    ..optionalParameters.addAll([
                      for (final result in results) ...[
                        Parameter(
                          (final b) => b
                            ..name = fields[result.name]!
                            ..toThis = true
                            ..named = true,
                        ),
                      ],
                    ]),
                ),
                Constructor(
                  (final b) {
                    b
                      ..factory = true
                      ..name = 'fromJson'
                      ..requiredParameters.add(
                        Parameter(
                          (final b) => b
                            ..name = 'data'
                            ..type = refer('dynamic'),
                        ),
                      )
                      ..body = Code(
                        <String>[
                          for (final result in results) ...[
                            '${result.name}? ${fields[result.name]!};',
                          ],
                          for (final result in results) ...[
                            if (schema.discriminator != null) ...[
                              "if (data['${schema.discriminator!.propertyName}'] == '${result.name}'",
                              if (schema.discriminator!.mapping != null &&
                                  schema.discriminator!.mapping!.isNotEmpty) ...[
                                for (final key in schema.discriminator!.mapping!.entries
                                    .where((final entry) => entry.value.endsWith('/${result.name}'))
                                    .map((final entry) => entry.key)) ...[
                                  " ||  data['${schema.discriminator!.propertyName}'] == '$key'",
                                ],
                              ],
                              ') {',
                            ],
                            'try {',
                            '${fields[result.name]!} = ${result.deserialize('data')};',
                            '} catch (_) {',
                            if (schema.discriminator != null) ...[
                              'rethrow;',
                            ],
                            '}',
                            if (schema.discriminator != null) ...[
                              '}',
                            ],
                          ],
                          if (schema.oneOf != null) ...[
                            "assert([${fields.values.join(',')}].where((final x) => x != null).length == 1, 'Need oneOf for \$data');",
                          ],
                          if (schema.allOf != null) ...[
                            "assert([${fields.values.join(',')}].where((final x) => x != null).length == ${fields.length}, 'Need allOf for \$data');",
                          ],
                          'return $identifier(',
                          'data,',
                          for (final result in results) ...[
                            '${fields[result.name]!}: ${fields[result.name]!},',
                          ],
                          ');',
                        ].join(),
                      );
                  },
                ),
                Constructor(
                  (final b) {
                    b
                      ..factory = true
                      ..lambda = true
                      ..name = 'fromJsonString'
                      ..requiredParameters.add(
                        Parameter(
                          (final b) => b
                            ..name = 'data'
                            ..type = refer('String'),
                        ),
                      )
                      ..body = Code('$identifier.fromJson(json.decode(data))');
                  },
                ),
              ])
              ..methods.addAll([
                Method(
                  (final b) => b
                    ..name = 'toJson'
                    ..returns = refer('dynamic')
                    ..lambda = true
                    ..body = const Code('_data'),
                ),
                Method(
                  (final b) => b
                    ..name = 'toJsonString'
                    ..returns = refer('String')
                    ..lambda = true
                    ..static = true
                    ..requiredParameters.add(
                      Parameter(
                        (final b) => b
                          ..name = 'data'
                          ..type = refer('dynamic'),
                      ),
                    )
                    ..body = const Code('json.encode(data)'),
                ),
              ]);
          },
        ),
      );
    }

    result = TypeResultObject(identifier);
  } else {
    switch (schema.type) {
      case 'boolean':
        result = TypeResultBase('bool');
        break;
      case 'integer':
        result = TypeResultBase('int');
        break;
      case 'number':
        result = TypeResultBase('num');
        break;
      case 'string':
        switch (schema.format) {
          case 'binary':
            result = TypeResultBase('Uint8List');
            break;
        }

        if (schema.isJsonString) {
          result = resolveType(
            spec,
            state,
            identifier,
            schema.contentSchema!,
            extraJsonSerializableValues: extraJsonSerializableValues,
            fromJsonString: true,
          );
          break;
        }

        result = TypeResultBase(
          'String',
        );
        break;
      case 'array':
        if (schema.items != null) {
          final subResult = resolveType(
            spec,
            state,
            identifier,
            schema.items!,
            extraJsonSerializableValues: extraJsonSerializableValues,
          );
          result = TypeResultList(
            'List<${subResult.name}>',
            subResult,
            fromJsonString: fromJsonString,
          );
        } else {
          result = TypeResultList(
            'List',
            TypeResultBase('dynamic'),
          );
        }
        break;
      case 'object':
        if (schema.properties == null) {
          result = TypeResultBase('dynamic');
          break;
        }
        if (schema.properties!.isEmpty) {
          result = TypeResultMap(
            'Map<String, dynamic>',
            TypeResultBase('dynamic'),
          );
          break;
        }

        result = resolveObject(
          spec,
          state,
          identifier,
          schema,
          extraJsonSerializableValues: extraJsonSerializableValues,
          extraJsonKeyValues: extraJsonKeyValues,
          fromJsonString: fromJsonString,
        );
        break;
    }
  }

  if (result != null) {
    if (!ignoreEnum && schema.enum_ != null) {
      if (!state.resolvedTypes.contains(identifier)) {
        state.resolvedTypes.add(identifier);
        state.output.add(
          Enum(
            (final b) => b
              ..name = identifier
              ..constructors.add(
                Constructor(
                  (final b) => b
                    ..constant = true
                    ..requiredParameters.add(
                      Parameter(
                        (final b) => b
                          ..name = 'value'
                          ..toThis = true,
                      ),
                    ),
                ),
              )
              ..fields.add(
                Field(
                  (final b) => b
                    ..name = 'value'
                    ..type = refer(result!.name)
                    ..modifier = FieldModifier.final$,
                ),
              )
              ..values.addAll(
                schema.enum_!.map(
                  (final value) => EnumValue(
                    (final b) {
                      final result = resolveType(
                        spec,
                        state,
                        '$identifier${_toDartName(value.toString(), uppercaseFirstCharacter: true)}',
                        schema,
                        ignoreEnum: true,
                        extraJsonSerializableValues: extraJsonSerializableValues,
                      );
                      b
                        ..name = _toDartName(value.toString())
                        ..arguments.add(
                          refer(_valueToEscapedValue(result.name, value)),
                        );
                      if (_toDartName(value.toString()) != value.toString()) {
                        if (result.name != 'String' && result.name != 'int') {
                          throw Exception(
                            'Sorry enum values are a bit broken. '
                            'See https://github.com/google/json_serializable.dart/issues/616. '
                            'Please remove the enum values on $identifier.',
                          );
                        }
                        b.annotations.add(
                          refer('JsonValue').call([
                            refer(_valueToEscapedValue(result.name, value.toString())),
                          ]),
                        );
                      }
                    },
                  ),
                ),
              )
              ..methods.add(
                Method(
                  (final b) => b
                    ..name = 'fromValue'
                    ..static = true
                    ..returns = refer(identifier)
                    ..requiredParameters.add(
                      Parameter(
                        (final b) => b
                          ..name = 'value'
                          ..type = refer(result!.name),
                      ),
                    )
                    ..body = Code(
                      [
                        'switch (value) {',
                        for (final value in schema.enum_!) ...[
                          'case ${_valueToEscapedValue(result!.name, value)}:',
                          'return $identifier.${_toDartName(value.toString())};',
                        ],
                        'default:',
                        'throw Exception(\'Can not parse UserStatusClearAtTime0 from "\$value"\');',
                        '}',
                      ].join(),
                    ),
                ),
              ),
          ),
        );
      }
      result = TypeResultEnum(identifier, result);
    }

    return result;
  }

  throw Exception('Can not convert OpenAPI type "${schema.toJson()}" to a Dart type');
}
