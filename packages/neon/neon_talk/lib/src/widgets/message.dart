import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';
import 'package:intl/intl.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_talk/l10n/localizations.dart';
import 'package:neon_talk/src/widgets/actor_avatar.dart';
import 'package:neon_talk/src/widgets/reactions.dart';
import 'package:nextcloud/spreed.dart' as spreed;
import 'package:nextcloud/utils.dart';
import 'package:timezone/timezone.dart' as tz;

final _timeFormat = DateFormat.jm();

/// Returns the display name of the actor of the [chatMessage].
///
/// In case the actor is a guest and has no display name set a default display name will be returned.
String getActorDisplayName(TalkLocalizations localizations, spreed.$ChatMessageInterface chatMessage) {
  final actorDisplayName = chatMessage.actorDisplayName;

  if (actorDisplayName.isEmpty && chatMessage.actorType == spreed.ActorType.guests) {
    return localizations.actorGuest;
  }

  return actorDisplayName;
}

/// Renders the [chatMessage] as a rich [TextSpan].
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

  /// {@macro TalkMessage.chatMessage}
  final spreed.$ChatMessageInterface chatMessage;

  @override
  Widget build(BuildContext context) {
    String? actorName;
    if (chatMessage.messageType != spreed.MessageType.system) {
      if (chatMessage.actorId == actorId) {
        actorName = TalkLocalizations.of(context).actorSelf;
      } else if (!roomType.isSingleUser) {
        actorName = getActorDisplayName(TalkLocalizations.of(context), chatMessage);
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

/// Displays a Talk chat message in the right way based on the message type.
class TalkMessage extends StatelessWidget {
  /// Creates a new Talk message.
  const TalkMessage({
    required this.chatMessage,
    this.previousChatMessage,
    this.isParent = false,
    super.key,
  });

  /// {@template TalkMessage.chatMessage}
  /// The chat message to display.
  /// {@endtemplate}
  final spreed.$ChatMessageInterface chatMessage;

  /// {@template TalkMessage.previousChatMessage}
  /// The previous chat message.
  /// {@endtemplate}
  final spreed.$ChatMessageInterface? previousChatMessage;

  /// {@template TalkMessage.isParent}
  /// Whether the displayed chat message is a parent chat message that was replied to.
  /// {@endtemplate}
  final bool isParent;

  @override
  Widget build(BuildContext context) {
    if (chatMessage.messageType == spreed.MessageType.system) {
      return TalkSystemMessage(
        chatMessage: chatMessage,
      );
    }

    return TalkCommentMessage(
      chatMessage: chatMessage,
      previousChatMessage: previousChatMessage,
      isParent: isParent,
    );
  }
}

/// Displays a system chat message.
class TalkSystemMessage extends StatelessWidget {
  /// Creates a new Talk system message.
  const TalkSystemMessage({
    required this.chatMessage,
    super.key,
  });

  /// {@macro TalkMessage.chatMessage}
  final spreed.$ChatMessageInterface chatMessage;

  // Keep this in sync with https://github.com/nextcloud/spreed/blob/24b1dc8f8d6fa30b0c6dec95f27b69ca59314633/src/store/conversationsStore.js#L706
  static const _ignoredMessages = {
    'reaction',
    'reaction_revoked',
    'reaction_deleted',
    'message_deleted',
    'poll_voted',
  };

  @override
  Widget build(BuildContext context) {
    if (_ignoredMessages.contains(chatMessage.systemMessage)) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: RichText(
          text: buildChatMessage(
            chatMessage: chatMessage,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      ),
    );
  }
}

/// Displays a parent chat message that was replied to.
class TalkParentMessage extends StatelessWidget {
  /// Creates a new Talk parent message.
  const TalkParentMessage({
    required this.parentChatMessage,
    super.key,
  });

  /// The parent chat message.
  ///
  /// Do not pass the child chat message.
  final spreed.$ChatMessageInterface parentChatMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondaryContainer,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TalkMessage(
        chatMessage: parentChatMessage,
        isParent: true,
      ),
    );
  }
}

/// Displays a comment chat message including voice messages, recorded audio and video and reactions.
class TalkCommentMessage extends StatelessWidget {
  /// Creates a new Talk comment message.
  const TalkCommentMessage({
    required this.chatMessage,
    this.previousChatMessage,
    this.isParent = false,
    super.key,
  });

  /// {@macro TalkMessage.chatMessage}
  final spreed.$ChatMessageInterface chatMessage;

  /// {@macro TalkMessage.previousChatMessage}
  final spreed.$ChatMessageInterface? previousChatMessage;

  /// {@macro TalkMessage.isParent}
  final bool isParent;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final date = DateTimeUtils.fromSecondsSinceEpoch(
      tz.UTC,
      chatMessage.timestamp,
    );
    tz.TZDateTime? previousDate;
    if (previousChatMessage != null) {
      previousDate = DateTimeUtils.fromSecondsSinceEpoch(
        tz.UTC,
        previousChatMessage!.timestamp,
      );
    }

    final separateMessages = chatMessage.actorId != previousChatMessage?.actorId ||
        previousChatMessage?.messageType == spreed.MessageType.system ||
        previousDate == null ||
        date.difference(previousDate) > const Duration(minutes: 3);

    Widget? displayName;
    Widget? avatar;
    Widget? time;
    if (separateMessages) {
      displayName = Text(
        getActorDisplayName(TalkLocalizations.of(context), chatMessage),
        style: textTheme.labelSmall,
      );

      if (!isParent) {
        avatar = TalkActorAvatar(
          actorId: chatMessage.actorId,
          actorType: chatMessage.actorType,
        );

        time = Text(
          _timeFormat.format(date),
          style: textTheme.labelSmall,
        );
      }
    }

    Widget? parent;
    if (chatMessage
        case spreed.ChatMessageWithParent(
          parent: final p,
          messageType: != spreed.MessageType.commentDeleted,
        ) when p != null) {
      parent = TalkParentMessage(
        parentChatMessage: p,
      );
    }

    double topMargin;
    if (isParent) {
      topMargin = 5;
    } else if (separateMessages) {
      topMargin = 20;
    } else {
      topMargin = 0;
    }

    Widget text = RichText(
      maxLines: isParent ? 1 : null,
      overflow: isParent ? TextOverflow.ellipsis : TextOverflow.visible,
      text: buildChatMessage(
        chatMessage: chatMessage,
        isPreview: isParent,
        style: isParent || chatMessage.messageType == spreed.MessageType.commentDeleted
            ? textTheme.bodySmall
            : textTheme.bodyMedium,
      ),
    );
    if (chatMessage.messageType == spreed.MessageType.commentDeleted) {
      text = Row(
        children: [
          Icon(
            AdaptiveIcons.cancel,
            size: textTheme.bodySmall!.fontSize,
          ),
          const SizedBox(
            width: 2.5,
          ),
          text,
        ],
      );
    }

    return Container(
      margin: EdgeInsets.only(
        top: topMargin,
        bottom: 5,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isParent)
            SizedBox(
              width: 40,
              child: avatar,
            ),
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (displayName != null) displayName,
                      if (parent != null) parent,
                      text,
                      if (!isParent && chatMessage.reactions.isNotEmpty)
                        TalkReactions(
                          reactions: chatMessage.reactions,
                        ),
                    ]
                        .intersperse(
                          const SizedBox(
                            height: 5,
                          ),
                        )
                        .toList(),
                  ),
                ),
                if (time != null) time,
              ]
                  .intersperse(
                    const SizedBox(
                      width: 10,
                    ),
                  )
                  .toList(),
            ),
          ),
        ]
            .intersperse(
              const SizedBox(
                width: 10,
              ),
            )
            .toList(),
      ),
    );
  }
}
