part of '../neon.dart';

const kAvatarSize = 40.0;

class AccountAvatar extends StatelessWidget {
  const AccountAvatar({
    required this.account,
    super.key,
  });

  final Account account;

  @override
  Widget build(final BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = (kAvatarSize * MediaQuery.of(context).devicePixelRatio).toInt();
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: kAvatarSize / 2,
          child: ClipOval(
            child: CachedAPIImage(
              account: account,
              cacheKey: 'avatar-${account.id}-${isDark ? 'dark' : 'light'}$size',
              download: () async {
                if (isDark) {
                  return account.client.core.getDarkAvatar(
                    userId: account.username,
                    size: size,
                  );
                } else {
                  return account.client.core.getAvatar(
                    userId: account.username,
                    size: size,
                  );
                }
              },
            ),
          ),
        ),
        ResultBuilder<UserStatusBloc, NextcloudUserStatusStatus?>(
          stream: Provider.of<AccountsBloc>(context, listen: false).getUserStatusBloc(account).userStatus,
          builder: (final context, final userStatus) => SizedBox(
            height: kAvatarSize,
            width: kAvatarSize,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: kAvatarSize / 3,
                width: kAvatarSize / 3,
                decoration: userStatus.loading || userStatus.error != null || userStatus.data == null
                    ? null
                    : BoxDecoration(
                        shape: BoxShape.circle,
                        color: _userStatusToColor(userStatus.data!),
                      ),
                child: userStatus.loading
                    ? CircularProgressIndicator(
                        strokeWidth: 1.5,
                        color: Theme.of(context).colorScheme.onPrimary,
                      )
                    : userStatus.error != null &&
                            (userStatus.error is! NextcloudApiException ||
                                (userStatus.error! as NextcloudApiException).statusCode != 404)
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
  }

  Color _userStatusToColor(final NextcloudUserStatusStatus userStatus) {
    switch (userStatus.status) {
      case NextcloudUserStatusType.online:
        return const Color(0xFF49B382);
      case NextcloudUserStatusType.away:
        return const Color(0xFFF4A331);
      case NextcloudUserStatusType.dnd:
        return const Color(0xFFED484C);
      default:
        return Colors.transparent;
    }
  }
}
