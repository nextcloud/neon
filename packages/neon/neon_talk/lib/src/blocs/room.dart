import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:logging/logging.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/utils.dart';
import 'package:nextcloud/spreed.dart' as spreed;
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

/// Manages the state of a Talk room.
sealed class TalkRoomBloc implements InteractiveBloc {
  factory TalkRoomBloc({
    required Account account,
    required spreed.Room room,
  }) = _TalkRoomBloc;

  /// The current room data.
  BehaviorSubject<Result<spreed.Room>> get room;

  /// The messages in this room.
  BehaviorSubject<Result<BuiltList<spreed.ChatMessageWithParent>>> get messages;
}

class _TalkRoomBloc extends InteractiveBloc implements TalkRoomBloc {
  _TalkRoomBloc({
    required this.account,
    required spreed.Room room,
  }) {
    token = room.token;
    this.room.add(Result.success(room));

    unawaited(refresh());
  }

  @override
  final log = Logger('TalkRoomBloc');

  final Account account;
  late final String token;

  @override
  final room = BehaviorSubject();

  @override
  final messages = BehaviorSubject();

  @override
  void dispose() {
    unawaited(account.client.spreed.room.leaveRoom(token: token));

    unawaited(room.close());
    unawaited(messages.close());
    super.dispose();
  }

  @override
  Future<void> refresh() async {
    await Future.wait([
      RequestManager.instance.wrapNextcloud(
        account: account,
        cacheKey: 'spreed-room-$token',
        subject: room,
        request: account.client.spreed.room.$joinRoom_Request(
          token: token,
        ),
        serializer: account.client.spreed.room.$joinRoom_Serializer(),
        unwrap: (response) => response.body.ocs.data,
      ),
      RequestManager.instance.wrapNextcloud(
        account: account,
        cacheKey: 'spreed-room-$token-messages',
        subject: messages,
        request: account.client.spreed.chat.$receiveMessages_Request(
          token: token,
          lookIntoFuture: spreed.ChatReceiveMessagesLookIntoFuture.$0,
          includeLastKnown: spreed.ChatReceiveMessagesIncludeLastKnown.$0,
          limit: 100,
        ),
        serializer: account.client.spreed.chat.$receiveMessages_Serializer(),
        unwrap: (response) => response.body.ocs.data,
      ),
    ]);
  }
}
