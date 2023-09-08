import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';
import 'package:meta/meta.dart';
import 'package:neon/src/settings/widgets/settings_tile.dart';

@internal
class SettingsCategory extends StatelessWidget {
  const SettingsCategory({
    required this.tiles,
    this.title,
    super.key,
  });

  final Widget? title;
  final List<SettingsTile> tiles;

  @override
  Widget build(final BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          DefaultTextStyle(
            style: textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
            child: title!,
          ),
        ...tiles,
      ]
          .intersperse(
            const SizedBox(
              height: 10,
            ),
          )
          .toList(),
    );
  }
}
