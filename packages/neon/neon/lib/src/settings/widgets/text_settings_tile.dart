import 'package:flutter/material.dart';
import 'package:neon/src/settings/widgets/settings_tile.dart';

class TextSettingsTile extends SettingsTile {
  const TextSettingsTile({
    required this.text,
    this.style,
    super.key,
  });

  final String text;
  final TextStyle? style;

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Text(
          text,
          style: style,
        ),
      );
}
