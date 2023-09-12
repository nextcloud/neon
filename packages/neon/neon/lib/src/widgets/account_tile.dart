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

@internal
class NeonAccountTile extends StatelessWidget {
  const NeonAccountTile({
    required this.account,
    this.trailing,
    this.onTap,
    this.showStatus = true,
    super.key,
  });

  final Account account;
  final Widget? trailing;
  final GestureTapCallback? onTap;
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
