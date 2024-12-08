import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:neon_rich_text/src/rich_objects/deck_card.dart';
import 'package:neon_rich_text/src/rich_objects/fallback.dart';
import 'package:neon_rich_text/src/rich_objects/file.dart';
import 'package:neon_rich_text/src/rich_objects/mention.dart';
import 'package:nextcloud/core.dart' as core;

/// Renders a rich object [parameter] to be interactive.
@internal
InlineSpan buildRichObjectParameter({
  required core.RichObjectParameter parameter,
  required TextStyle? textStyle,
  required bool isPreview,
}) {
  if (isPreview) {
    return TextSpan(
      text: parameter.name,
      style: textStyle,
    );
  }

  return WidgetSpan(
    alignment: PlaceholderAlignment.middle,
    child: switch (parameter.type) {
      core.RichObjectParameter_Type.user ||
      core.RichObjectParameter_Type.call ||
      core.RichObjectParameter_Type.guest ||
      core.RichObjectParameter_Type.userGroup =>
        NeonRichObjectMention(
          parameter: parameter,
        ),
      core.RichObjectParameter_Type.file => NeonRichObjectFile(
          parameter: parameter,
        ),
      core.RichObjectParameter_Type.deckCard => NeonRichObjectDeckCard(
          parameter: parameter,
        ),
      _ => NeonRichObjectFallback(
          parameter: parameter,
        ),
    },
  );
}
