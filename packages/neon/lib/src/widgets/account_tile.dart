part of '../neon.dart';

class AccountTile extends StatefulWidget {
  const AccountTile({
    required this.account,
    this.color,
    this.trailing,
    this.onTap,
    this.dense = false,
    super.key,
  });

  final Account account;
  final Color? color;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool dense;

  @override
  State<AccountTile> createState() => _AccountTileState();
}

class _AccountTileState extends State<AccountTile> {
  late final UserDetailsBloc _userDetailsBloc;

  @override
  void initState() {
    super.initState();

    _userDetailsBloc = RxBlocProvider.of<AccountsBloc>(context).getUserDetailsBloc(widget.account);
  }

  @override
  Widget build(final BuildContext context) => ListTile(
        onTap: widget.onTap,
        dense: widget.dense,
        contentPadding: widget.dense ? EdgeInsets.zero : null,
        visualDensity: widget.dense
            ? const VisualDensity(
                horizontal: -4,
                vertical: -4,
              )
            : null,
        leading: AccountAvatar(
          account: widget.account,
          requestManager: Provider.of<RequestManager>(context),
        ),
        title: StandardRxResultBuilder<UserDetailsBloc, ProvisioningApiUserDetails>(
          bloc: _userDetailsBloc,
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
                        color: widget.color,
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
                    color: widget.color,
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
                  color: widget.color,
                ),
              ],
            ],
          ),
        ),
        subtitle: Text(
          widget.account.client.humanReadableID,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: widget.color,
              ),
        ),
      );
}
