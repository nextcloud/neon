import 'package:flutter/material.dart';
import 'package:neon_talk/l10n/localizations.dart';
import 'package:neon_talk/src/utils/message.dart';
import 'package:nextcloud/spreed.dart' as spreed;

/// Displays a preview of the [chatMessage] including the display name of the sender.
class TalkMessagePreview extends StatelessWidget {
  /// Creates a new Talk message preview.
  const TalkMessagePreview({
    required this.actorId,
    required this.roomType,
    required this.chatMessage,
    super.key,
  });

  /// ID of the current actor.
  final String actorId;

  /// Type of the room
  final spreed.RoomType roomType;

  /// The chat message to preview.
  final spreed.ChatMessage chatMessage;

  @override
  Widget build(BuildContext context) {
    String? actorName;
    if (chatMessage.actorId == actorId) {
      actorName = TalkLocalizations.of(context).actorSelf;
    } else if (!roomType.isSingleUser) {
      actorName = chatMessage.actorDisplayName;
    }

    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        style: TextStyle(
          color: Theme.of(context).colorScheme.onBackground,
        ),
        children: [
          if (actorName != null)
            TextSpan(
              text: '$actorName: ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          buildChatMessage(
            chatMessage: chatMessage,
          ),
        ],
      ),
    );
  }
}
