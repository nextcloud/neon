part of '../../../neon.dart';

class AccountSettingsTile extends SettingsTile {
  const AccountSettingsTile({
    required this.account,
    this.color,
    this.trailing,
    super.key,
  });

  final Account account;
  final Color? color;
  final Widget? trailing;

  @override
  Widget build(final BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: AccountTile(
          account: account,
          color: color,
          trailing: trailing,
        ),
      );
}
