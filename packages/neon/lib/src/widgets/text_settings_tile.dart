part of '../neon.dart';

class TextSettingsTile extends SettingsTile {
  const TextSettingsTile({
    required this.text,
    this.style,
    super.key,
  });

  final String text;
  final TextStyle? style;

  @override
  Widget build(final BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Text(
          text,
          style: style,
        ),
      );
}
