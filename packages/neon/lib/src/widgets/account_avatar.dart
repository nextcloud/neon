part of '../neon.dart';

const kAvatarSize = 40.0;

class AccountAvatar extends StatelessWidget {
  const AccountAvatar({
    required this.account,
    super.key,
  });

  final Account account;

  @override
  Widget build(final BuildContext context) => Stack(
        alignment: Alignment.center,
        children: [
          ResultStreamBuilder<Uint8List>(
            // TODO: See TODO in cached_url_image.dart
            stream: Provider.of<RequestManager>(context, listen: false).wrapBytes(
              account.client.id,
              'accounts-avatar-${account.id}',
              () async => account.client.core.getAvatar(
                userId: account.username,
                size: (kAvatarSize * MediaQuery.of(context).devicePixelRatio).toInt(),
              ),
              preferCache: true,
            ),
            builder: (
              final context,
              final avatarData,
              final avatarError,
              final avatarLoading,
            ) =>
                Stack(
              children: [
                if (avatarData != null) ...[
                  CircleAvatar(
                    radius: kAvatarSize / 2,
                    backgroundImage: MemoryImage(avatarData),
                  ),
                ],
                if (avatarError != null) ...[
                  Icon(
                    Icons.error_outline,
                    size: 30,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ],
                if (avatarLoading) ...[
                  const CustomLinearProgressIndicator(),
                ],
              ],
            ),
          ),
          StandardRxResultBuilder<UserStatusBloc, UserStatus?>(
            bloc: RxBlocProvider.of<AccountsBloc>(context).getUserStatusBloc(account),
            state: (final bloc) => bloc.userStatus,
            builder: (
              final context,
              final userStatusData,
              final userStatusError,
              final userStatusLoading,
              final _,
            ) =>
                SizedBox(
              height: kAvatarSize,
              width: kAvatarSize,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: kAvatarSize / 3,
                  width: kAvatarSize / 3,
                  decoration: userStatusLoading || userStatusError != null || userStatusData == null
                      ? null
                      : BoxDecoration(
                          shape: BoxShape.circle,
                          color: _userStatusToColor(userStatusData),
                          border: userStatusData.status != UserStatusType.offline &&
                                  userStatusData.status != UserStatusType.invisible
                              ? Border.all(
                                  color: Theme.of(context).colorScheme.onPrimary,
                                )
                              : null,
                        ),
                  child: userStatusLoading
                      ? CircularProgressIndicator(
                          strokeWidth: 1.5,
                          color: Theme.of(context).colorScheme.onPrimary,
                        )
                      : userStatusError != null &&
                              (userStatusError is! ApiException || userStatusError.statusCode != 404)
                          ? const Icon(
                              Icons.error_outline,
                              size: kAvatarSize / 3,
                              color: Colors.red,
                            )
                          : null,
                ),
              ),
            ),
          ),
        ],
      );

  Color _userStatusToColor(final UserStatus userStatus) {
    switch (userStatus.status) {
      case UserStatusType.online:
        return const Color(0xFF49B382);
      case UserStatusType.away:
        return const Color(0xFFF4A331);
      case UserStatusType.dnd:
        return const Color(0xFFED484C);
      default:
        return Colors.transparent;
    }
  }
}
