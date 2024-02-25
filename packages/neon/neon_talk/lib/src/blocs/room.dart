import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/utils.dart';
import 'package:nextcloud/spreed.dart' as spreed;
import 'package:rxdart/rxdart.dart';

sealed class TalkRoomBloc implements InteractiveBloc {
  factory TalkRoomBloc(
    Account account,
    spreed.Room room,
  ) =>
      _TalkRoomBloc(
        account,
        room,
      );

  Future<void> loadMoreMessages();

  void sendMessage(String message);

  Future<void> leaveRoom();

  BehaviorSubject<Result<spreed.Room>> get room;

  BehaviorSubject<Result<BuiltList<spreed.$ChatMessageInterface>>> get messages;

  BehaviorSubject<bool> get allLoaded;

  BehaviorSubject<String?> get sendingMessage;

  BehaviorSubject<int?> get lastCommonReadMessageId;

  String get roomToken;

  String get actorId;
}

class _TalkRoomBloc extends InteractiveBloc implements TalkRoomBloc {
  _TalkRoomBloc(
    this.account,
    spreed.Room r,
  ) {
    roomToken = r.token;
    room.add(Result.success(r));

    unawaited(refresh());
  }

  @override
  final log = Logger('TalkCallBloc');

  final Account account;
  @override
  late final String roomToken;
  final _limit = 100;

  int? _lastKnownMessageId;

  @override
  String get actorId => account.username;

  @override
  void dispose() {
    unawaited(room.close());
    unawaited(messages.close());
    unawaited(allLoaded.close());
    unawaited(sendingMessage.close());
    unawaited(lastCommonReadMessageId.close());
    super.dispose();
  }

  @override
  final allLoaded = BehaviorSubject.seeded(false);

  @override
  final lastCommonReadMessageId = BehaviorSubject.seeded(null);

  @override
  final messages = BehaviorSubject();

  @override
  final room = BehaviorSubject();

  @override
  final sendingMessage = BehaviorSubject.seeded(null);

  @override
  Future<void> refresh() async {
    await RequestManager.instance.wrapNextcloud(
      account: account,
      cacheKey: 'spreed-room-$roomToken',
      subject: room,
      rawResponse: account.client.spreed.room.joinRoomRaw(token: roomToken),
      unwrap: (response) => response.body.ocs.data,
    );
    await _loadMessages(force: true);
  }

  @override
  Future<void> sendMessage(String message) async {
    sendingMessage.add(message);
    await wrapAction(
      () async {
        await account.client.spreed.chat.sendMessage(
          token: roomToken,
          message: message,
        );
      },
      refresh: () async {
        await _loadMessages(force: true);
      },
    );
    sendingMessage.add(null);
  }

  @override
  Future<void> loadMoreMessages() async {
    await _loadMessages(force: false);
  }

  @override
  Future<void> leaveRoom() async {
    await wrapAction(() async {
      await account.client.spreed.room.leaveRoom(token: roomToken);
    });
  }

  Future<void> _loadMessages({required bool force}) async {
    if (!force && (allLoaded.valueOrNull ?? false)) {
      return;
    }

    final previousData = messages.valueOrNull?.data;
    try {
      messages.add(
        Result(
          previousData,
          null,
          isLoading: true,
          isCached: true,
        ),
      );
      final data = await account.client.spreed.chat.receiveMessages(
        token: roomToken,
        lookIntoFuture: spreed.ChatReceiveMessagesLookIntoFuture.$0,
        includeLastKnown: spreed.ChatReceiveMessagesIncludeLastKnown.$1,
        limit: _limit,
        lastKnownMessageId: (force ? null : _lastKnownMessageId) ?? 0,
        lastCommonReadId: lastCommonReadMessageId.valueOrNull ?? 0,
      );

      _lastKnownMessageId = data.headers.xChatLastGiven != null ? int.parse(data.headers.xChatLastGiven!) : null;
      lastCommonReadMessageId.add(
        data.headers.xChatLastCommonRead != null ? int.parse(data.headers.xChatLastCommonRead!) : null,
      );

      if (data.body.ocs.data.length < _limit) {
        allLoaded.add(true);
      }

      messages.add(
        Result.success(
          BuiltList.from(
            BuiltMap.build((b) {
              if (previousData != null) {
                for (final message in previousData) {
                  b[message.id] = message;
                }
              }
              for (final message in data.body.ocs.data) {
                b[message.id] = message;
              }
            }).values,
          ),
        ),
      );
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      messages.add(
        Result(
          previousData,
          e,
          isLoading: false,
          isCached: true,
        ),
      );
    }
  }
}
