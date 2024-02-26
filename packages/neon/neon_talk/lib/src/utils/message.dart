import 'package:flutter/material.dart';
import 'package:nextcloud/spreed.dart' as spreed;

/// Builds a [TextSpan] for the given [chatMessage].
TextSpan buildChatMessage({
  required spreed.ChatMessage chatMessage,
}) =>
    TextSpan(
      text: chatMessage.message,
    );
