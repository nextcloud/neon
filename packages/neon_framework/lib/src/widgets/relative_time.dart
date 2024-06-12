import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:neon_framework/l10n/localizations.dart';
import 'package:neon_framework/src/utils/relative_time.dart';
import 'package:timezone/timezone.dart' as tz;

/// Shows the time elapsed since a [tz.TZDateTime] and periodically updates itself.
class RelativeTime extends StatefulWidget {
  /// Creates a new relative DateTime widget.
  const RelativeTime({
    required this.date,
    this.style,
    this.includeSign = true,
    this.abbreviation = false,
    super.key,
  });

  /// The timestamp to be displayed.
  final tz.TZDateTime date;

  /// The text style of the calculated time.
  ///
  /// If not specified the nearest [TextStyle] will be used.
  final TextStyle? style;

  /// Skip the parts that tell if the difference is into the future or into the past.
  final bool includeSign;

  /// Use abbreviations for time units.
  final bool abbreviation;

  @override
  State<RelativeTime> createState() => _RelativeTimeState();
}

class _RelativeTimeState extends State<RelativeTime> {
  late final Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(
      const Duration(minutes: 1),
      (_) => setState(() {}),
    );

    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.date.formatRelative(
        NeonLocalizations.of(context),
        includeSign: widget.includeSign,
        abbreviation: widget.abbreviation,
      ),
      style: widget.style,
    );
  }
}
