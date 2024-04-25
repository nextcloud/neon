import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';

/// Checks the [input] against the given String validators.
///
/// Throws an `FormatException` when the input is not:
/// * matching the given [pattern].
/// * longer than [minLength].
/// * shorter than [maxLength].
void checkString(
  dynamic input,
  String parameterName, {
  int? maxLength,
  int? minLength,
  RegExp? pattern,
}) {
  String value;
  if (input is JsonObject && input.isString) {
    value = input.asString;
  } else if (input is String) {
    value = input;
  } else {
    return;
  }

  if (pattern != null && !pattern.hasMatch(value)) {
    throw FormatException('Invalid value "$input" for parameter "$parameterName" with pattern "${pattern.pattern}"');
  }

  if (minLength != null && value.length < minLength) {
    throw FormatException(
      'Parameter "$parameterName" has to be at least $minLength characters long but was ${value.length} long',
    );
  }

  if (maxLength != null && value.length > maxLength) {
    throw FormatException(
      'Parameter "$parameterName" has to be at most $maxLength characters long but was ${value.length} long',
    );
  }
}

/// Checks the [input] against the given Iterable validators.
///
/// Throws an `FormatException` when the input is not:
/// * longer than [maxItems].
/// * shorter than [minItems].
/// * containing only [uniqueItems].
///   If the input is a [Set] or [BuiltSet] this validation is skipped.
void checkIterable(
  dynamic input,
  String parameterName, {
  int? maxItems,
  int? minItems,
  bool uniqueItems = false,
}) {
  switch (input) {
    case ListJsonObject():
    case ListBuilder():
    case SetBuilder():
    case Iterable():
      break;
    default:
      return;
  }

  late final length = switch (input) {
    SetBuilder() => input.length,
    ListBuilder() => input.length,
    ListJsonObject() => input.value.length,
    Iterable() => input.length,
    _ => throw StateError('Type does not have a length'),
  };

  if (minItems != null && length < minItems) {
    throw FormatException('Parameter "$parameterName" has to be at least $minItems items long but was $length long');
  }

  if (maxItems != null && length > maxItems) {
    throw FormatException('Parameter "$parameterName" has to be at most $maxItems items long but was $length long');
  }

  late final value = switch (input) {
    // A set only contains unique items. We can thus skip this check.
    BuiltSet() || SetBuilder() || Set() => null,
    ListBuilder() => input.build().toSet(),
    ListJsonObject() => input.value.toSet(),
    Iterable() => input.toSet(),
    _ => throw StateError('Type does not behave like an iterable'),
  };

  if (uniqueItems && value != null) {
    if (length != value.length) {
      throw FormatException('Parameter "$parameterName" has to only contain unique items');
    }
  }
}
