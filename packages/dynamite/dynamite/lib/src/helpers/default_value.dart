import 'dart:convert';

import 'package:built_value/json_object.dart';

/// Encodes the given value to be used for generation.
///
/// When [constant] is true object and array definitions will be prefixed with `const`.
String? encodeDefault(JsonObject? $default, {bool constant = true}) {
  if ($default == null) {
    return null;
  }

  var value = jsonEncode($default.value);
  if (constant && ($default.isMap || $default.isList)) {
    value = 'const $value';
  }

  return value;
}
