import 'package:files_icons/files_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neon_framework/theme.dart';
import 'package:nextcloud/spreed.dart' as spreed;
import 'package:talk_app/src/widgets/rich_object/file_preview.dart';

/// Displays a file from a rich object.
class TalkRichObjectFile extends StatelessWidget {
  /// Creates a new Talk rich object file.
  const TalkRichObjectFile({
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
    Widget child;

    if (parameter.previewAvailable == 'yes') {
      child = TalkRichObjectFilePreview(
        parameter: parameter,
      );
    } else {
      child = Row(
        children: [
          FileIcon(
            parameter.name,
            color: Theme.of(context).colorScheme.primary,
            size: largeIconSize,
          ),
          Text(
            parameter.name,
            style: textStyle,
          ),
        ],
      );
    }

    return InkWell(
      onTap: () {
        context.go(parameter.link!);
      },
      child: child,
    );
  }
}
