import 'package:flutter_test/flutter_test.dart';
import 'package:neon_framework/l10n/localizations_en.dart';
import 'package:neon_framework/src/utils/relative_time.dart';

void main() {
  final localizations = NeonLocalizationsEn();

  final durations = <Duration, String>{
    const Duration(days: 730): 'in 2 years',
    const Duration(days: 729): 'in 1 year',
    const Duration(days: 365): 'in 1 year',
    const Duration(days: 364): 'in 364 days',
    const Duration(days: 1): 'in 1 day',
    const Duration(hours: 23): 'in 23 hours',
    const Duration(hours: 1): 'in 1 hour',
    const Duration(minutes: 59): 'in 59 minutes',
    const Duration(minutes: 1): 'in 1 minute',
    const Duration(seconds: 59): 'now',
    const Duration(seconds: 1): 'now',
    const Duration(seconds: -1): 'now',
    const Duration(seconds: -59): 'now',
    const Duration(minutes: -1): '1 minute ago',
    const Duration(minutes: -59): '59 minutes ago',
    const Duration(hours: -1): '1 hour ago',
    const Duration(hours: -23): '23 hours ago',
    const Duration(days: -1): '1 day ago',
    const Duration(days: -364): '364 days ago',
    const Duration(days: -365): '1 year ago',
    const Duration(days: -729): '1 year ago',
    const Duration(days: -730): '2 years ago',
  };

  test('Duration', () {
    for (final entry in durations.entries) {
      expect(entry.key.formatRelative(localizations), entry.value);
    }
  });

  test('DateTime', () {
    final base = DateTime.now();

    expect(base.formatRelative(localizations), 'now');

    for (final entry in durations.entries) {
      expect(base.add(entry.key).formatRelative(localizations, base), entry.value);
    }
  });
}
