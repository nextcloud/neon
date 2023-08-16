import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:yaml/yaml.dart';

/// Disabled rules.
///
/// These rules will be added but disabled.
const disabledRules = [
  'always_specify_types',
  'avoid_annotating_with_dynamic',
  'avoid_as',
  'avoid_catches_without_on_clauses',
  'avoid_catching_errors',
  'avoid_classes_with_only_static_members',
  'avoid_final_parameters',
  'avoid_print',
  'diagnostic_describe_all_properties',
  'lines_longer_than_80_chars',
  'no_default_cases',
  'one_member_abstracts',
  'prefer_double_quotes',
  'prefer_relative_imports',
  'unnecessary_final',
];

/// Rules that won't be added to the list.
///
/// This is needed for rules not yet available in the current dart version.
const excludedRules = [
  'no_self_assignments',
  'no_wildcard_variable_uses',
];

/// Commit hash to use to fetch the rules from upstream
const commitHash = '7f40f11';

Future main() async {
  final uri = Uri.parse('https://raw.githubusercontent.com/dart-lang/linter/$commitHash/example/all.yaml');
  final result = await http.get(uri);
  final document = loadYaml(result.body) as YamlMap;
  final rules = (document['linter'] as YamlMap)['rules'] as YamlList;

  final buffer = StringBuffer('''
analyzer:
  language:
    strict-casts: true
  errors:
    flutter_style_todos: ignore
    todo: ignore
  exclude:
    - "**.g.dart"
    - "**.mocks.dart"
linter:
  rules:
''');

  for (final line in rules) {
    final excluded = excludedRules.contains(line);
    if (!excluded) {
      final disabled = disabledRules.contains(line);
      buffer.writeln('    $line: ${!disabled}');
    }
  }

  File('lib/dart.yaml').writeAsStringSync(buffer.toString());
}
