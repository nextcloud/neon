import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:neon_talk/src/blocs/room.dart';
import 'package:nextcloud/spreed.dart' as spreed;

/// Widget for displaying the current reactions on a chat message including the ability to add and remove reactions.
class TalkReactions extends StatelessWidget {
  /// Creates new Talk reactions.
  const TalkReactions({
    required this.chatMessage,
    super.key,
  });

  /// The chat message to display the reactions for.
  final spreed.$ChatMessageInterface chatMessage;

  @override
  Widget build(BuildContext context) {
    const shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
    );

    final children = <Widget>[];
    for (final reaction in chatMessage.reactions.entries) {
      final isSelf = chatMessage.reactionsSelf?.contains(reaction.key) ?? false;

      children.add(
        ActionChip(
          backgroundColor: isSelf ? Theme.of(context).colorScheme.primary : null,
          shape: shape,
          avatar: Text(reaction.key),
          label: Text(
            reaction.value.toString(),
            style: const TextStyle(
              fontSize: 12,
              fontFamily: 'monospace',
            ),
          ),
          padding: EdgeInsets.zero,
          labelPadding: const EdgeInsets.only(
            top: -2.5,
            bottom: -2.5,
            right: 10,
          ),
          onPressed: () {
            final bloc = NeonProvider.of<TalkRoomBloc>(context);

            if (isSelf) {
              bloc.removeReaction(chatMessage, reaction.key);
            } else {
              bloc.addReaction(chatMessage, reaction.key);
            }
          },
        ),
      );
    }

    children.add(
      ActionChip(
        shape: shape,
        avatar: Icon(
          Icons.add_reaction_outlined,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          size: 16,
        ),
        label: const SizedBox(),
        padding: EdgeInsets.zero,
        labelPadding: const EdgeInsets.symmetric(vertical: -2.5),
        onPressed: () async {
          final reaction = await showDialog<String>(
            context: context,
            builder: (context) => const NeonEmojiPickerDialog(),
          );
          if (reaction == null) {
            return;
          }

          if (!context.mounted) {
            return;
          }

          NeonProvider.of<TalkRoomBloc>(context).addReaction(chatMessage, reaction);
        },
      ),
    );

    return Row(
      children: children
          .intersperse(
            const SizedBox(
              width: 5,
            ),
          )
          .toList(),
    );
  }
}
