import 'package:flutter/material.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/spreed.dart' as spreed;

/// Displays the avatar of the [room].
///
/// If the room has a custom avatar it will be displayed. If that is not the case and it is a
/// [spreed.RoomType.oneToOne] the user avatar will be shown, otherwise an appropriate icon is displayed.
class TalkRoomAvatar extends StatelessWidget {
  /// Creates a new Talk room avatar.
  const TalkRoomAvatar({
    required this.room,
    super.key,
  });

  /// The room to display the avatar for.
  final spreed.Room room;

  @override
  Widget build(BuildContext context) {
    if (room.isCustomAvatar ?? false) {
      final brightness = Theme.of(context).brightness;

      return CircleAvatar(
        child: ClipOval(
          child: NeonApiImage(
            getImage: (client) async => switch (brightness) {
              Brightness.dark => client.spreed.avatar.getAvatarDark(token: room.token),
              Brightness.light => client.spreed.avatar.getAvatar(token: room.token),
            },
            cacheKey: 'talk-room-${room.token}-avatar-$brightness',
            etag: room.avatarVersion,
            expires: null,
          ),
        ),
      );
    }

    return switch (spreed.RoomType.fromValue(room.type)) {
      spreed.RoomType.oneToOne => NeonUserAvatar(
          username: room.name,
        ),
      spreed.RoomType.group => _buildIconAvatar(AdaptiveIcons.group),
      // coverage:ignore-start
      spreed.RoomType.public => _buildIconAvatar(AdaptiveIcons.link),
      spreed.RoomType.changelog => _buildIconAvatar(AdaptiveIcons.text_snippet_outlined),
      spreed.RoomType.oneToOneFormer => _buildIconAvatar(AdaptiveIcons.lock),
      spreed.RoomType.noteToSelf => _buildIconAvatar(AdaptiveIcons.edit_note),
      // coverage:ignore-end
    };
  }

  Widget _buildIconAvatar(IconData icon) => CircleAvatar(
        child: Icon(
          icon,
        ),
      );
}
