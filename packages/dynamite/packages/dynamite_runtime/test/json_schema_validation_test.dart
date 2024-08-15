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

    test('Number', () {
      checkNumber(true, 'value', multipleOf: 1, maximum: 0, exclusiveMaximum: 0, minimum: 0, exclusiveMinimum: 0);
      checkNumber(null, 'value', multipleOf: 1, maximum: 0, exclusiveMaximum: 0, minimum: 0, exclusiveMinimum: 0);
      checkNumber(
        JsonObject(0),
        'value',
        multipleOf: 1,
        maximum: 0,
        exclusiveMaximum: 1,
        minimum: 0,
        exclusiveMinimum: -1,
      );

      expect(
        () => checkNumber(1.5, 'value', multipleOf: 1),
        throwsA(isA<FormatException>()),
      );
      expect(
        () => checkNumber(0.1, 'value', maximum: 0),
        throwsA(isA<FormatException>()),
      );
      expect(
        () => checkNumber(0, 'value', exclusiveMaximum: 0),
        throwsA(isA<FormatException>()),
      );
      expect(
        () => checkNumber(-0.1, 'value', minimum: 0),
        throwsA(isA<FormatException>()),
      );
      expect(
        () => checkNumber(0, 'value', exclusiveMinimum: 0),
        throwsA(isA<FormatException>()),
      );
    });
  });
}
