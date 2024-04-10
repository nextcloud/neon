import 'package:file_icons/file_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/core.dart';
import 'package:nextcloud/spreed.dart' as spreed;

/// Displays a file preview from a rich object.
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

    if (parameter.previewAvailable == spreed.RichObjectParameter_PreviewAvailable.yes) {
      final maxHeight = MediaQuery.sizeOf(context).height / 2;

      var width = _parseDimension(parameter.width);
      var height = _parseDimension(parameter.height);
      if (width != null && height != null) {
        final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

        var size = Size(width.toDouble(), height.toDouble());

        // Convert to logical pixels
        size /= devicePixelRatio;

        // Constrain size to max height but keep aspect ration
        if (size.height > maxHeight) {
          size = size * (maxHeight / size.height);
        }

        // Convert back to device pixels
        size *= devicePixelRatio;

        width = size.width.toInt();
        height = size.height.toInt();
      }

      child = ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: maxHeight,
        ),
        child: Tooltip(
          message: parameter.name,
          child: NeonApiImage(
            cacheKey: 'preview-${parameter.path!}-$width-$height',
            etag: parameter.etag,
            expires: null,
            getRequest: (client) => client.core.preview.$getPreviewByFileId_Request(
              fileId: int.parse(parameter.id),
              x: width,
              y: height,
            ),
          ),
        ),
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
        final link = Uri.parse(parameter.link!);
        final account = NeonProvider.of<AccountsBloc>(context).activeAccount.value!;
        context.go(account.completeUri(link).toString());
      },
      child: child,
    );
  }

  int? _parseDimension(({int? $int, String? string})? dimension) {
    if (dimension == null) {
      return null;
    }

    final $int = dimension.$int;
    if ($int != null) {
      return $int;
    }

    final string = dimension.string;
    if (string != null) {
      return int.parse(string);
    }

    throw ArgumentError(r'One of $int or string has to be not-null');
  }
}
