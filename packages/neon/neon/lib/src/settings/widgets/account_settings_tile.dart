import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/settings/widgets/settings_tile.dart';
import 'package:neon/src/widgets/account_tile.dart';

@internal
class AccountSettingsTile extends SettingsTile {
  const AccountSettingsTile({
    required this.account,
    this.trailing,
    this.onTap,
    super.key,
  });

  final Account account;

  final Widget? trailing;
  final GestureTapCallback? onTap;

  @override
  Widget build(final BuildContext context) => NeonAccountTile(
        account: account,
        trailing: trailing,
        onTap: onTap,
      );
}
