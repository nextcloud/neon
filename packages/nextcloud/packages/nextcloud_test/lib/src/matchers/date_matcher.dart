import 'package:nextcloud/utils.dart';
import 'package:test/expect.dart';
import 'package:timezone/timezone.dart' as tz;

/// Returns a matcher which matches if the match argument is within [delta]
/// of some [value].
///
/// In other words, this matches if the difference of the match argument and [value]
/// is greater than or equal to -[delta] and less than or equal to [delta].
///
/// The match argument can either be a `DateTime, `String` or `int`.
/// A `String` value is parsed into a utc date, while an `int` value is interpreted
/// as a unix timestamp (seconds since epoch).
Matcher closeToDate(DateTime value, Duration delta) => _IsCloseToDate(value, delta);

class _IsCloseToDate extends TypeMatcher<DateTime> {
  const _IsCloseToDate(this._value, this._delta);

  final DateTime _value;
  final Duration _delta;

  static DateTime? _parse(dynamic item) {
    switch (item) {
      case DateTime():
        return item;

      case String():
        final date = DateTime.parse(item);
        return date.toUtc().add(date.timeZoneOffset);

      case int():
        return DateTimeUtils.fromSecondsSinceEpoch(tz.UTC, item);

      default:
        return null;
    }
  }

  @override
  bool matches(
    dynamic item,
    Map<dynamic, dynamic> matchState,
  ) {
    final date = _parse(item);
    if (date == null) {
      return false;
    }

    var diff = date.difference(_value);
    if (diff.isNegative) {
      diff = -diff;
    }
    return diff <= _delta;
  }

  @override
  Description describeMismatch(
    Object? item,
    Description mismatchDescription,
    Map<dynamic, dynamic> matchState,
    bool verbose,
  ) {
    final date = _parse(item);
    if (date == null) {
      return super.describe(mismatchDescription.add('not an '));
    }

    final diff = date.difference(_value);
    return mismatchDescription.add(' differs by ').addDescriptionOf(diff);
  }

  @override
  Description describe(Description description) =>
      description.add('a time value within ').addDescriptionOf(_delta).add(' of ').addDescriptionOf(_value);
}
