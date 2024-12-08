import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/src/theme/icons.dart';
import 'package:neon_framework/src/theme/sizes.dart';
import 'package:neon_framework/src/widgets/image.dart';
import 'package:neon_framework/src/widgets/user_status_icon.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud/user_status.dart' as user_status;

/// A circle that contains the user profile image and status.
class NeonUserAvatar extends StatefulWidget {
  /// Creates a new Neon user avatar.
  const NeonUserAvatar({
    required this.account,
    this.userStatusBloc,
    this.userStatus,
    this.username,
    this.size,
    super.key,
  }) : assert(
          userStatusBloc == null || userStatus == null,
          'One of userStatusBloc and userStatus must be null',
        );

  /// The account used to fetch the image.
  final Account account;

  /// {@template neon_framework.UserStatus.userStatusBloc}
  /// The user status bloc used for displaying the user status.
  ///
  /// If `null` and [userStatus] is null too no status will be displayed.
  /// {@endtemplate}
  final UserStatusBloc? userStatusBloc;

  /// The displayed user status.
  ///
  /// If `null` and [userStatusBloc] is null too no status will be displayed.
  final user_status.$PublicInterface? userStatus;

  /// The user profile to display.
  ///
  /// Defaults to the username of [account].
  final String? username;

  /// The size of the avatar.
  final double? size;

  @override
  State<NeonUserAvatar> createState() => _UserAvatarState();
}

class _UserAvatarState extends State<NeonUserAvatar> {
  late String username;

  @override
  void initState() {
    super.initState();

    username = widget.username ?? widget.account.username;

    widget.userStatusBloc?.load(username);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final brightness = Theme.of(context).brightness;
        final size = constraints.constrain(Size.square(widget.size ?? largeIconSize)).shortestSide;
        final pixelSize = (size * MediaQuery.of(context).devicePixelRatio).toInt();

        final avatar = CircleAvatar(
          radius: size / 2,
          child: ClipOval(
            child: NeonApiImage(
              key: Key('avatar-${widget.account.id}-$username-$brightness-$pixelSize'),
              account: widget.account,
              etag: null,
              expires: null,
              getRequest: (client) => switch (brightness) {
                Brightness.dark => client.core.avatar.$getAvatarDark_Request(
                    userId: username,
                    size: pixelSize <= 64 ? core.AvatarGetAvatarDarkSize.$64 : core.AvatarGetAvatarDarkSize.$512,
                  ),
                Brightness.light => client.core.avatar.$getAvatar_Request(
                    userId: username,
                    size: pixelSize <= 64 ? core.AvatarGetAvatarSize.$64 : core.AvatarGetAvatarSize.$512,
                  ),
              },
            ),
          ),
        );

        final userStatusBloc = widget.userStatusBloc;
        if (userStatusBloc != null) {
          return Stack(
            alignment: Alignment.center,
            children: [
              avatar,
              ResultBuilder(
                stream: userStatusBloc.statuses.map(
                  (statuses) => statuses[username] ?? Result<user_status.$PublicInterface>.loading(),
                ),
                builder: (context, result) => NeonUserStatusIndicator(
                  result: result,
                  size: size,
                ),
              ),
            ],
          );
        }

        final userStatus = widget.userStatus;
        if (userStatus != null) {
          return Stack(
            alignment: Alignment.center,
            children: [
              avatar,
              NeonUserStatusIndicator(
                result: Result.success(userStatus),
                size: size,
              ),
            ],
          );
        }

        return avatar;
      },
    );
  }
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
      child = SizedBox.square(
        dimension: size / 2.5,
        child: CircularProgressIndicator(
          strokeWidth: 1.5,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
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
          size: size / 2.5,
        );
      } else if (hasEmoji) {
        child = Text(
          result.data!.icon!,
          style: TextStyle(
            fontSize: size / 3,
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
