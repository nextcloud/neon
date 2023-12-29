import 'package:neon_framework/src/utils/relative_time.dart';
import 'package:test/test.dart';

void main() {
  final durations = <Duration, String>{
    const Duration(days: -730): '-2y',
    const Duration(days: -729): '-1y',
    const Duration(days: -365): '-1y',
    const Duration(days: -364): '-364d',
    const Duration(days: -1): '-1d',
    const Duration(hours: -23): '-23h',
    const Duration(hours: -1): '-1h',
    const Duration(minutes: -59): '-59m',
    const Duration(minutes: -1): '-1m',
    const Duration(seconds: -59): 'now',
    const Duration(seconds: -1): 'now',
    const Duration(seconds: 1): 'now',
    const Duration(seconds: 59): 'now',
    const Duration(minutes: 1): '1m',
    const Duration(minutes: 59): '59m',
    const Duration(hours: 1): '1h',
    const Duration(hours: 23): '23h',
    const Duration(days: 1): '1d',
    const Duration(days: 364): '364d',
    const Duration(days: 365): '1y',
    const Duration(days: 729): '1y',
    const Duration(days: 730): '2y',
  };

  test('Duration', () {
    for (final entry in durations.entries) {
      expect(entry.key.formatRelative(), entry.value);
    }
  });

  test('DateTime', () {
    final base = DateTime.now();

    expect(base.formatRelative(), 'now');

    for (final entry in durations.entries) {
      expect(base.formatRelative(base.add(entry.key)), entry.value);
    }
  });
}
