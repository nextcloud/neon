import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/src/models/account.dart';
import 'package:neon_framework/src/theme/icons.dart';
import 'package:neon_framework/src/theme/sizes.dart';
import 'package:neon_framework/src/widgets/image.dart';
import 'package:neon_framework/src/widgets/user_status_icon.dart';
import 'package:nextcloud/core.dart';
import 'package:nextcloud/user_status.dart' as user_status;

/// A circle that contains the user profile image and status.
class NeonUserAvatar extends StatefulWidget {
  /// Creates a new Neon user avatar.
  const NeonUserAvatar({
    required this.account,
    required this.userStatusBloc,
    this.username,
    this.size,
    super.key,
  });

  /// The account used to fetch the image.
  final Account account;

  /// {@template neon_framework.UserStatus.userStatusBloc}
  /// The user status bloc used for displaying the user status.
  ///
  /// If `null` no status will be displayed.
  /// {@endtemplate}
  final UserStatusBloc? userStatusBloc;

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
  late double size;

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
        size = constraints.constrain(Size.square(widget.size ?? largeIconSize)).shortestSide;
        final pixelSize = (size * MediaQuery.of(context).devicePixelRatio).toInt();

        final avatar = CircleAvatar(
          radius: size / 2,
          child: ClipOval(
            child: NeonApiImage(
              account: widget.account,
              cacheKey: 'avatar-$username-$brightness-$pixelSize',
              etag: null,
              expires: null,
              getRequest: (client) => switch (brightness) {
                Brightness.dark => client.core.avatar.$getAvatarDark_Request(
                    userId: username,
                    size: pixelSize,
                  ),
                Brightness.light => client.core.avatar.$getAvatar_Request(
                    userId: username,
                    size: pixelSize,
                  ),
              },
            ),
          ),
        );

        if (widget.userStatusBloc == null) {
          return avatar;
        }

        return Stack(
          alignment: Alignment.center,
          children: [
            avatar,
            ResultBuilder(
              stream: widget.userStatusBloc!.statuses.map(
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
