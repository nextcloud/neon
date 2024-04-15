import 'package:flutter/material.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/spreed.dart' as spreed;

/// Displays a mention chip from a rich object.
class TalkRichObjectMention extends StatelessWidget {
  /// Create a new Talk rich object mention.
  const TalkRichObjectMention({
    required this.parameter,
    required this.textStyle,
    super.key,
  });

  /// The parameter to display.
  final spreed.RichObjectParameter parameter;

  /// The TextStyle to applied to all text elements in this rich object.
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final child = switch (parameter.type) {
      'user' => NeonUserAvatar(
          username: parameter.id,
          showStatus: false,
        ),
      'call' => CircleAvatar(
          child: ClipOval(
            child: NeonUriImage(
              uri: Uri.parse(parameter.iconUrl!),
            ),
          ),
        ),
      'guest' => CircleAvatar(
          child: Icon(AdaptiveIcons.person),
        ),
      'user-group' || 'group' => CircleAvatar(
          child: Icon(AdaptiveIcons.group),
        ),
      _ => throw UnimplementedError('Unknown mention type: $parameter'), // coverage:ignore-line
    };

    return Chip(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.zero,
      labelPadding: const EdgeInsetsDirectional.only(end: 4, start: -4),
      avatar: Padding(
        padding: const EdgeInsets.all(6),
        child: child,
      ),
      visualDensity: const VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity,
      ),
      label: Text(
        parameter.name,
        style: textStyle,
      ),
    );
  }
}
