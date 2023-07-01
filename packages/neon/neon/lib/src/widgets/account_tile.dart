import 'package:flutter/material.dart';
import 'package:neon/src/bloc/result_builder.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/widgets/exception.dart';
import 'package:neon/src/widgets/linear_progress_indicator.dart';
import 'package:neon/src/widgets/user_avatar.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:provider/provider.dart';

class NeonAccountTile extends StatelessWidget {
  const NeonAccountTile({
    required this.account,
    this.color,
    this.trailing,
    this.onTap,
    this.textColor,
    this.dense = false,
    super.key,
  });

  final Account account;
  final Color? color;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? textColor;
  final bool dense;

  @override
  Widget build(final BuildContext context) {
    final userDetailsBloc = Provider.of<AccountsBloc>(context, listen: false).getUserDetailsBlocFor(account);

    return ListTile(
      textColor: textColor,
      onTap: onTap,
      dense: dense,
      contentPadding: dense ? EdgeInsets.zero : null,
      visualDensity: dense
          ? const VisualDensity(
              horizontal: -4,
              vertical: -4,
            )
          : null,
      leading: NeonUserAvatar(
        account: account,
      ),
      title: ResultBuilder<ProvisioningApiUserDetails>.behaviorSubject(
        stream: userDetailsBloc.userDetails,
        builder: (final context, final userDetails) => Row(
          children: [
            if (userDetails.hasData) ...[
              Flexible(
                child: Text(
                  userDetails.requireData.displayname,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: textColor,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
            if (userDetails.isLoading) ...[
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: NeonLinearProgressIndicator(
                  color: textColor,
                ),
              ),
            ],
            if (userDetails.hasError) ...[
              const SizedBox(
                width: 5,
              ),
              NeonException(
                userDetails.error,
                onlyIcon: true,
                iconSize: 24,
                onRetry: userDetailsBloc.refresh,
              ),
            ],
          ],
        ),
      ),
      subtitle: Text(
        account.client.humanReadableID,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: textColor,
            ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
