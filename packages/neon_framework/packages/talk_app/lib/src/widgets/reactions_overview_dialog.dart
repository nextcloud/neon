import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/spreed.dart' as spreed;
import 'package:talk_app/l10n/localizations.dart';
import 'package:talk_app/src/blocs/room.dart';
import 'package:talk_app/src/utils/helpers.dart';
import 'package:talk_app/src/widgets/actor_avatar.dart';

/// Dialog that displays all reactions of all users for a particular chat message.
class TalkReactionsOverviewDialog extends StatefulWidget {
  /// Creates a new [TalkReactionsOverviewDialog].
  const TalkReactionsOverviewDialog({
    required this.chatMessage,
    super.key,
  });

  /// The chat message to show reactions for.
  final spreed.$ChatMessageInterface chatMessage;

  @override
  State<TalkReactionsOverviewDialog> createState() => _TalkReactionsOverviewDialogState();
}

class _TalkReactionsOverviewDialogState extends State<TalkReactionsOverviewDialog> {
  late final TalkRoomBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = NeonProvider.of<TalkRoomBloc>(context);
    bloc.loadReactions(widget.chatMessage);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = TalkLocalizations.of(context);

    return NeonDialog(
      title: Text(localizations.reactions),
      content: DefaultTabController(
        length: widget.chatMessage.reactions.length + 1,
        child: Scaffold(
          appBar: TabBar(
            tabs: [
              Tab(
                child: Text('${localizations.reactionsAll} ${widget.chatMessage.reactions.values.sum}'),
              ),
              for (final entry in widget.chatMessage.reactions.entries)
                Tab(
                  child: Text('${entry.key} ${entry.value}'),
                ),
            ],
          ),
          body: StreamBuilder(
            stream: bloc.reactions,
            builder: (context, reactionsSnapshot) {
              final children = <Widget>[];

              final allReactions = reactionsSnapshot.data?[widget.chatMessage.id];
              if (allReactions != null) {
                children.add(
                  ListView(
                    children: [
                      for (final entry in allReactions.entries)
                        for (final reaction in entry.value) buildReaction(entry.key, reaction),
                    ],
                  ),
                );
              } else {
                children.add(const CircularProgressIndicator());
              }

              for (final emoji in widget.chatMessage.reactions.keys) {
                final reactions = allReactions?[emoji];
                if (reactions != null) {
                  children.add(
                    ListView(
                      children: [
                        for (final reaction in reactions) buildReaction(emoji, reaction),
                      ],
                    ),
                  );
                } else {
                  children.add(const CircularProgressIndicator());
                }
              }

              return TabBarView(
                children: children,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildReaction(String emoji, spreed.$ReactionInterface reaction) {
    return ListTile(
      leading: TalkActorAvatar(
        actorId: reaction.actorId,
        actorType: reaction.actorType,
      ),
      title: Text(
        reaction.actorDisplayName,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(DateFormat.yMd().add_jm().format(reaction.parsedTimestamp)),
      trailing: Text(
        emoji,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
