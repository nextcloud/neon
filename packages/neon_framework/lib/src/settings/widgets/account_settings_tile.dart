import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/src/models/account.dart';
import 'package:neon_framework/src/settings/widgets/settings_tile.dart';
import 'package:neon_framework/src/widgets/account_tile.dart';

/// An [NeonAccountTile] used inside a settings list.
@internal
class AccountSettingsTile extends SettingsTile {
  /// Creates a new account settings tile.
  const AccountSettingsTile({
    required this.account,
    required this.userDetailsBloc,
    required this.userStatusBloc,
    this.trailing,
    this.onTap,
    super.key,
  });

  /// {@macro neon_framework.AccountTile.account}
  final Account account;

  final UserDetailsBloc userDetailsBloc;

  /// {@macro neon_framework.UserStatus.userStatusBloc}
  final UserStatusBloc? userStatusBloc;

  /// {@macro neon_framework.AdaptiveListTile.trailing}
  final Widget? trailing;

  /// {@macro neon_framework.AdaptiveListTile.onTap}
  final FutureOr<void> Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return NeonAccountTile(
      account: account,
      userDetailsBloc: userDetailsBloc,
      userStatusBloc: userStatusBloc,
      trailing: trailing,
      onTap: onTap,
    );
  }
}
