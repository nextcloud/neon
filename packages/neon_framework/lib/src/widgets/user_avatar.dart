import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/src/models/account.dart';
import 'package:neon_framework/src/theme/icons.dart';
import 'package:neon_framework/src/theme/sizes.dart';
import 'package:neon_framework/src/utils/provider.dart';
import 'package:neon_framework/src/widgets/image.dart';
import 'package:neon_framework/src/widgets/user_status_icon.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud/user_status.dart' as user_status;

/// A circle that contains the user profile image and status.
class NeonUserAvatar extends StatefulWidget {
  /// Creates a new Neon user avatar.
  const NeonUserAvatar({
    this.username,
    this.showStatus = true,
    this.size,
    super.key,
  }) : account = null;

  /// Creates a new Neon user avatar with the given [account].
  const NeonUserAvatar.withAccount({
    required Account this.account,
    this.username,
    this.showStatus = true,
    this.size,
    super.key,
  });

  /// The account used to fetch the image.
  ///
  /// Defaults to the currently active account in [AccountsBloc.activeAccount].
  final Account? account;

  /// The user profile to display.
  ///
  /// Defaults to the username of [account].
  final String? username;

  /// Whether to show the status.
  final bool showStatus;

  /// The size of the avatar.
  final double? size;

  @override
  State<NeonUserAvatar> createState() => _UserAvatarState();
}

class _UserAvatarState extends State<NeonUserAvatar> {
  late Account account;
  late String username;
  UserStatusBloc? userStatusBloc;
  late double size;

  @override
  void initState() {
    super.initState();

    final accountsBloc = NeonProvider.of<AccountsBloc>(context);
    account = widget.account ?? accountsBloc.activeAccount.value!;
    username = widget.username ?? account.username;

    if (widget.showStatus) {
      userStatusBloc = accountsBloc.getUserStatusBlocFor(account)..load(username);
    }
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final brightness = Theme.of(context).brightness;
          size = constraints.constrain(Size.square(widget.size ?? largeIconSize)).shortestSide;
          final pixelSize = (size * MediaQuery.of(context).devicePixelRatio).toInt();

          final avatar = CircleAvatar(
            radius: size / 2,
            child: ClipOval(
              child: NeonApiImage.withAccount(
                account: account,
                cacheKey: 'avatar-$username-$brightness-$pixelSize',
                etag: null,
                expires: null,
                getImage: (client) async => switch (brightness) {
                  Brightness.dark => client.core.avatar.getAvatarDarkRaw(
                      userId: username,
                      size: pixelSize,
                    ),
                  Brightness.light => client.core.avatar.getAvatarRaw(
                      userId: username,
                      size: pixelSize,
                    ),
                },
              ),
            ),
          );

          if (!widget.showStatus) {
            return avatar;
          }
          return Stack(
            alignment: Alignment.center,
            children: [
              avatar,
              ResultBuilder(
                stream: userStatusBloc!.statuses.map(
                  (statuses) => statuses[username] ?? Result<user_status.$PublicInterface>.loading(),
                ),
                builder: (context, result) => NeonUserStatusIndicator(
                  result: result,
                  size: size,
                ),
              ),
            ],
          );
        },
      );
}

@internal
class NeonUserStatusIndicator extends StatelessWidget {
  const NeonUserStatusIndicator({
    required this.result,
    required this.size,
    super.key,
  });

  final Result<user_status.$PublicInterface> result;

  final double size;

  @override
  Widget build(BuildContext context) {
    Widget? child;
    if (result.isLoading) {
      child = CircularProgressIndicator(
        strokeWidth: 1.5,
        color: Theme.of(context).colorScheme.onPrimary,
      );
    } else if (result.hasError) {
      child = Icon(
        AdaptiveIcons.error_outline,
        size: size / 2.5,
        color: Theme.of(context).colorScheme.error,
      );
    } else if (result.hasData) {
      final type = result.requireData.status;
      final hasEmoji = result.data?.icon != null;
      if (type == user_status.$Type.dnd || !hasEmoji) {
        child = NeonUserStatusIcon(
          type: type,
          size: 16,
        );
      } else if (hasEmoji) {
        child = Text(
          result.data!.icon!,
          style: const TextStyle(
            fontSize: 14,
          ),
        );
      }
    }

    return SizedBox.square(
      dimension: size,
      child: Align(
        alignment: Alignment.bottomRight,
        child: child,
      ),
    );
  }
}
