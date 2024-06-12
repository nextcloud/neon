// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter_test/flutter_test.dart';
import 'package:neon_framework/l10n/localizations_en.dart';
import 'package:neon_framework/src/utils/relative_time.dart';
import 'package:timezone/timezone.dart' as tz;

void main() {
  final localizations = NeonLocalizationsEn();

  final durations = <Duration, (String, String, String, String)>{
    const Duration(days: 730): ('2 years', 'in 2 years', '2y', 'in 2y'),
    const Duration(days: 729): ('1 year', 'in 1 year', '1y', 'in 1y'),
    const Duration(days: 365): ('1 year', 'in 1 year', '1y', 'in 1y'),
    const Duration(days: 364): ('364 days', 'in 364 days', '364d', 'in 364d'),
    const Duration(days: 1): ('1 day', 'in 1 day', '1d', 'in 1d'),
    const Duration(hours: 23): ('23 hours', 'in 23 hours', '23h', 'in 23h'),
    const Duration(hours: 1): ('1 hour', 'in 1 hour', '1h', 'in 1h'),
    const Duration(minutes: 59): ('59 minutes', 'in 59 minutes', '59m', 'in 59m'),
    const Duration(minutes: 1): ('1 minute', 'in 1 minute', '1m', 'in 1m'),
    const Duration(seconds: 59): ('now', 'now', 'now', 'now'),
    const Duration(seconds: 1): ('now', 'now', 'now', 'now'),
    const Duration(seconds: -1): ('now', 'now', 'now', 'now'),
    const Duration(seconds: -59): ('now', 'now', 'now', 'now'),
    const Duration(minutes: -1): ('1 minute', '1 minute ago', '1m', '1m ago'),
    const Duration(minutes: -59): ('59 minutes', '59 minutes ago', '59m', '59m ago'),
    const Duration(hours: -1): ('1 hour', '1 hour ago', '1h', '1h ago'),
    const Duration(hours: -23): ('23 hours', '23 hours ago', '23h', '23h ago'),
    const Duration(days: -1): ('1 day', '1 day ago', '1d', '1d ago'),
    const Duration(days: -364): ('364 days', '364 days ago', '364d', '364d ago'),
    const Duration(days: -365): ('1 year', '1 year ago', '1y', '1y ago'),
    const Duration(days: -729): ('1 year', '1 year ago', '1y', '1y ago'),
    const Duration(days: -730): ('2 years', '2 years ago', '2y', '2y ago'),
  };

  test('Duration', () {
    for (final entry in durations.entries) {
      expect(
        entry.key.formatRelative(localizations, includeSign: false),
        entry.value.$1,
      );
      expect(
        entry.key.formatRelative(localizations, includeSign: true),
        entry.value.$2,
      );
      expect(
        entry.key.formatRelative(localizations, includeSign: false, abbreviation: true),
        entry.value.$3,
      );
      expect(
        entry.key.formatRelative(localizations, includeSign: true, abbreviation: true),
        entry.value.$4,
      );
    }
  });

  test('DateTime', () {
    final base = tz.TZDateTime.now(tz.UTC);

    expect(base.formatRelative(localizations), 'now');

    for (final entry in durations.entries) {
      expect(
        base.add(entry.key).formatRelative(localizations, to: base, includeSign: false),
        entry.value.$1,
      );
      expect(
        base.add(entry.key).formatRelative(localizations, to: base, includeSign: true),
        entry.value.$2,
      );
      expect(
        base.add(entry.key).formatRelative(localizations, to: base, includeSign: false, abbreviation: true),
        entry.value.$3,
      );
      expect(
        base.add(entry.key).formatRelative(localizations, to: base, includeSign: true, abbreviation: true),
        entry.value.$4,
      );
    }
  });
}
