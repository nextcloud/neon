part of '../../neon.dart';

class RelativeTime extends StatelessWidget {
  const RelativeTime({
    required this.date,
    this.style,
    super.key,
  });

  final DateTime date;
  final TextStyle? style;

  static String format(final DateTime date) {
    final now = DateTime.now();
    var diff = now.difference(date.toLocal());
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

  @override
  Widget build(final BuildContext context) => StreamBuilder(
        stream: Stream.periodic(const Duration(minutes: 1)),
        builder: (final context, final _) => Text(
          format(date),
          style: style,
        ),
      );
}
