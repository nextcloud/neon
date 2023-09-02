import 'package:dynamite/src/helpers/dart_helpers.dart';
import 'package:dynamite/src/type_result/type_result.dart';

String valueToEscapedValue(final TypeResult result, final dynamic value) {
  if (result is TypeResultBase && result.name == 'String') {
    return "'$value'";
  }
  if (result is TypeResultList) {
    return 'const $value';
  }
  if (result is TypeResultEnum) {
    return '${result.name}.${toDartName(value.toString())}';
  }
  return value.toString();
}
