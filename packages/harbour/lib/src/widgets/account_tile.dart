part of '../harbour.dart';

class AccountTile extends StatefulWidget {
  const AccountTile({
    required this.account,
    this.trailing,
    this.color,
    super.key,
  });

  final Account account;
  final Widget? trailing;
  final Color? color;

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
  Widget build(final BuildContext context) => Row(
        children: [
          AccountAvatar(
            account: widget.account,
            requestManager: Provider.of<RequestManager>(context),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StandardRxResultBuilder<UserDetailsBloc, ProvisioningApiUserDetails>(
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
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '(',
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: widget.color,
                              ),
                        ),
                      ],
                      Text(
                        widget.account.username,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: widget.color,
                            ),
                      ),
                      if (userDetailsData != null) ...[
                        Text(
                          ')',
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
                Text(
                  widget.account.serverURL,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: widget.color,
                      ),
                ),
              ],
            ),
          ),
          if (widget.trailing != null) ...[
            widget.trailing!,
          ],
        ],
      );
}
