import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:neon_talk/l10n/localizations.dart';
import 'package:neon_talk/src/blocs/room.dart';
import 'package:neon_talk/src/widgets/message.dart';
import 'package:nextcloud/spreed.dart' as spreed;

/// Widget for displaying the emoji button, text input and send button.
class TalkMessageInput extends StatefulWidget {
  /// Creates a new Talk message input.
  const TalkMessageInput({
    super.key,
  });

  @override
  State<TalkMessageInput> createState() => _TalkMessageInputState();
}

class _TalkMessageInputState extends State<TalkMessageInput> {
  final controller = TextEditingController();
  late final focusNode = FocusNode(
    onKeyEvent: (node, event) {
      if (event.logicalKey.keyLabel == 'Enter') {
        if (event is KeyDownEvent) {
          if (HardwareKeyboard.instance.isShiftPressed) {
            final selection = controller.selection;
            final text = controller.text;
            controller
              ..text = '${text.substring(0, selection.start)}\n${text.substring(selection.start)}'
              ..selection = selection.copyWith(
                baseOffset: selection.start + 1,
                extentOffset: selection.end + 1,
              );
          } else {
            sendMessage();
          }
        }
        return KeyEventResult.handled;
      } else {
        return KeyEventResult.ignored;
      }
    },
  );
  late TalkRoomBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = NeonProvider.of<TalkRoomBloc>(context);

    bloc.replyTo.listen((replyTo) {
      if (replyTo != null) {
        focusNode.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void sendMessage() {
    final message = controller.text;
    if (message.isNotEmpty) {
      bloc.sendMessage(message);
      controller.clear();
    }
    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    Widget? emojiButton;
    // On cupertino the keyboard always has an option to insert emojis, so we don't need to add it
    if (!isCupertino(context)) {
      emojiButton = IconButton(
        tooltip: TalkLocalizations.of(context).roomMessageAddEmoji,
        onPressed: () async {
          final emoji = await showDialog<String>(
            context: context,
            builder: (context) => const NeonEmojiPickerDialog(),
          );
          if (emoji != null) {
            final text = controller.text;
            final textSelection = controller.selection;

            controller
              ..text = text.replaceRange(textSelection.start, textSelection.end, emoji)
              ..selection = textSelection.copyWith(
                baseOffset: textSelection.start + emoji.length,
                extentOffset: textSelection.start + emoji.length,
              );
          }
        },
        icon: const Icon(Icons.emoji_emotions_outlined),
      );
    }

    final replyTo = StreamBuilder(
      stream: bloc.replyTo,
      builder: (context, replyToSnapshot) {
        if (!replyToSnapshot.hasData) {
          return const SizedBox();
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Row(
            children: [
              const SizedBox.square(
                dimension: 40,
              ),
              Expanded(
                child: TalkParentMessage(
                  parentChatMessage: replyToSnapshot.requireData!,
                  lastCommonRead: null,
                ),
              ),
              IconButton(
                onPressed: () {
                  bloc.removeReplyChatMessage();
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
        );
      },
    );

    final inputField = TypeAheadField<_Suggestion>(
      direction: VerticalDirection.up,
      hideOnEmpty: true,
      debounceDuration: const Duration(milliseconds: 50),
      controller: controller,
      focusNode: focusNode,
      suggestionsCallback: (_) async {
        final cursor = controller.selection.start;
        if (controller.text.isEmpty || cursor != controller.selection.end) {
          return [];
        }

        String? matchingPart = controller.text.substring(0, cursor);
        final index = matchingPart.lastIndexOf(' ') + 1;
        matchingPart = matchingPart.substring(index);
        if (!matchingPart.startsWith('@') || matchingPart.isEmpty) {
          return [];
        }

        final account = NeonProvider.of<Account>(context);
        final response = await account.client.spreed.chat.mentions(
          search: matchingPart.substring(1),
          token: bloc.room.value.requireData.token,
          limit: 5,
        );

        return response.body.ocs.data
            .map(
              (mention) => _Suggestion(
                start: cursor - matchingPart!.length,
                end: cursor,
                mention: mention,
              ),
            )
            .toList();
      },
      onSelected: (suggestion) {
        final value = '@"${suggestion.mention.id}"';
        final cursor = suggestion.start + value.length + 1;

        controller
          ..text = controller.text.replaceRange(suggestion.start, suggestion.end, '$value ')
          ..selection = controller.selection.copyWith(
            baseOffset: cursor,
            extentOffset: cursor,
          );
      },
      itemBuilder: buildResult,
      builder: (context, controller, focusNode) => TextFormField(
        controller: controller,
        focusNode: focusNode,
        textInputAction: TextInputAction.newline,
        keyboardType: TextInputType.multiline,
        minLines: 1,
        maxLines: 5,
        decoration: InputDecoration(
          prefixIcon: emojiButton,
          suffixIcon: IconButton(
            tooltip: TalkLocalizations.of(context).roomMessageSend,
            icon: Icon(AdaptiveIcons.send),
            onPressed: sendMessage,
          ),
          hintText: TalkLocalizations.of(context).roomWriteMessage,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        onFieldSubmitted: (_) {
          sendMessage();
        },
      ),
      errorBuilder: (context, error) => IntrinsicHeight(
        child: NeonError(
          error,
          onRetry: null,
        ),
      ),
      loadingBuilder: (context) => const NeonLinearProgressIndicator(),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        replyTo,
        inputField,
      ],
    );
  }

  Widget buildResult(BuildContext context, _Suggestion suggestion) {
    final icon = switch (suggestion.mention.source) {
      'users' => NeonUserAvatar(
          account: NeonProvider.of<Account>(context),
          userStatusBloc: NeonProvider.of<UserStatusBloc>(context),
          username: suggestion.mention.id,
        ),
      'groups' || 'calls' => CircleAvatar(
          child: Icon(
            AdaptiveIcons.group,
          ),
        ),
      // coverage:ignore-start
      _ => throw UnimplementedError('Chat mention suggestion source ${suggestion.mention.source} has no icon'),
      // coverage:ignore-end
    };

    return ListTile(
      title: Text(suggestion.mention.label),
      subtitle: Text(suggestion.mention.id),
      leading: icon,
    );
  }
}

class _Suggestion {
  _Suggestion({
    required this.start,
    required this.end,
    required this.mention,
  });

  final int start;
  final int end;
  final spreed.ChatMentionSuggestion mention;
}
