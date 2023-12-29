import 'package:meta/meta.dart';

/// Extension for formatting the difference between two [DateTime]s.
@internal
extension RelativeTimeFormatDateTime on DateTime {
  /// Format the relative time between this and [to].
  ///
  /// If unspecified [DateTime.now] will be used.
  String formatRelative([final DateTime? to]) => (to ?? DateTime.now()).difference(toLocal()).formatRelative();
}

/// Extension for formatting difference of a [Duration].
@internal
extension RelativeTimeFormatDuration on Duration {
  /// Format the relative time.
  String formatRelative() {
    var diff = this;
    final text = StringBuffer();

    if (diff.isNegative) {
      // Only add minus sign when not showing 'now'
      if (diff.inMinutes <= -1) {
        text.write('-');
      }
      diff = Duration(microseconds: -diff.inMicroseconds);
    }

    if (diff.inMinutes < 1) {
      text.write('now');
    } else if (diff.inHours < 1) {
      text.write('${diff.inMinutes}m');
    } else if (diff.inDays < 1) {
      text.write('${diff.inHours}h');
    } else if (diff.inDays < 365) {
      text.write('${diff.inDays}d');
    } else {
      text.write('${diff.inDays ~/ 365}y');
    }

    return text.toString();
  }
}
