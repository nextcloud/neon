import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:neon_talk/l10n/localizations.dart';
import 'package:nextcloud/spreed.dart' as spreed;

/// Returns the display name of the actor of the [chatMessage].
///
/// In case the actor is a guest and has no display name set a default display
/// name will be returned.
@internal
String getActorDisplayName(
  TalkLocalizations localizations,
  spreed.$ChatMessageInterface chatMessage,
) {
  final actorDisplayName = chatMessage.actorDisplayName;

  if (actorDisplayName.isEmpty &&
      chatMessage.actorType == spreed.ActorType.guests) {
    return localizations.actorGuest;
  }

  return actorDisplayName;
}

/// Renders the [chatMessage] as a rich [TextSpan].
@internal
TextSpan buildChatMessage({
  required spreed.$ChatMessageInterface chatMessage,
  bool isPreview = false,
  TextStyle? style,
}) {
  var message = chatMessage.message;
  if (isPreview) {
    message = message.replaceAll('\n', ' ');
  }

  return TextSpan(
    text: message,
    style: style,
  );
}

/// Displays a preview of the [chatMessage] including the display name of the
/// sender.
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
    if (chatMessage.messageType != spreed.MessageType.system) {
      if (chatMessage.actorId == actorId) {
        actorName = TalkLocalizations.of(context).actorSelf;
      } else if (!roomType.isSingleUser) {
        actorName =
            getActorDisplayName(TalkLocalizations.of(context), chatMessage);
      }
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
            isPreview: true,
          ),
        ],
      ),
    );
  }
}
