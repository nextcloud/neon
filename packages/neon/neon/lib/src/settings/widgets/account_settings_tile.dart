import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/settings/widgets/settings_tile.dart';
import 'package:neon/src/widgets/account_tile.dart';

/// An [NeonAccountTile] used inside a settings list.
@internal
class AccountSettingsTile extends SettingsTile {
  /// Creates a new account settings tile.
  const AccountSettingsTile({
    required this.account,
    this.trailing,
    this.onTap,
    super.key,
  });

  /// {@macro neon.AccountTile.account}
  final Account account;

  /// {@macro neon.AccountTile.trailing}
  final Widget? trailing;

  /// {@macro neon.AccountTile.onTap}
  final GestureTapCallback? onTap;

  @override
  Widget build(final BuildContext context) => NeonAccountTile(
        account: account,
        trailing: trailing,
        onTap: onTap,
      );
}
