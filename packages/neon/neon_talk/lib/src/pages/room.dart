import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as chat_types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart' as chat_ui;
import 'package:go_router/go_router.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:neon_talk/src/blocs/call.dart';
import 'package:neon_talk/src/blocs/room.dart';
import 'package:neon_talk/src/pages/call.dart';
import 'package:neon_talk/src/utils/text_matchers.dart';
import 'package:neon_talk/src/widgets/call_button.dart';
import 'package:neon_talk/src/widgets/room_avatar.dart';
import 'package:nextcloud/core.dart';
import 'package:nextcloud/spreed.dart' as spreed;

class TalkRoomPage extends StatefulWidget {
  const TalkRoomPage({
    required this.bloc,
    super.key,
  });

  final TalkRoomBloc bloc;

  @override
  State<TalkRoomPage> createState() => _TalkRoomPageState();
}

class _TalkRoomPageState extends State<TalkRoomPage> {
  final defaultChatTheme = const chat_ui.DefaultChatTheme();

  late final chatTheme = chat_ui.DefaultChatTheme(
    backgroundColor: Theme.of(context).colorScheme.background,
    primaryColor: Theme.of(context).colorScheme.primary,
    secondaryColor: Theme.of(context).colorScheme.secondary,
    inputBackgroundColor: Theme.of(context).colorScheme.primary,
    inputTextColor: Theme.of(context).colorScheme.onPrimary,
    inputTextCursorColor: Theme.of(context).colorScheme.onPrimary,
    receivedMessageBodyTextStyle: defaultChatTheme.receivedMessageBodyTextStyle.copyWith(
      color: Theme.of(context).colorScheme.onSecondary,
    ),
    sentMessageBodyTextStyle: defaultChatTheme.sentMessageBodyTextStyle.copyWith(
      color: Theme.of(context).colorScheme.onPrimary,
    ),
    unreadHeaderTheme: chat_ui.UnreadHeaderTheme(
      color: Theme.of(context).colorScheme.background,
      textStyle: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  final inputOptions = const chat_ui.InputOptions(
    sendButtonVisibilityMode: chat_ui.SendButtonVisibilityMode.always,
  );

  late final user = chat_types.User(
    id: widget.bloc.actorId,
  );

  void onSendPressed(chat_types.PartialText partialText) {
    widget.bloc.sendMessage(partialText.text);
  }

  Future<void> openCall(spreed.Room room) async {
    try {
      final client = NeonProvider.of<AccountsBloc>(context).activeAccount.value!.client;
      final settings = (await client.spreed.signaling.getSettings(token: widget.bloc.roomToken)).body.ocs.data;
      final bloc = TalkCallBloc(
        settings,
        client,
        widget.bloc.roomToken,
        room.sessionId,
      );
      if (!mounted) {
        return;
      }
      await Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (context) => TalkCallPage(
            bloc: bloc,
          ),
        ),
      );
      await bloc.leaveCall();
      bloc.dispose();
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      if (mounted) {
        NeonError.showSnackbar(context, e);
      }
    }
  }

  @override
  void initState() {
    super.initState();

    widget.bloc.errors.listen((error) {
      NeonError.showSnackbar(context, error);
    });
  }

