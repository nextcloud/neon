import 'package:flutter_test/flutter_test.dart';
import 'package:neon_framework/l10n/localizations_en.dart';
import 'package:neon_framework/src/utils/user_status_clear_at.dart';
import 'package:nextcloud/user_status.dart' as user_status;
import 'package:timezone/timezone.dart' as tz;

void main() {
  final localizations = NeonLocalizationsEn();

  final clearAts = <user_status.ClearAt, (String, DateTime?)>{
    user_status.ClearAt(
      (b) => b
        ..type = user_status.ClearAt_Type.endOf
        ..time = ($int: null, clearAtTimeType: user_status.ClearAtTimeType.day),
    ): (
      localizations.userStatusClearAtToday,
      DateTime.utc(2024, 1, 2),
    ),
    user_status.ClearAt(
      (b) => b
        ..type = user_status.ClearAt_Type.endOf
        ..time = ($int: null, clearAtTimeType: user_status.ClearAtTimeType.week),
    ): (
      localizations.userStatusClearAtThisWeek,
      DateTime.utc(2024, 1, 8),
    ),
    user_status.ClearAt(
      (b) => b
        ..type = user_status.ClearAt_Type.period
        ..time = ($int: 120, clearAtTimeType: null),
    ): (
      localizations.relativeTimeMinutes(2, 'false'),
      DateTime.utc(2024, 1, 1, 0, 2),
    ),
  };

  test('Format relative', () {
    for (final entry in clearAts.entries) {
      expect(entry.key.formatRelative(localizations), entry.value.$1);
    }
  });

  test('To DateTime', () {
    for (final entry in clearAts.entries) {
      expect(entry.key.toDateTime(tz.TZDateTime.utc(2024)), entry.value.$2);
    }
  });
}
