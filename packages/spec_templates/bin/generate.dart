import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:spec_templates/method_parameter.dart';
import 'package:spec_templates/openapi_spec.dart';
import 'package:xml/xml.dart';

Future main(final List<String> args) async {
  final tmpDirectory = Directory(p.join(Directory.systemTemp.path, 'nextcloud-neon'));
  if (!tmpDirectory.existsSync()) {
    tmpDirectory.createSync();
  }

  final path = args[0];
  final isCore = args[1] == 'true';

  final appDirectory = Directory(p.absolute(p.normalize(path)));
  if (!appDirectory.existsSync()) {
    throw Exception('App directory $appDirectory not found');
  }
  late String infoXmlPath;
  if (isCore) {
    infoXmlPath = p.join(
      'specs',
      'templates',
      'appinfo_core.xml',
    );
  } else {
    infoXmlPath = p.join(
      appDirectory.path,
      'appinfo',
      'info.xml',
    );
  }

  final document = XmlDocument.parse(File(infoXmlPath).readAsStringSync());
  final info = document.findElements('info').toList().single;
  final id = info.findElements('id').toList().single.innerText;
  final name = info.findElements('name').toList().single.innerText;
  final summary = info.findElements('summary').toList().single.innerText;
  final version = info.findElements('version').toList().single.innerText;
  final license = info.findElements('licence').toList().single.innerText;

  late String routesPhpPath;
  if (isCore) {
    routesPhpPath = p.join(
      appDirectory.path,
      'routes.php',
    );
  } else {
    routesPhpPath = p.join(
      appDirectory.path,
      'appinfo',
      'routes.php',
    );
  }

  final routes = await _parseRoutesFile(tmpDirectory, routesPhpPath);

  final paths = <String, Path>{};

  final hasRoutes = routes.keys.contains('routes');
  final hasOCS = routes.keys.contains('ocs');
  if (!hasRoutes && !hasOCS) {
    throw Exception('One of ocs and routes is required, but only found: "${routes.keys.join('", "')}"');
  }

  final routesBasePath = '${isCore ? '' : '/apps'}/$id';
  final ocsBasePath = '/ocs/v1.php$routesBasePath';

  for (final k in routes.keys) {
    for (final route in routes[k]!) {
      final name = route['name'] as String;
      var url = route['url'] as String;
      // ignore: avoid_dynamic_calls
      final requirements = route['requirements']?.cast<String, String>() as Map<String, String>?;
      if (!url.startsWith('/')) {
        url = '/$url';
      }
      if (url.endsWith('/')) {
        url = url.substring(0, url.length - 1);
      }
      if (hasRoutes && hasOCS) {
        if (k == 'routes') {
          url = '$routesBasePath$url';
        } else if (k == 'ocs') {
          url = '$ocsBasePath$url';
        }
      }
      final verb = route['verb'] as String? ?? 'GET';

      if (name.startsWith('page#') || name.startsWith('admin#')) {
        continue;
      }

      if (verb == 'GET' && url == '/') {
        continue;
      }

      final methodName = _getMethodName(name.split('#')[1]);
      final controllerName = _getControllerName(name.split('#')[0]);
      late String controllerFilePath;
      if (isCore) {
        controllerFilePath = p.join(
          appDirectory.path,
          'Controller',
          '$controllerName.php',
        );
      } else {
        controllerFilePath = p.join(
          appDirectory.path,
          'lib',
          'Controller',
          '$controllerName.php',
        );
      }
      final controllerContent = File(controllerFilePath).readAsStringSync().replaceAll('\n', '');

      if (methodName == 'preflightedCors') {
        continue;
      }

      final reg =
          RegExp('\\/\\*\\*((?:(?!\\/\\*\\*).)*?)\\*\\/(?:(?!\\*\\/).)*?public function $methodName\\(([^\\)]*)\\)');
      final match = reg.allMatches(controllerContent).single;

      final methodParameters = _getMethodParameters(
        controllerName,
        methodName,
        match.group(2)!.split(',').map((final s) => s.trim()).where((final s) => s.isNotEmpty).toList(),
        match
            .group(1)!
            .split('*')
            .map((final s) {
              var r = s.trim();
              while (r.contains('  ')) {
                r = r.replaceAll('  ', ' ');
              }
              return r;
            })
            .where((final s) => s.isNotEmpty && s.startsWith('@param'))
            .toList(),
      );

      final operation = Operation(
        operationID: '${name.replaceAll('#', '-').toLowerCase()}-TODO',
        responses: {
          200: Response(
            description: '',
            content: {
              'application/json': MediaType(
                schema: {
                  'type': 'string',
                },
              ),
            },
          ),
        },
      );

      if (paths[url] == null) {
        final parameterNames = RegExp('{[^}]*}').allMatches(url).map((final m) {
          final t = m.group(0)!;
          return t.substring(1, t.length - 1);
        }).toList();

        final parameters = <Parameter>[];
        for (final parameterName in parameterNames) {
          MethodParameter? parameter;
          for (final methodParameter in methodParameters) {
            if (methodParameter.name == parameterName) {
              parameter = methodParameter;
              break;
            }
          }
          if (parameter == null && (requirements == null || requirements[parameterName] == null)) {
            throw Exception('Could not find parameter for $parameterName in $name');
          }
          parameters.add(
            Parameter(
              name: parameterName,
              in_: 'path',
              required: true,
              description: parameter?.description,
              schema: {
                'type': parameter?.openAPIType ?? 'TODO',
                if (parameter?.defaultValue != null) ...{
                  'default': parameter?.defaultValue,
                },
              },
            ),
          );
        }

        paths[url] = Path(
          parameters: parameters,
        );
      }
      switch (verb) {
        case 'DELETE':
          paths[url]!.delete = operation;
          break;
        case 'GET':
          paths[url]!.get = operation;
          break;
        case 'POST':
          paths[url]!.post = operation;
          break;
        case 'PUT':
          paths[url]!.put = operation;
          break;
        case 'PATCH':
          paths[url]!.patch = operation;
          break;
        case 'OPTIONS':
          paths[url]!.options = operation;
          break;
        default:
          throw Exception('Unsupported verb: $verb');
      }
    }
  }

  File(
    p.join(
      'specs',
      'templates',
      '$id.json',
    ),
  ).writeAsStringSync(
    const JsonEncoder.withIndent('  ').convert(
      Spec(
        version: '3.0.3',
        info: Info(
          title: name,
          version: version,
          description: summary,
          license: License(
            name: license,
          ),
        ),
        servers: [
          Server(
            url:
                'https://{hostname}:{port}${isCore || (hasRoutes && hasOCS) ? '' : hasOCS ? ocsBasePath : routesBasePath}',
            variables: {
              'hostname': ServerVariable(default_: 'localhost'),
              'port': ServerVariable(default_: '8080'),
            },
          )
        ],
        security: [
          {'basic_auth': []},
        ],
        components: Components(
          securitySchemes: {
            'basic_auth': SecurityScheme(
              type: 'http',
              scheme: 'basic',
            ),
          },
        ),
        paths: paths,
      ).toMap(),
    ),
  );
}

