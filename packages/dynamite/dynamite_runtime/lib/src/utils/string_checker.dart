/// Checks the [input] against [pattern].
///
/// Throws an `Exception` containing the [parameterName] if the `pattern` does not match.
void checkPattern(final String? input, final RegExp pattern, final String parameterName) {
  if (input != null && !pattern.hasMatch(input)) {
    throw FormatException('Invalid value "$input" for parameter "$parameterName" with pattern "${pattern.pattern}"');
  }
}

/// Checks the [input] length against [minLength].
///
/// Throws an `Exception` containing the [parameterName] if the `input` is to short.
void checkMinLength(final String? input, final int minLength, final String parameterName) {
  if (input != null && input.length < minLength) {
    throw FormatException('Parameter "$input" has to be at least $minLength characters long');
  }
}

/// Checks the [input] length against [maxLength].
///
/// Throws an `Exception` containing the [parameterName] if the `input` is to long.
void checkMaxLength(final String? input, final int maxLength, final String parameterName) {
  if (input != null && input.length > maxLength) {
    throw FormatException('Parameter "$input" has to be at most $maxLength characters long');
  }
}
