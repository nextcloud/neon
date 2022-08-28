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
      leading: AccountAvatar(
        account: account,
        requestManager: Provider.of<RequestManager>(context),
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
              Text(
                userDetailsData.getDisplayName()!,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: textColor,
                    ),
              ),
            ],
            if (userDetailsLoading) ...[
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                height: 10,
                width: 10,
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                  color: color,
                ),
              ),
            ],
            if (userDetailsError != null) ...[
              const SizedBox(
                width: 5,
              ),
              Icon(
                Icons.error_outline,
                size: 20,
                color: color,
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
      ),
    );
  }
}
