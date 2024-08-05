import 'package:flutter/material.dart';
import 'package:nextcloud/spreed.dart' as spreed;

/// Displays the number of unread messages and whether the user was mentioned for a given [room].
class TalkUnreadIndicator extends StatelessWidget {
  /// Creates a new Talk unread indicator.
  const TalkUnreadIndicator({
    required this.room,
    super.key,
  });

  /// The room that the indicator will display unread messages and mentions for.
  final spreed.Room room;

  @override
  Widget build(BuildContext context) {
    assert(room.unreadMessages > 0, 'Need at least on unread message');

    final colorScheme = Theme.of(context).colorScheme;

    final highlight = room.unreadMention || spreed.RoomType.fromValue(room.type).isSingleUser;
    final backgroundColor = highlight ? colorScheme.primaryContainer : colorScheme.surface;
    final textColor = highlight ? colorScheme.onPrimaryContainer : colorScheme.onSurface;

    Widget? avatar;
    if (room.unreadMentionDirect) {
      avatar = Icon(
        Icons.alternate_email,
        size: 20,
        color: textColor,
      );
    }

    return Chip(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        side: BorderSide(
          color: colorScheme.primaryContainer,
        ),
      ),
      padding: const EdgeInsets.all(-2),
      backgroundColor: backgroundColor,
      avatar: avatar,
      label: Text(
        room.unreadMessages.toString(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'monospace',
          color: textColor,
        ),
      ),
    );
  }
}
