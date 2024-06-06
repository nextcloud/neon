import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/src/widgets/adaptive_widgets/list_tile.dart';
import 'package:neon_framework/src/widgets/error.dart';
import 'package:neon_framework/src/widgets/linear_progress_indicator.dart';
import 'package:neon_framework/src/widgets/user_avatar.dart';

/// List tile to display account information.
@internal
class NeonAccountTile extends StatelessWidget {
  /// Creates a new account list tile.
  const NeonAccountTile({
    required this.account,
    required this.userDetailsBloc,
    required this.userStatusBloc,
    this.trailing,
    this.onTap,
    super.key,
  });

  /// {@template neon_framework.AccountTile.account}
  /// The account to display inside the tile.
  /// {@endtemplate}
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
    return AdaptiveListTile(
      onTap: onTap,
      leading: NeonUserAvatar(
        account: account,
        userStatusBloc: userStatusBloc,
      ),
      trailing: trailing,
      title: ResultBuilder.behaviorSubject(
        subject: userDetailsBloc.userDetails,
        builder: (context, userDetails) => Row(
          children: [
            if (userDetails.hasData)
              Flexible(
                child: Text(
                  userDetails.requireData.displayname,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            if (userDetails.isLoading)
              const Expanded(
                child: NeonLinearProgressIndicator(),
              ),
            if (userDetails.hasError)
              NeonError(
                userDetails.error,
                type: NeonErrorType.iconOnly,
                iconSize: 24,
                onRetry: userDetailsBloc.refresh,
              ),
          ].intersperse(const SizedBox(width: 5)).toList(),
        ),
      ),
      subtitle: Text(
        account.humanReadableID,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
