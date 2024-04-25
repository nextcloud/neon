import 'package:built_value/json_object.dart';
import 'package:dynamite_end_to_end_test/pattern_check.openapi.dart';
import 'package:test/test.dart';

void main() {
  const validString = '01234';
  final validArray = [0, 1, 2, 3, 4];
  final object = TestObject(
    (b) => b
      ..onlyNumbers = validString
      ..minLength = validString
      ..maxLength = validString
      ..stringMultipleChecks = validString
      ..minItems
      ..minItems.replace(validArray)
      ..maxItems.replace(validArray)
      ..arrayMultipleChecks.replace(validArray),
  );

  group('Pattern check', () {
    test('onlyNumbers', () {
      object.rebuild((b) => b..onlyNumbers = null);
      expect(() => object.rebuild((b) => b..onlyNumbers = 'Text'), throwsA(isA<FormatException>()));
    });

    test('minLength', () {
      object.rebuild((b) => b..minLength = null);
      expect(() => object.rebuild((b) => b..minLength = ''), throwsA(isA<FormatException>()));
      expect(() => object.rebuild((b) => b..minLength = 'Te'), throwsA(isA<FormatException>()));
      expect(() => object.rebuild((b) => b..minLength = '12'), throwsA(isA<FormatException>()));
    });

    test('maxLength', () {
      expect(
        () => object.rebuild((b) => b..maxLength = 'Super long text should throw'),
        throwsA(isA<FormatException>()),
      );
      expect(
        () => object.rebuild((b) => b..maxLength = '419712642879393808962'),
        throwsA(isA<FormatException>()),
      );
    });

    test('String multipleChecks', () {
      expect(() => object.rebuild((b) => b..stringMultipleChecks = 'Text'), throwsA(isA<FormatException>()));
      expect(() => object.rebuild((b) => b..stringMultipleChecks = ''), throwsA(isA<FormatException>()));
      expect(() => object.rebuild((b) => b..stringMultipleChecks = '12'), throwsA(isA<FormatException>()));
      expect(
        () => object.rebuild((b) => b..stringMultipleChecks = '419712642879393808962'),
        throwsA(isA<FormatException>()),
      );
    });

    test('minItems', () {
      expect(() => object.rebuild((b) => b..minItems.replace([])), throwsA(isA<FormatException>()));
      expect(() => object.rebuild((b) => b..minItems.replace([0, 1])), throwsA(isA<FormatException>()));
    });

    test('maxItems', () {
      expect(
        () => object.rebuild((b) => b..maxItems.replace(List.generate(30, (i) => i))),
        throwsA(isA<FormatException>()),
      );
    });

    test('Array multipleChecks', () {
      expect(() => object.rebuild((b) => b..arrayMultipleChecks.replace([])), throwsA(isA<FormatException>()));
      expect(() => object.rebuild((b) => b..arrayMultipleChecks.replace([0, 1])), throwsA(isA<FormatException>()));
      expect(
        () => object.rebuild((b) => b..arrayMultipleChecks.replace(List.generate(30, (i) => i))),
        throwsA(isA<FormatException>()),
      );
    });

    test('JsonObject', () {
      final object = TestObjectUnspecified();

      expect(
        () => object.rebuild((b) => b..value = JsonObject(['value'])),
        throwsA(isA<FormatException>()),
      );

      expect(
        () => object.rebuild((b) => b..value = JsonObject('Text')),
        throwsA(isA<FormatException>()),
      );
    });
  });
}
