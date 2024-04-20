import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/utils.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/spreed.dart' as spreed;
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

/// Manages the state of a Talk room.
@sealed
abstract class TalkRoomBloc implements InteractiveBloc {
  /// Creates a new Talk room bloc.
  factory TalkRoomBloc({
    required Account account,
    required spreed.Room room,
  }) = _TalkRoomBloc;

  /// Sends a new text message to the room.
  void sendMessage(String message);

  /// The current room data.
  BehaviorSubject<Result<spreed.Room>> get room;

  /// The messages in this room.
  BehaviorSubject<Result<BuiltList<spreed.ChatMessageWithParent>>> get messages;

  /// {@template TalkRoomBloc.lastCommonRead}
  /// The last message ID that was read by everyone with read-privacy set to public.
  /// {@endtemplate}
  BehaviorSubject<int> get lastCommonRead;
}

class _TalkRoomBloc extends InteractiveBloc implements TalkRoomBloc {
  _TalkRoomBloc({
    required this.account,
    required spreed.Room room,
  }) {
    token = room.token;
    this.room.add(Result.success(room));

    unawaited(() async {
      while (pollLoop) {
        final lastKnownMessageId =
            messages.valueOrNull?.data?.firstOrNull?.id ?? this.room.valueOrNull?.data?.lastMessage.chatMessage?.id;
        if (lastKnownMessageId == null) {
          log.fine('Last message ID not known');
          await Future<void>.delayed(const Duration(seconds: 1));
          continue;
        }

        log.info('Polling messages');

        try {
          final response = await account.client.spreed.chat.receiveMessages(
            lookIntoFuture: spreed.ChatReceiveMessagesLookIntoFuture.$1,
            token: token,
            includeLastKnown: spreed.ChatReceiveMessagesIncludeLastKnown.$0,
            lastKnownMessageId: lastKnownMessageId,
            limit: 100,
          );

          updateLastCommonRead(response.headers.xChatLastCommonRead);
          prependMessages(response.body.ocs.data.reversed);
        } catch (error, stackTrace) {
          if (error case DynamiteStatusCodeException(statusCode: 304)) {
            log.info('Polling returned no new messages');
          } else {
            log.info(
              'Error while waiting for new chat messages',
              error,
              stackTrace,
            );
          }
        }
      }

      log.info('Polling messages done');
    }());

    unawaited(refresh());
  }

  @override
  final log = Logger('TalkRoomBloc');

  final Account account;
  late final String token;
  bool pollLoop = true;

  @override
  final room = BehaviorSubject();

  @override
  final messages = BehaviorSubject();

  @override
  final lastCommonRead = BehaviorSubject();

  @override
  void dispose() {
    pollLoop = false;
    unawaited(account.client.spreed.room.leaveRoom(token: token));

    unawaited(room.close());
    unawaited(messages.close());
    unawaited(lastCommonRead.close());
    super.dispose();
  }

  @override
  Future<void> refresh() async {
    await Future.wait([
      RequestManager.instance.wrapNextcloud(
        account: account,
        cacheKey: 'spreed-room-$token',
        subject: room,
        getRequest: () => account.client.spreed.room.$joinRoom_Request(
          token: token,
        ),
        serializer: account.client.spreed.room.$joinRoom_Serializer(),
        unwrap: (response) => response.body.ocs.data,
      ),
      RequestManager.instance.wrapNextcloud(
        account: account,
        cacheKey: 'spreed-room-$token-messages',
        subject: messages,
        getRequest: () => account.client.spreed.chat.$receiveMessages_Request(
          token: token,
          lookIntoFuture: spreed.ChatReceiveMessagesLookIntoFuture.$0,
          includeLastKnown: spreed.ChatReceiveMessagesIncludeLastKnown.$0,
          limit: 100,
        ),
        serializer: account.client.spreed.chat.$receiveMessages_Serializer(),
        unwrap: (response) {
          updateLastCommonRead(response.headers.xChatLastCommonRead);

          return response.body.ocs.data;
        },
      ),
    ]);
  }

  @override
  Future<void> sendMessage(String message) async {
    await wrapAction(
      () async {
        final response = await account.client.spreed.chat.sendMessage(
          message: message,
          token: token,
        );

        updateLastCommonRead(response.headers.xChatLastCommonRead);

        final m = response.body.ocs.data;
        if (m != null) {
          prependMessages([m]);
        }
      },
      refresh: () async {},
    );
  }

  void updateLastCommonRead(String? header) {
    if (header != null) {
      lastCommonRead.add(int.parse(header));
    }
  }

  void prependMessages(Iterable<spreed.ChatMessageWithParent> newMessages) {
    if (messages.hasValue) {
      final builder = ListBuilder<spreed.ChatMessageWithParent>(newMessages);

      final result = messages.value;
      if (result.hasData) {
        final lastMessageID = newMessages.lastOrNull?.id;

        if (lastMessageID == null) {
          builder.addAll(result.requireData);
        } else {
          builder.addAll(result.requireData.where((message) => message.id < lastMessageID));
        }
      }

      messages.add(
        result.copyWith(
          data: builder.build(),
        ),
      );
    } else {
      messages.add(Result.success(BuiltList(newMessages)));
    }
  }
}
