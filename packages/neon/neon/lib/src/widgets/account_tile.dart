import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';
import 'package:meta/meta.dart';
import 'package:neon/src/bloc/result.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/utils/provider.dart';
import 'package:neon/src/widgets/error.dart';
import 'package:neon/src/widgets/linear_progress_indicator.dart';
import 'package:neon/src/widgets/user_avatar.dart';
import 'package:nextcloud/provisioning_api.dart' as provisioning_api;

/// List tile to display account information.
@internal
class NeonAccountTile extends StatelessWidget {
  /// Creates a new account list tile.
  const NeonAccountTile({
    required this.account,
    this.trailing,
    this.onTap,
    this.showStatus = true,
    super.key,
  });

  /// {@template neon.AccountTile.account}
  /// The account to display inside the tile.
  /// {@endtemplate}
  final Account account;

  /// {@template neon.AccountTile.trailing}
  /// A widget to display after the title.
  ///
  /// Typically an [Icon] widget.
  ///
  /// To show right-aligned metadata (assuming left-to-right reading order;
  /// left-aligned for right-to-left reading order), consider using a [Row] with
  /// [CrossAxisAlignment.baseline] alignment whose first item is [Expanded] and
  /// whose second child is the metadata text, instead of using the [trailing]
  /// property.
  /// {@endtemplate}
  final Widget? trailing;

  /// {@template neon.AccountTile.onTap}
  /// Called when the user taps this list tile.
  /// {@endtemplate}
  final GestureTapCallback? onTap;

  /// Whether to also show the status on the avatar.
  ///
  /// See:
  ///   * [NeonUserAvatar.showStatus]
  final bool showStatus;

  @override
  Widget build(final BuildContext context) {
    final userDetailsBloc = NeonProvider.of<AccountsBloc>(context).getUserDetailsBlocFor(account);

    return ListTile(
      onTap: onTap,
      leading: NeonUserAvatar(
        account: account,
        showStatus: showStatus,
      ),
      trailing: trailing,
      title: ResultBuilder<provisioning_api.UserDetails>.behaviorSubject(
        subject: userDetailsBloc.userDetails,
        builder: (final context, final userDetails) => Row(
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
                onlyIcon: true,
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
