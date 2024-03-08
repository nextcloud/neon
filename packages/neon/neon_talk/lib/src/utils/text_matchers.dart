import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart' as chat_ui;
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:neon_framework/widgets.dart';

List<MatchText> getTextMatchers({
  required Map<String, dynamic>? messageParameters,
  required bool fullContent,
  required TextStyle style,
}) =>
    [
      chat_ui.mailToMatcher(
        style: style.copyWith(
          decoration: TextDecoration.underline,
          decorationColor: style.color,
        ),
      ),
      chat_ui.urlMatcher(
        style: style.copyWith(
          decoration: TextDecoration.underline,
          decorationColor: style.color,
        ),
      ),
      chat_ui.boldMatcher(style: style.merge(chat_ui.PatternStyle.bold.textStyle)),
      chat_ui.italicMatcher(style: style.merge(chat_ui.PatternStyle.italic.textStyle)),
      chat_ui.lineThroughMatcher(
        style: style.merge(chat_ui.PatternStyle.lineThrough.textStyle).copyWith(
              decorationColor: style.color,
            ),
      ),
      chat_ui.codeMatcher(style: style.merge(chat_ui.PatternStyle.code.textStyle)),
      if (messageParameters != null)
        NeonRichObject(
          parameters: messageParameters,
          style: style,
          fullContent: fullContent,
        ),
    ];
