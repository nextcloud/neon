import 'package:meta/meta.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/src/utils/relative_time.dart';
import 'package:nextcloud/user_status.dart' as user_status;

@internal
extension ClearAt on user_status.ClearAt {
// Replication of https://github.com/nextcloud/server/blob/master/apps/user_status/src/filters/clearAtFilter.js
  String formatRelative(NeonLocalizations localizations) {
    switch (type) {
      case user_status.ClearAt_Type.endOf:
        switch (time.clearAtTimeType) {
          case user_status.ClearAtTimeType.day:
            return localizations.userStatusClearAtToday;
          case user_status.ClearAtTimeType.week:
            return localizations.userStatusClearAtThisWeek;
        }
      case user_status.ClearAt_Type.period:
        return Duration(seconds: time.$int!).formatRelative(
          localizations,
          includeSign: false,
        );
    }

    throw ArgumentError('Unknown ClearAt $this');
  }

  DateTime? toDateTime([DateTime? base]) {
    base ??= DateTime.now();

    switch (type) {
      case user_status.ClearAt_Type.endOf:
        switch (time.clearAtTimeType) {
          case user_status.ClearAtTimeType.day:
            return DateTime(base.year, base.month, base.day).add(const Duration(days: 1));
          case user_status.ClearAtTimeType.week:
            return DateTime(base.year, base.month, base.day).add(Duration(days: 8 - base.weekday));
        }
      case user_status.ClearAt_Type.period:
        return base.add(Duration(seconds: time.$int!));
    }

    throw ArgumentError('Unknown ClearAt $this');
  }
}
