import 'package:cookbook_recipe_repository/src/utils/utils.dart';
import 'package:test/test.dart';
import 'package:timezone/timezone.dart' as tz;

void main() {
  group('Iso8601DateTime', () {
    test('can parse null', () {
      expect(
        Iso8601DateTime.tryParse(tz.UTC, null),
        isNull,
      );
    });

    test('can parse invalid string', () {
      expect(
        Iso8601DateTime.tryParse(tz.UTC, 'null'),
        isNull,
      );
    });

    test('can parse valid string', () {
      expect(
        Iso8601DateTime.tryParse(tz.UTC, '2024-07-14T10:25:58.204680Z'),
        equals(tz.TZDateTime(tz.UTC, 2024, 07, 14, 10, 25, 58, 0, 204680)),
      );
    });
  });
}
