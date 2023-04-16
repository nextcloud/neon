part of '../../neon.dart';

class NeonAccountSettingsTile extends SettingsTile {
  const NeonAccountSettingsTile({
    required this.account,
    this.color,
    this.trailing,
    this.onTap,
    super.key,
  });

  final Account account;
  final Color? color;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(final BuildContext context) => NeonAccountTile(
        account: account,
        color: color,
        trailing: trailing,
        onTap: onTap,
      );
}
