/// Checks the [input] against [pattern].
///
/// Throws an `Exception` containing the [parameterName] if the `pattern` does not match.
void checkPattern(String? input, RegExp pattern, String parameterName) {
  if (input != null && !pattern.hasMatch(input)) {
    throw FormatException('Invalid value "$input" for parameter "$parameterName" with pattern "${pattern.pattern}"');
  }
}

/// Checks the [input] length against [minLength].
///
/// Throws an `Exception` containing the [parameterName] if the `input` is too short.
void checkMinLength(String? input, int minLength, String parameterName) {
  if (input != null && input.length < minLength) {
    throw FormatException(
      'Parameter "$parameterName" has to be at least $minLength characters long but was ${input.length} long',
    );
  }
}

/// Checks the [input] length against [maxLength].
///
/// Throws an `Exception` containing the [parameterName] if the `input` is too long.
void checkMaxLength(String? input, int maxLength, String parameterName) {
  if (input != null && input.length > maxLength) {
    throw FormatException(
      'Parameter "$parameterName" has to be at most $maxLength characters long but was ${input.length} long',
    );
  }
}
