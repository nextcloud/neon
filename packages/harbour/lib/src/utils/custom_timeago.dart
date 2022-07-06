part of '../harbour.dart';

class CustomTimeAgo {
  static String format(final DateTime date) {
    final now = DateTime.now();
    var diff = now.difference(date);
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