String _getControllerName(final String name) {
  final result = StringBuffer();

  final parts = name.split('');
  for (var i = 0; i < parts.length; i++) {
    var char = parts[i];
    final prevChar = i > 0 ? parts[i - 1] : null;

    if (char == '_') {
      continue;
    }
    if (i == 0 || prevChar == '_') {
      char = char.toUpperCase();
    }
    result.write(char);
  }

  result.write('Controller');

  return result.toString();
}

String _getMethodName(final String name) {
  final result = StringBuffer();

  final parts = name.split('');
  for (var i = 0; i < parts.length; i++) {
    var char = parts[i];
    final prevChar = i > 0 ? parts[i - 1] : null;

    if (char == '_') {
      continue;
    }
    if (prevChar == '_') {
      char = char.toUpperCase();
    }
    result.write(char);
  }

  return result.toString();
}

List<MethodParameter> _getMethodParameters(
  final String controllerName,
  final String methodName,
  final List<String> parameters,
  final List<String> docs,
) {
  var reg = RegExp(r'@param ((?:[a-z|\[\]]+ )?)(\$?)([a-zA-Z_]+)((?: .*)?)');
  final docMatches = <RegExpMatch>[];
  for (final doc in docs) {
    reg.allMatches(doc).forEach(docMatches.add);
  }

  final result = <MethodParameter>[];

  reg = RegExp(r'(\??)((?:[a-z-A-Z]+ )?)\$([a-zA-Z_]+)((?: = .*)?)');
  for (final parameter in parameters) {
    final match = reg.allMatches(parameter).single;
    var nullable = match.group(1)!.isNotEmpty;
    String? type = match.group(2)!.trim();
    if (type.isEmpty) {
      type = null;
    }
    final name = match.group(3)!;
    final defaultValue = match.group(4)!.replaceAll('=', '').trim();
    String? description;

    for (final doc in docMatches) {
      final docName = doc.group(3)!.trim();
      if (docName == name) {
        final docType = doc.group(1)!.trim();
        final docDescription = doc.group(4)!.trim();
        if (docDescription.isNotEmpty) {
          description = docDescription;
        }
        if (type == null && docType.isNotEmpty) {
          final parts = docType.split('|').where((final p) => p.isNotEmpty);
          if (parts.contains('null')) {
            nullable = true;
          }
          final nonNullableParts = parts.where((final p) => p != 'null');
          if (nonNullableParts.length > 1) {
            if (nonNullableParts.contains('string')) {
              // Catch all
              type = 'string';
              continue;
            }
            print(
              'WARNING: Can not determine reliable type for "$docType" for parameter "$name" of method "$methodName" in controller "$controllerName"',
            );
          } else {
            type = nonNullableParts.single;
          }
        }
      }
    }

    result.add(
      MethodParameter(
        type: type,
        nullable: nullable,
        name: name,
        defaultValue: defaultValue.isNotEmpty ? defaultValue : null,
        description: description,
        controllerName: controllerName,
        methodName: methodName,
      ),
    );
  }

  return result;
}

