import 'package:timezone/timezone.dart' as tz;

/// Common methods to work with [DateTime] data.
extension DateTimeUtils on DateTime {
  /// Constructs a new [tz.TZDateTime] instance
  /// with the given [secondsSinceEpoch].
  ///
  /// The constructed [tz.TZDateTime] represents
  /// 1970-01-01T00:00:[secondsSinceEpoch]Z in the given
  /// time zone [location].
  /// ```dart
  /// final newYearsDay =
  ///     DateTimeUtils.fromSecondsSinceEpoch(1641031200, location:tz.UTC);
  /// print(newYearsDay); // 2022-01-01 10:00:00.000Z
  /// ```
  static tz.TZDateTime fromSecondsSinceEpoch(tz.Location location, int secondsSinceEpoch) {
    final millisecondsSinceEpoch = secondsSinceEpoch * Duration.millisecondsPerSecond;

    return tz.TZDateTime.fromMillisecondsSinceEpoch(location, millisecondsSinceEpoch);
  }

  /// The number of seconds since the "Unix epoch" 1970-01-01T00:00:00Z (UTC).
  ///
  /// This value is independent of the time zone.
  ///
  /// This value is at most
  /// 8,640,000,000,000s (100,000,000 days) from the Unix epoch.
  /// In other words: `secondsSinceEpoch.abs() <= 8640000000000`.
  int get secondsSinceEpoch => millisecondsSinceEpoch ~/ Duration.millisecondsPerSecond;
}
