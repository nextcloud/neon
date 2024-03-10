import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:neon_talk/src/blocs/room.dart';
import 'package:neon_talk/src/widgets/message.dart';
import 'package:neon_talk/src/widgets/room_avatar.dart';
import 'package:nextcloud/spreed.dart' as spreed;

/// Displays the room with a chat message list.
class TalkRoomPage extends StatefulWidget {
  /// Creates a new Talk room page.
  const TalkRoomPage({
    required this.room,
    super.key,
  });

  /// The room to be displayed.
  final spreed.Room room;

  @override
  State<TalkRoomPage> createState() => _TalkRoomPageState();
}

class _TalkRoomPageState extends State<TalkRoomPage> {
  late final Account account;
  late final TalkRoomBloc bloc;
  late StreamSubscription<Object> errorsSubscription;

  @override
  void initState() {
    super.initState();

    account = NeonProvider.of<AccountsBloc>(context).activeAccount.value!;
    bloc = TalkRoomBloc(
      account: account,
      room: widget.room,
    );
    errorsSubscription = bloc.errors.listen((error) {
      NeonError.showSnackbar(context, error);
    });
  }

  @override
  void dispose() {
    unawaited(errorsSubscription.cancel());
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResultBuilder.behaviorSubject(
      subject: bloc.room,
      builder: (context, result) {
        final appBar = AppBar(
          title: Row(
            children: <Widget>[
              TalkRoomAvatar(
                room: widget.room,
              ),
              Text(result.requireData.displayName),
              NeonError(
                result.error,
                onRetry: bloc.refresh,
                type: NeonErrorType.iconOnly,
              ),
              Flexible(
                child: NeonLinearProgressIndicator(
                  visible: result.isLoading,
                ),
              ),
            ]
                .intersperse(
                  const SizedBox(
                    width: 10,
                  ),
                )
                .toList(),
          ),
        );

        final body = ResultBuilder.behaviorSubject(
          subject: bloc.messages,
          builder: (context, result) => NeonListView(
            scrollKey: 'talk-room-${widget.room.token}',
            reverse: true,
            isLoading: result.isLoading,
            error: result.error,
            onRefresh: bloc.refresh,
            itemCount: result.data?.length ?? 0,
            itemBuilder: (context, index) {
              final message = result.requireData[index];

              spreed.ChatMessageWithParent? previousMessage;
              if (result.requireData.length > index + 1) {
                previousMessage = result.requireData[index + 1];
              }

              return TalkMessage(
                chatMessage: message,
                previousChatMessage: previousMessage,
              );
            },
          ),
        );

        return Scaffold(
          appBar: appBar,
          body: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 1120,
              ),
              child: body,
            ),
          ),
        );
      },
    );
  }
}
