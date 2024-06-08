import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:neon_talk/l10n/localizations.dart';
import 'package:neon_talk/src/blocs/room.dart';
import 'package:neon_talk/src/blocs/talk.dart';
import 'package:neon_talk/src/dialogs/create_room.dart';
import 'package:neon_talk/src/pages/room.dart';
import 'package:neon_talk/src/widgets/message.dart';
import 'package:neon_talk/src/widgets/read_indicator.dart';
import 'package:neon_talk/src/widgets/room_avatar.dart';
import 'package:neon_talk/src/widgets/unread_indicator.dart';
import 'package:nextcloud/spreed.dart' as spreed;
import 'package:nextcloud/utils.dart';
import 'package:timezone/timezone.dart' as tz;

/// The main page displaying the chat list.
class TalkMainPage extends StatefulWidget {
  /// Creates a new Talk main page.
  const TalkMainPage({super.key});

  @override
  State<TalkMainPage> createState() => _TalkMainPageState();
}

class _TalkMainPageState extends State<TalkMainPage> {
  late Account account;
  late TalkBloc bloc;
  late final StreamSubscription<Object> errorsSubscription;

  @override
  void initState() {
    super.initState();

    account = NeonProvider.of<Account>(context);

    bloc = NeonProvider.of<TalkBloc>(context);
    errorsSubscription = bloc.errors.listen((error) {
      NeonError.showSnackbar(context, error);
    });
  }

  @override
  void dispose() {
    unawaited(errorsSubscription.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResultBuilder.behaviorSubject(
        subject: bloc.rooms,
        builder: (context, rooms) => NeonListView(
          scrollKey: 'talk-rooms',
          isLoading: rooms.isLoading,
          error: rooms.error,
          onRefresh: bloc.refresh,
          itemCount: rooms.data?.length ?? 0,
          itemBuilder: (context, index) => buildRoom(rooms.requireData[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: TalkLocalizations.of(context).roomsCreateNew,
        onPressed: () async {
          final result = await showDialog<TalkCreateRoomDetails>(
            context: context,
            builder: (context) => const TalkCreateRoomDialog(),
          );
          if (result == null) {
            return;
          }

          bloc.createRoom(
            result.type,
            result.roomName,
            result.invite,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildRoom(spreed.Room room) {
    Widget? subtitle;
    Widget? trailing;

    final lastChatMessage = room.lastMessage.chatMessage;
    if (lastChatMessage != null) {
      subtitle = TalkMessagePreview(
        actorId: room.actorId,
        roomType: spreed.RoomType.fromValue(room.type),
        chatMessage: lastChatMessage,
      );

      if (room.unreadMessages > 0) {
        trailing = TalkUnreadIndicator(
          room: room,
        );
      } else if (account.username == lastChatMessage.actorId) {
        trailing = Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: TalkReadIndicator(
            chatMessage: lastChatMessage,
            lastCommonRead: room.lastCommonReadMessage,
          ),
        );
      }

      final timestamp = DateTimeUtils.fromSecondsSinceEpoch(
        tz.local,
        lastChatMessage.timestamp,
      );

      final time = Tooltip(
        message: DateFormat.yMd().add_jm().format(timestamp),
        child: RelativeTime(
          date: timestamp,
          includeSign: false,
          abbreviation: true,
        ),
      );

      if (trailing != null) {
        trailing = Column(
          children: [
            time,
            Expanded(
              child: trailing,
            ),
          ],
        );
      } else {
        trailing = Align(
          alignment: Alignment.topCenter,
          child: time,
        );
      }

      trailing = SizedBox(
        width: 40,
        child: trailing,
      );
    }

    return ListTile(
      leading: TalkRoomAvatar(
        room: room,
      ),
      title: Text(room.displayName),
      subtitle: subtitle,
      trailing: trailing,
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => NeonProvider(
              create: (_) => TalkRoomBloc(
                talkBloc: bloc,
                account: account,
                room: room,
              ),
              child: const TalkRoomPage(),
            ),
          ),
        );
      },
    );
  }
}