  Iterable<Widget> _buildTitle(Result<spreed.Room> room) sync* {
    if (room.hasData) {
      final roomType = spreed.RoomType.fromValue(room.requireData.type);

      if (roomType.isSingleUser) {
        yield TalkRoomAvatar(
          room: room.requireData,
        );

        yield const SizedBox(
          width: 8,
        );
      }

      yield Flexible(
        child: Text(room.requireData.displayName),
      );
    }

    if (room.hasError) {
      yield const SizedBox(
        width: 8,
      );

      yield Icon(
        Icons.error_outline,
        size: 30,
        color: Theme.of(context).colorScheme.onPrimary,
      );
    }

    if (room.isLoading) {
      yield const SizedBox(
        width: 8,
      );

      yield Expanded(
        child: NeonLinearProgressIndicator(
          color: Theme.of(context).appBarTheme.foregroundColor,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: widget.bloc.allLoaded,
        builder: (context, allLoadedSnapshot) => ResultBuilder(
          stream: widget.bloc.room,
          builder: (context, room) => StreamBuilder(
            stream: widget.bloc.lastCommonReadMessageId,
            builder: (context, lastCommonReadMessageIdSnapshot) => StreamBuilder(
              stream: widget.bloc.sendingMessage,
              builder: (context, sendingMessageSnapshot) => ResultBuilder(
                stream: widget.bloc.messages,
                builder: (context, messages) {
                  final roomType = room.hasData ? spreed.RoomType.fromValue(room.requireData.type) : null;
                  return Scaffold(
                    resizeToAvoidBottomInset: false,
                    appBar: AppBar(
                      titleSpacing: 0,
                      title: Row(
                        children: _buildTitle(room).toList(),
                      ),
                      actions: [
                        if (room.hasData && room.requireData.readOnly == 0)
                          if (room.requireData.hasCall)
                            TalkCallButton(
                              type: TalkCallButtonType.joinCall,
                              onPressed: () async {
                                await openCall(room.requireData);
                              },
                            )
                          else if (room.requireData.canStartCall)
                            TalkCallButton(
                              type: TalkCallButtonType.startCall,
                              onPressed: () async {
                                await openCall(room.requireData);
                              },
                            ),
                      ],
                    ),
                    body: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 1120,
                        ),
                        child: chat_ui.Chat(
                          useTopSafeAreaInset: false,
                          showUserNames: true,
                          showUserAvatars: !(roomType?.isSingleUser ?? true),
                          theme: chatTheme,
                          inputOptions: inputOptions,
                          scrollToUnreadOptions: chat_ui.ScrollToUnreadOptions(
                            lastReadMessageId: room.data?.lastReadMessage.toString(),
                            scrollOnOpen: true,
                            scrollDelay: Duration.zero,
                          ),
                          avatarBuilder: (user) => NeonUserAvatar(
                            username: user.id,
                            showStatus: false,
                          ),
                          textMessageBuilder: (
                            message, {
                            required messageWidth,
                            required showName,
                          }) =>
                              chat_ui.TextMessage(
                            emojiEnlargementBehavior: chat_ui.EmojiEnlargementBehavior.multi,
                            hideBackgroundOnEmojiMessages: true,
                            message: message,
                            showName: showName,
                            usePreviewData: true,
                            options: chat_ui.TextMessageOptions(
                              matchers: getTextMatchers(
                                messageParameters: message.metadata,
                                style: chatTheme.sentMessageBodyTextStyle,
                                fullContent: true,
                              ),
                            ),
                          ),
                          systemMessageBuilder: (message) => chat_ui.SystemMessage(
                            message: message.text,
                            options: chat_ui.TextMessageOptions(
                              matchers: getTextMatchers(
                                messageParameters: message.metadata,
                                style: chatTheme.sentMessageBodyTextStyle,
                                fullContent: true,
                              ),
                            ),
                          ),
                          fileMessageBuilder: (message, {required messageWidth}) => InkWell(
                            onTap: () {
                              final account = NeonProvider.of<AccountsBloc>(context).activeAccount.value!;
                              context.go(account.completeUri(Uri.parse(message.uri)).toString());
                            },
                            child: chat_ui.FileMessage(
                              message: message,
                            ),
                          ),
                          imageMessageBuilder: (message, {required messageWidth}) {
                            final file = message.metadata!['file'] as BuiltMap<String, JsonObject>;
                            final id = int.parse((file['id']! as StringJsonObject).value);
                            final path = (file['path']! as StringJsonObject).value;
                            final etag = (file['etag']! as StringJsonObject).value;
                            final width = (file['width']! as NumJsonObject).value.toInt();
                            final height = (file['height']! as NumJsonObject).value.toInt();

                            return InkWell(
                              onTap: () {
                                final account = NeonProvider.of<AccountsBloc>(context).activeAccount.value!;
                                context.go(account.completeUri(Uri.parse(message.uri)).toString());
                              },
                              child: NeonApiImage(
                                getImage: (client) => client.core.preview.getPreviewByFileIdRaw(
                                  fileId: id,
                                  x: width,
                                  y: height,
                                ),
                                cacheKey: 'preview-$path-$width-$height',
                                etag: etag,
                                expires: null,
                              ),
                            );
                          },
                          customBottomWidget: Column(
                            children: [
                              NeonError(
                                messages.error,
                                onRetry: widget.bloc.refresh,
                              ),
                              if (messages.isLoading)
                                const NeonLinearProgressIndicator(
                                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                ),
                              if ((room.data?.readOnly ?? 0) == 0)
                                chat_ui.Input(
                                  onSendPressed: onSendPressed,
                                  options: inputOptions,
                                ),
                            ],
                          ),
                          user: user,
                          onEndReached: widget.bloc.loadMoreMessages,
                          onSendPressed: onSendPressed,
                          isLastPage: allLoadedSnapshot.data ?? false,
                          messages: [
                            if (sendingMessageSnapshot.hasData)
                              chat_types.TextMessage(
                                id: 'sending',
                                author: user,
                                text: sendingMessageSnapshot.data!,
                                showStatus: true,
                                status: chat_types.Status.sending,
                              ),
                            if (messages.hasData)
                              ...messages.requireData
                                  .map(
                                    (message) => _talkMessageToChatMessage(
                                      message,
                                      lastCommonReadMessageId: lastCommonReadMessageIdSnapshot.data,
                                    ),
                                  )
                                  .whereNotNull(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );

  chat_types.Message? _talkMessageToChatMessage(
    spreed.$ChatMessageInterface message, {
    int? lastCommonReadMessageId,
  }) {
    final id = message.id.toString();
    final author = chat_types.User(
      id: message.actorId,
      firstName: message.actorDisplayName,
      imageUrl: message.actorId,
    );
    final createdAt = message.timestamp * 1000;
    // TODO: Doesn't work yet in the UI. See https://github.com/flyerhq/flutter_chat_ui/pull/256
    final repliedMessage = message is spreed.ChatMessageWithParent && message.parent != null
        ? _talkMessageToChatMessage(message.parent!)
        : null;
    final status = lastCommonReadMessageId != null && lastCommonReadMessageId >= message.id
        ? chat_types.Status.seen
        : chat_types.Status.sent;
    final metadata = message.messageParameters.toMap();

    switch (message.messageType) {
      case spreed.MessageType.comment:
        final file = metadata['file'];
        if (file != null) {
          final name = (file['name']! as StringJsonObject).value;
          final size = (file['size']! as NumJsonObject).value.toInt();
          final link = (file['link']! as StringJsonObject).value;
          final mimetype = (file['mimetype']! as StringJsonObject).value;
          final previewAvailable = (file['preview-available']! as StringJsonObject).value == 'yes';

          // TODO: Handle file images with text
          if (previewAvailable) {
            return chat_types.ImageMessage(
              id: id,
              author: author,
              createdAt: createdAt,
              repliedMessage: repliedMessage,
              showStatus: true,
              status: status,
              metadata: metadata,
              name: name,
              size: size,
              uri: link,
            );
          } else {
            return chat_types.FileMessage(
              id: id,
              author: author,
              createdAt: createdAt,
              repliedMessage: repliedMessage,
              showStatus: true,
              status: status,
              metadata: metadata,
              name: name,
              size: size,
              uri: link,
              mimeType: mimetype,
            );
          }
        }

        return chat_types.TextMessage(
          id: id,
          author: author,
          createdAt: createdAt,
          repliedMessage: repliedMessage,
          showStatus: true,
          status: status,
          metadata: metadata,
          text: message.message,
        );
      case spreed.MessageType.command:
      case spreed.MessageType.system:
        return chat_types.SystemMessage(
          id: id,
          createdAt: createdAt,
          text: message.message,
          metadata: metadata,
        );
      default:
        return null;
    }
  }
}
