import 'package:cookbook_recipe_repository/src/utils/utils.dart';
import 'package:test/test.dart';

void main() {
  group('Iso8601DateTime', () {
    test('can parse null', () {
      expect(
        Iso8601Duration.tryParse(null),
        isNull,
      );
    });

    test('can parse invalid string', () {
      expect(
        Iso8601Duration.tryParse('null'),
        isNull,
      );
    });

    test('can parse valid string', () {
      expect(
        Iso8601Duration.tryParse('P1DT2H3M4S'),
        equals(
          const Duration(
            days: 1,
            hours: 2,
            minutes: 3,
            seconds: 4,
          ),
        ),
      );
    });

    test('can serialize duration', () {
      expect(
        const Duration(
          days: 1,
          hours: 2,
          minutes: 3,
          seconds: 4,
        ).toIso8601String(),
        equals('P1DT2H3M4S'),
      );
    });

    test('can not serialize duration with sub second precision', () {
      expect(
        () => const Duration(
          days: 1,
          hours: 2,
          minutes: 3,
          seconds: 4,
          milliseconds: 5,
          microseconds: 6,
        ).toIso8601String(),
        throwsArgumentError,
      );
    });
  });
}