Future<Map<String, List<Map<String, dynamic>>>> _parseRoutesFile(
  final Directory tmpDirectory,
  final String path,
) async {
  final content = File(path).readAsStringSync();

  late String routes;
  if (content.contains('registerRoutes')) {
    routes = RegExp(r'registerRoutes\(\$this, (\[[^;]*)\);').firstMatch(content)!.group(1)!;
  } else if (content.contains('return [')) {
    routes = RegExp(r'return (\[[^;]*);').firstMatch(content)!.group(1)!;
  } else if (content.contains('return array_merge_recursive(')) {
    final includes = RegExp(r"include\(__DIR__ . '/([^']*)'\),")
        .allMatches(RegExp(r'return array_merge_recursive\(\n(.*)\n\);', dotAll: true).firstMatch(content)!.group(1)!)
        .map((final match) => match.group(1)!)
        .toList();

    final out = <String, List<Map<String, dynamic>>>{};
    for (final include in includes) {
      final routes = await _parseRoutesFile(tmpDirectory, p.join(File(path).parent.path, include));
      for (final key in routes.keys) {
        if (!out.containsKey(key)) {
          out[key] = [];
        }
        out[key]!.addAll(routes[key]!);
      }
    }

    return out;
  } else {
    throw Exception('Unsupported routes format');
  }

  final allowedVariables = [
    'requirements',
    'requirementsWithToken',
    'requirementsWithMessageId',
  ];
  final variables = RegExp('^(\\\$(${allowedVariables.join('|')}) =[^;]*;)\$', multiLine: true)
      .allMatches(content)
      .map((final match) => match.group(1)!)
      .toList();

  final phpFile = File(p.join(tmpDirectory.path, p.basename(path)));
  final jsonFile = File(p.join(tmpDirectory.path, p.basename(path).replaceAll('.php', '.json')));

  phpFile.writeAsStringSync(
    '''
<?php
${variables.join('\n')}

\$fp = fopen('${jsonFile.path}', 'w');
fwrite(\$fp, str_replace("\\/","/",json_encode($routes)));
fclose(\$fp);
?>
''',
  );
  final result = await Process.run('php', [phpFile.path]);
  if (result.exitCode != 0) {
    throw Exception('Failed to run php: ${result.stderr}');
  }

  return (json.decode(jsonFile.readAsStringSync()) as Map<String, dynamic>).map(
    (final key, final value) => MapEntry<String, List<Map<String, dynamic>>>(
      key,
      (value as List).map((final a) => a as Map<String, dynamic>).toList(),
    ),
  );
}
