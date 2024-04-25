/// Checks the [length] length against [minItems].
///
/// Throws an `Exception` containing the [parameterName] if the `length` is too short.
void checkMinItems(int? length, int minItems, String parameterName) {
  if (length != null && length < minItems) {
    throw FormatException('Parameter "$parameterName" has to be at least $minItems items long but was $length long');
  }
}

/// Checks the [length] length against [maxItems].
///
/// Throws an `Exception` containing the [parameterName] if the `length` is too long.
void checkMaxItems(int? length, int maxItems, String parameterName) {
  if (length != null && length > maxItems) {
    throw FormatException('Parameter "$parameterName" has to be at most $maxItems items long but was $length long');
  }
}
