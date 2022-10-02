part of '../neon.dart';

class AccountTile extends StatelessWidget {
  const AccountTile({
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
    final userDetailsBloc = RxBlocProvider.of<AccountsBloc>(context).getUserDetailsBloc(account);

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
      leading: IntrinsicWidth(
        child: AccountAvatar(
          account: account,
        ),
      ),
      title: StandardRxResultBuilder<UserDetailsBloc, ProvisioningApiUserDetails>(
        bloc: userDetailsBloc,
        state: (final bloc) => bloc.userDetails,
        builder: (
          final context,
          final userDetailsData,
          final userDetailsError,
          final userDetailsLoading,
          final _,
        ) =>
            Row(
          children: [
            if (userDetailsData != null) ...[
              Flexible(
                child: Text(
                  userDetailsData.getDisplayName()!,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: textColor,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
            if (userDetailsLoading) ...[
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: CustomLinearProgressIndicator(
                  color: textColor,
                ),
              ),
            ],
            if (userDetailsError != null) ...[
              const SizedBox(
                width: 5,
              ),
              ExceptionWidget(
                userDetailsError,
                onlyIcon: true,
                iconSize: 24,
                onRetry: () {
                  userDetailsBloc.refresh();
                },
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
