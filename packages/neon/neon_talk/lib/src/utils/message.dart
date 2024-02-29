import 'package:flutter/material.dart';
import 'package:nextcloud/spreed.dart' as spreed;

/// Builds a [TextSpan] for the given [chatMessage].
TextSpan buildChatMessage({
  required spreed.ChatMessage chatMessage,
  bool isPreview = false,
}) {
  var message = chatMessage.message;
  if (isPreview) {
    message = message.replaceAll('\n', ' ');
  }

  return TextSpan(
    text: message,
  );
}
