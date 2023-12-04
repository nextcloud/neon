import 'package:meta/meta.dart';

/// Extension for formatting the difference between two [DateTime]s.
@internal
extension RelativeTimeFormat on DateTime {
  /// Format the relative time between this and [to].
  ///
  /// If unspecified [DateTime.now] will be used.
  String formatRelative([final DateTime? to]) {
    final now = to ?? DateTime.now();
    var diff = now.difference(toLocal());
    final text = StringBuffer();

    // Sometimes something can be messed up...
    if (diff.isNegative) {
      if (diff.inMinutes >= 1) {
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
