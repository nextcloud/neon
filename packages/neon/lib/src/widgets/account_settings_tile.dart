part of '../neon.dart';

class AccountSettingsTile extends SettingsTile {
  const AccountSettingsTile({
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
  Widget build(final BuildContext context) => AccountTile(
        account: account,
        color: color,
        trailing: trailing,
        onTap: onTap,
      );
}
