import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:nextcloud/spreed.dart' as spreed;

/// Widget for displaying a read/sent indicator next to a chat message.
class TalkReadIndicator extends StatelessWidget {
  /// Creates a new Talk read indicator.
  const TalkReadIndicator({
    required this.chatMessage,
    required this.lastCommonRead,
    super.key,
  });

  /// The message the indicator is for.
  final spreed.$ChatMessageInterface chatMessage;

  /// {@macro TalkRoomBloc.lastCommonRead}
  final int lastCommonRead;

  @override
  Widget build(BuildContext context) {
    return Icon(
      lastCommonRead >= chatMessage.id ? MdiIcons.checkAll : MdiIcons.check,
      size: 14,
      color: Colors.grey,
    );
  }
}
