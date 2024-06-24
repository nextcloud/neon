import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:neon_talk/l10n/localizations.dart';
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
    final bloc = NeonProvider.of<TalkRoomBloc>(context);

    const shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
    );

    return MouseRegion(
      onEnter: (_) {
        bloc.loadReactions(chatMessage);
      },
      child: StreamBuilder(
        stream: bloc.reactions,
        builder: (context, reactionsSnapshot) {
          final reactions = reactionsSnapshot.data?[chatMessage.id];

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
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'monospace',
                    color: isSelf ? Theme.of(context).colorScheme.onPrimary : null,
                  ),
                ),
                tooltip: reactions?[reaction.key]?.map((r) => r.actorDisplayName).join(', ') ??
                    TalkLocalizations.of(context).reactionsLoading,
                padding: EdgeInsets.zero,
                labelPadding: const EdgeInsets.only(
                  top: -2.5,
                  bottom: -2.5,
                  right: 10,
                ),
                onPressed: () {
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
              tooltip: TalkLocalizations.of(context).reactionsAddNew,
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

                bloc.addReaction(chatMessage, reaction);
              },
            ),
          );

          return Row(
            mainAxisSize: MainAxisSize.min,
            children: children
                .intersperse(
                  const SizedBox(
                    width: 5,
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
