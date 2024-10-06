import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// A chip style UI element to display a date.
class DateChip extends StatelessWidget {
  /// Creates  a new date chip.
  const DateChip({
    required this.date,
    this.dateFormat = DateFormat.YEAR_NUM_MONTH_DAY,
    this.icon,
    super.key,
  });

  /// The date to display.
  final DateTime date;

  /// The format to use for the date.
  final String dateFormat;

  /// An optional leading icon to display in front of the date.
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodySmall!;
    final colorScheme = Theme.of(context).colorScheme;
    final content = DateFormat(dateFormat).format(date);

    return Card(
      color: colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: textStyle.fontSize,
              color: colorScheme.onSecondaryContainer,
            ),
            const SizedBox(width: 4),
            Text(
              content,
              style: textStyle.copyWith(
                color: colorScheme.onSecondaryContainer,
              ),
              overflow: TextOverflow.fade,
            ),
          ],
        ),
      ),
    );
  }
}
