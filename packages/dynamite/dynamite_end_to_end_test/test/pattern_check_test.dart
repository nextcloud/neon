import 'package:dynamite_end_to_end_test/pattern_check.openapi.dart';
import 'package:test/test.dart';

void main() {
  const validString = '01234';
  final object = TestObject(
    (final b) => b
      ..onlyNumbers = validString
      ..minLength = validString
      ..maxLength = validString
      ..multipleChecks = validString,
  );

  group('Pattern check', () {
    test('onlyNumbers', () {
      expect(() => object.rebuild((final b) => b..onlyNumbers = null), throwsA(isA<FormatException>()));
      expect(() => object.rebuild((final b) => b..onlyNumbers = 'Text'), throwsA(isA<FormatException>()));
    });

    test('minLength', () {
      expect(() => object.rebuild((final b) => b..minLength = null), throwsA(isA<FormatException>()));
      expect(() => object.rebuild((final b) => b..minLength = ''), throwsA(isA<FormatException>()));
      expect(() => object.rebuild((final b) => b..minLength = 'Te'), throwsA(isA<FormatException>()));
      expect(() => object.rebuild((final b) => b..minLength = '12'), throwsA(isA<FormatException>()));
    });

    test('maxLength', () {
      expect(() => object.rebuild((final b) => b..maxLength = null), throwsA(isA<FormatException>()));
      expect(
        () => object.rebuild((final b) => b..maxLength = 'Super long text should throw'),
        throwsA(isA<FormatException>()),
      );
      expect(
        () => object.rebuild((final b) => b..maxLength = '419712642879393808962'),
        throwsA(isA<FormatException>()),
      );
    });

    test('multipleChecks', () {
      expect(() => object.rebuild((final b) => b..multipleChecks = null), throwsA(isA<FormatException>()));
      expect(() => object.rebuild((final b) => b..multipleChecks = 'Text'), throwsA(isA<FormatException>()));
      expect(() => object.rebuild((final b) => b..minLength = ''), throwsA(isA<FormatException>()));
      expect(() => object.rebuild((final b) => b..minLength = '12'), throwsA(isA<FormatException>()));
      expect(
        () => object.rebuild((final b) => b..maxLength = '419712642879393808962'),
        throwsA(isA<FormatException>()),
      );
    });
  });
}
