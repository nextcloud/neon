import 'package:built_value/json_object.dart';
import 'package:dynamite_runtime/src/utils/json_schema_validation.dart';
import 'package:test/test.dart';

void main() {
  group('Json Schema Validation', () {
    test('String', () {
      checkString(true, 'value', pattern: RegExp(r'^[0-9]*$'), maxLength: 0, minLength: 0);
      checkString(null, 'value', pattern: RegExp(r'^[0-9]*$'), maxLength: 0, minLength: 0);
      checkString(JsonObject(''), 'value', pattern: RegExp(r'^[0-9]*$'), maxLength: 0, minLength: 0);

      expect(
        () => checkString('true', 'value', pattern: RegExp(r'^[0-9]*$')),
        throwsA(isA<FormatException>()),
      );
      expect(
        () => checkString('true', 'value', maxLength: 3),
        throwsA(isA<FormatException>()),
      );
      expect(
        () => checkString('true', 'value', minLength: 5),
        throwsA(isA<FormatException>()),
      );
    });

    test('Iterable', () {
      checkIterable(true, 'value', maxItems: 0, minItems: 0, uniqueItems: true);
      checkIterable(null, 'value', maxItems: 0, minItems: 0, uniqueItems: true);
      checkIterable(JsonObject([]), 'value', maxItems: 0, minItems: 0, uniqueItems: true);

      expect(
        () => checkIterable(['value'], 'value', maxItems: 0),
        throwsA(isA<FormatException>()),
      );
      expect(
        () => checkIterable(['value'], 'value', minItems: 3),
        throwsA(isA<FormatException>()),
      );
      expect(
        () => checkIterable(['value', 'value'], 'value', uniqueItems: true),
        throwsA(isA<FormatException>()),
      );
    });
  });
}
