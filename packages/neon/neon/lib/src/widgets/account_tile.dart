part of '../../neon.dart';

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
    final userDetailsBloc = Provider.of<AccountsBloc>(context, listen: false).getUserDetailsBloc(account);

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
      title: ResultBuilder<NextcloudProvisioningApiUserDetails>(
        stream: userDetailsBloc.userDetails,
        builder: (final context, final userDetails) => Row(
          children: [
            if (userDetails.data != null) ...[
              Flexible(
                child: Text(
                  userDetails.data!.getDisplayName()!,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: textColor,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
            if (userDetails.loading) ...[
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: NeonLinearProgressIndicator(
                  color: textColor,
                ),
              ),
            ],
            if (userDetails.error != null) ...[
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
