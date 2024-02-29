import 'package:flutter/material.dart';
import 'package:nextcloud/spreed.dart' as spreed;

/// Builds a [TextSpan] for the given [chatMessage].
TextSpan buildChatMessage({
  required spreed.$ChatMessageInterface chatMessage,
  bool isPreview = false,
  TextStyle? style,
}) {
  var message = chatMessage.message;
  if (isPreview) {
    message = message.replaceAll('\n', ' ');
  }

  return TextSpan(
    text: message,
    style: style,
  );
}
