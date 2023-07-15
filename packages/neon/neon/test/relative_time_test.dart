import 'package:neon/src/utils/relative_time.dart';
import 'package:test/test.dart';

void main() {
  group('RelativeTime', () {
    test('now', () {
      final dateTime = DateTime.now();

      expect(dateTime.formatRelative(), 'now');
    });

    test('minutes', () {
      final now = DateTime(2020, DateTime.april, 1, 20, 31);
      final later = DateTime(2020, DateTime.april, 1, 20, 30);

      expect(now.formatRelative(later), '1m');
    });

    test('hours', () {
      final now = DateTime(2020, DateTime.april, 1, 20);
      final later = DateTime(2020, DateTime.april, 1, 21);

      expect(now.formatRelative(later), '1h');
    });

    test('days', () {
      final now = DateTime(2020, DateTime.april, 2);
      final later = DateTime(2020, DateTime.april, 3);

      expect(now.formatRelative(later), '1d');
    });

    test('years', () {
      final now = DateTime(2020);
      final later = DateTime(2021);

      expect(now.formatRelative(later), '1y');
    });
  });
}
