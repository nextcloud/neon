import 'package:meta/meta.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:timezone/timezone.dart' as tz;

/// Extension for formatting the difference between two [tz.TZDateTime]s.
@internal
extension RelativeTimeFormatDateTime on tz.TZDateTime {
  /// Format the relative time between this and [to].
  ///
  /// If [to] is unspecified the current time in the 'UTC' timezone will be used.
  /// Set [includeSign] to skip the parts that tell if the difference is into the future or into the past.
  /// It should only be used if it is already clear from the context if it is about the future or the past.
  String formatRelative(
    NeonLocalizations localizations, {
    bool includeSign = true,
    bool abbreviation = false,
    tz.TZDateTime? to,
  }) =>
      difference(to ?? tz.TZDateTime.now(tz.UTC)).formatRelative(
        localizations,
        includeSign: includeSign,
        abbreviation: abbreviation,
      );
}

/// Extension for formatting difference of a [Duration].
@internal
extension RelativeTimeFormatDuration on Duration {
  /// Format the relative time.
  ///
  /// Set [includeSign] to skip the parts that tell if the difference is into the future or into the past.
  /// It should only be used if it is already clear from the context if it is about the future or the past.
  String formatRelative(
    NeonLocalizations localizations, {
    bool includeSign = true,
    bool abbreviation = false,
  }) {
    final normalizedDuration = isNegative ? Duration(microseconds: -inMicroseconds) : this;
    if (normalizedDuration.inMinutes < 1) {
      return localizations.relativeTimeNow;
    }

    final abbr = abbreviation ? 'true' : 'false';

    String time;
    if (normalizedDuration.inHours < 1) {
      time = localizations.relativeTimeMinutes(normalizedDuration.inMinutes, abbr);
    } else if (normalizedDuration.inDays < 1) {
      time = localizations.relativeTimeHours(normalizedDuration.inHours, abbr);
    } else if (normalizedDuration.inDays < 365) {
      time = localizations.relativeTimeDays(normalizedDuration.inDays, abbr);
    } else {
      time = localizations.relativeTimeYears(normalizedDuration.inDays ~/ 365, abbr);
    }

    if (!includeSign) {
      return time;
    }

    if (isNegative) {
      return localizations.relativeTimePast(time);
    } else {
      return localizations.relativeTimeFuture(time);
    }
  }
}
