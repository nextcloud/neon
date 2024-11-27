import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:intersperse/intersperse.dart';
import 'package:neon_rich_text/src/rich_objects/deck_card.dart';
import 'package:neon_rich_text/src/rich_objects/fallback.dart';
import 'package:neon_rich_text/src/rich_objects/file.dart';
import 'package:neon_rich_text/src/rich_objects/mention.dart';
import 'package:nextcloud/core.dart' as core;

/// Renders the [text] as a rich [TextSpan].
TextSpan buildRichTextSpan({
  required String text,
  required BuiltMap<String, BuiltMap<String, JsonObject>> parameters,
  required BuiltList<String> references,
  required TextStyle style,
  required void Function(String reference) onReferenceClicked,
  bool isPreview = false,
}) {
  if (isPreview) {
    text = text.replaceAll('\n', ' ');
  }

  final unusedParameters = <String, core.RichObjectParameter>{};

  var parts = [text];
  for (final entry in parameters.entries) {
    final newParts = <String>[];

    var found = false;
    for (final part in parts) {
      final p = part.split('{${entry.key}}');
      newParts.addAll(p.intersperse('{${entry.key}}'));
      if (p.length > 1) {
        found = true;
      }
    }

    if (!found) {
      unusedParameters[entry.key] = core.RichObjectParameter.fromJson(
        entry.value.map((key, value) => MapEntry(key, value.toString())).toMap(),
      );
    }

    parts = newParts;
  }
  for (final reference in references) {
    final newParts = <String>[];

    for (final part in parts) {
      final p = part.split(reference);
      newParts.addAll(p.intersperse(reference));
    }

    parts = newParts;
  }

  final children = <InlineSpan>[];

  for (final entry in unusedParameters.entries) {
    if (entry.key == core.RichObjectParameter_Type.file.value) {
      children
        ..add(
          buildRichObjectParameter(
            parameter: entry.value,
            textStyle: style,
            isPreview: isPreview,
          ),
        )
        ..add(const TextSpan(text: '\n'));
    }
  }

  for (final part in parts) {
    if (part.isEmpty) {
      continue;
    }

    var match = false;
    for (final entry in parameters.entries) {
      if ('{${entry.key}}' == part) {
        children.add(
          buildRichObjectParameter(
            parameter: core.RichObjectParameter.fromJson(
              entry.value.map((key, value) => MapEntry(key, value.toString())).toMap(),
            ),
            textStyle: style,
            isPreview: isPreview,
          ),
        );
        match = true;
        break;
      }
    }
    for (final reference in references) {
      if (reference == part) {
        final gestureRecognizer = TapGestureRecognizer()..onTap = () => onReferenceClicked(reference);

        children.add(
          TextSpan(
            text: part,
            style: style.copyWith(
              decoration: TextDecoration.underline,
              decorationThickness: 2,
            ),
            recognizer: gestureRecognizer,
          ),
        );
        match = true;
        break;
      }
    }

    if (!match) {
      children.add(
        TextSpan(
          style: style,
          text: part,
        ),
      );
    }
  }

  return TextSpan(
    style: style,
    children: children,
  );
}

/// Renders a rich object [parameter] to be interactive.
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
          textStyle: textStyle,
        ),
      core.RichObjectParameter_Type.file => NeonRichObjectFile(
          parameter: parameter,
          textStyle: textStyle,
        ),
      core.RichObjectParameter_Type.deckCard => NeonRichObjectDeckCard(
          parameter: parameter,
        ),
      _ => NeonRichObjectFallback(
          parameter: parameter,
          textStyle: textStyle,
        ),
    },
  );
}
