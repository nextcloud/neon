import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/utils.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud/spreed.dart' as spreed;
import 'package:rxdart/rxdart.dart';

/// Bloc for fetching Talk rooms.
@sealed
abstract class TalkBloc implements InteractiveBloc {
  /// Creates a new Talk Bloc instance.
  factory TalkBloc({
    required Account account,
  }) = _TalkBloc;

  /// Creates a new Talk room.
  void createRoom(spreed.RoomType type, String? roomName, core.AutocompleteResult? invite);

  /// Updates a single room with new data.
  void updateRoom(spreed.Room room);

  /// The list of rooms.
  BehaviorSubject<Result<BuiltList<spreed.Room>>> get rooms;

  /// The total number of unread messages.
  BehaviorSubject<int> get unreadCounter;
}

class _TalkBloc extends InteractiveBloc implements TalkBloc {
  _TalkBloc({
    required this.account,
  }) {
    rooms.listen((result) {
      if (!result.hasData) {
        return;
      }

      var unread = 0;
      for (final room in result.requireData) {
        unread += room.unreadMessages;
      }
      unreadCounter.add(unread);
    });

    unawaited(refresh());

    timer = TimerBloc().registerTimer(const Duration(seconds: 30), refresh);
  }

  @override
  final log = Logger('TalkBloc');

  final Account account;
  late final NeonTimer timer;

  @override
  final rooms = BehaviorSubject();

  @override
  final unreadCounter = BehaviorSubject();

  @override
  void dispose() {
    timer.cancel();
    unawaited(rooms.close());
    unawaited(unreadCounter.close());
    super.dispose();
  }

  @override
  Future<void> refresh() async {
    await RequestManager.instance.wrapNextcloud(
      account: account,
      cacheKey: 'talk-rooms',
      subject: rooms,
      getRequest: account.client.spreed.room.$getRooms_Request,
      serializer: account.client.spreed.room.$getRooms_Serializer(),
      unwrap: (response) => response.body.ocs.data.rebuild(
        (b) => b.sort((a, b) => b.lastActivity.compareTo(a.lastActivity)),
      ),
    );
  }

  @override
  Future<void> createRoom(
    spreed.RoomType type,
    String? roomName,
    core.AutocompleteResult? invite,
  ) async {
    await wrapAction(() async {
      await account.client.spreed.room.createRoom(
        roomType: type.value,
        roomName: roomName,
        invite: invite?.id,
        source: invite?.source,
      );
    });
  }

  @override
  void updateRoom(spreed.Room room) {
    final value = rooms.valueOrNull;
    if (value == null || !value.hasData) {
      return;
    }

    rooms.add(
      value.copyWith(
        data: value.requireData.map((r) => r.id == room.id ? room : r).toBuiltList(),
      ),
    );
  }
}
