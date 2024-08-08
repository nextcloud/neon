import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/spreed.dart' as spreed;

/// Widget used to render rich object parameters with unknown types.
class TalkRichObjectFallback extends StatelessWidget {
  /// Creates a new Talk rich object fallback
  const TalkRichObjectFallback({
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
    final iconUrl = parameter.iconUrl;

    EdgeInsetsGeometry? labelPadding;
    Widget? avatar;
    if (iconUrl != null) {
      labelPadding = const EdgeInsetsDirectional.only(end: 8);
      avatar = Padding(
        padding: const EdgeInsets.all(4),
        child: CircleAvatar(
          child: ClipOval(
            child: NeonUriImage(
              uri: Uri.parse(iconUrl),
              account: NeonProvider.of<Account>(context),
            ),
          ),
        ),
      );
    }

    return ActionChip(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.zero,
      labelPadding: labelPadding,
      avatar: avatar,
      label: Text(
        parameter.name,
        style: textStyle,
      ),
      onPressed: () {
        final link = parameter.link;
        if (link != null) {
          context.go(link);
        }
      },
    );
  }
}
