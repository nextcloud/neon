part of '../../neon.dart';

class NeonTextSettingsTile extends SettingsTile {
  const NeonTextSettingsTile({
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
