/// Converts the provided [name] into a `lowerCamelCase` alphanumerical
/// representation.
///
/// If the resulting name is reserved by dart or only contains numbers it is
/// prefixed with a `$`.
/// Specify [className] to return a `UpperCamelCase` name.
///
/// The optional [identifier] will be prefixed and separated by an `_` if
/// provided. The reserved name check will be made against the resulting
/// string. The identifier itself is not checked to be a valid dart name, nor
/// will `className` have any affect.
///
/// ```dart
/// print(toDartName(
///   'test-variable-name',
/// )); // testVariableName
///
/// print(toDartName(
///   'test-variable-name',
///   className: true,
/// )); // TestVariableName
///
/// print(toDartName(
///   '10',
/// )); // $10
///
/// print(toDartName(
///   'String',
/// )); // string
///
/// print(toDartName(
///   'String',
///   className: true,
/// )); // $String
///
/// print(toDartName(
///   'string',
///   identifier: 'Identifier'
/// )); // Identifier_String
///
/// print(toDartName(
///   'string',
///   identifier: 'Identifier'
///   className: false,
/// )); // Identifier_String
/// ```
String toDartName(
  String name, {
  String? identifier,
  bool className = false,
}) {
  final capitalize = identifier != null || className;

  var result = '';
  var upperCase = capitalize;
  var firstCharacter = !capitalize;
  for (final char in name.split('')) {
    if (_isNonAlphaNumericString(char)) {
      upperCase = true;
    } else {
      result += firstCharacter ? char.toLowerCase() : (upperCase ? char.toUpperCase() : char);
      upperCase = false;
      firstCharacter = false;
    }
  }

  if (identifier != null) {
    return '${identifier}_$result';
  }

  if (_reservedNames.contains(result) || RegExp(r'^[0-9]+$', multiLine: true).hasMatch(result)) {
    return '\$$result';
  }

  return result;
}

/// Helper methods to work with strings.
extension StringUtils on String {
  /// Capitalizes this string.
  ///
  /// ```dart
  /// ''.capitalize(); // ''
  /// '   '.capitalize(); // ''
  /// 'testValue'.capitalize(); // 'TestValue'
  /// 'TestValue'.capitalize(); // 'TestValue'
  ///
  /// ```
  String capitalize() {
    final trimmed = trimLeft();

    if (trimmed.isEmpty) {
      return this;
    }

    final capitalChar = trimmed[0].toUpperCase();
    return trimmed.replaceRange(0, 1, capitalChar);
  }
}

/// A list of dart keywords and type names that need to be escaped.
const _reservedNames = [
  'abstract',
  'as',
  'assert',
  'async',
  'bool',
  'break',
  'case',
  'catch',
  'class',
  'const',
  'continue',
  'covariant',
  'default',
  'deferred',
  'do',
  'double',
  'dynamic',
  'else',
  'enum',
  'export',
  'extends',
  'extension',
  'external',
  'factory',
  'false',
  'final',
  'finally',
  'for',
  'function',
  'get',
  'hide',
  'if',
  'implements',
  'import',
  'in',
  'int',
  'interface',
  'is',
  'library',
  'List',
  'Map',
  'mixin',
  'new',
  'null',
  'num',
  'Object',
  'on',
  'operator',
  'part',
  'RegExp',
  'rethrow',
  'return',
  'set',
  'show',
  'static',
  'String',
  'super',
  'switch',
  'sync',
  'this',
  'throw',
  'true',
  'try',
  'typedef',
  'Uint8List',
  'Uri',
  'var',
  'void',
  'while',
  'with',
];

bool _isNonAlphaNumericString(String input) => !RegExp(r'^[a-zA-Z0-9]$').hasMatch(input);

String toFieldName(String dartName, String type) => dartName == type ? '\$$dartName' : dartName;

String toCamelCase(String name) {
  var result = '';
  var upperCase = false;
  var firstCharacter = true;
  for (final char in name.split('')) {
    if (char == '_') {
      upperCase = true;
    } else if (char == r'$') {
      result += r'$';
    } else {
      result += firstCharacter ? char.toLowerCase() : (upperCase ? char.toUpperCase() : char);
      upperCase = false;
      firstCharacter = false;
    }
  }
  return result;
}
