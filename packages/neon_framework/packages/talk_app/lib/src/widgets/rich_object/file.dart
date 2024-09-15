import 'package:flutter/material.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud/spreed.dart' as spreed;

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

  int _parseDimension(({int? $int, String? string}) dimension) => dimension.$int ?? int.parse(dimension.string!);

  @override
  Widget build(BuildContext context) {
    final child = LayoutBuilder(
      builder: (context, constraints) {
        final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

        final maxSize = Size(constraints.maxWidth, MediaQuery.sizeOf(context).height / 2);

        Size? logicalSize;
        var deviceSize = Size(-1, maxSize.height / devicePixelRatio);

        if (parameter.width != null && parameter.height != null) {
          deviceSize = Size(
            _parseDimension(parameter.width!).toDouble(),
            _parseDimension(parameter.height!).toDouble(),
          );

          // Convert to logical pixels
          logicalSize = deviceSize / devicePixelRatio;

          // Constrain size to max size but keep aspect ratio
          if (logicalSize.width > maxSize.width) {
            logicalSize = logicalSize * (maxSize.width / logicalSize.width);
          }
          if (logicalSize.height > maxSize.height) {
            logicalSize = logicalSize * (maxSize.height / logicalSize.height);
          }

          // Convert back to device pixels
          deviceSize = logicalSize * devicePixelRatio;
        }

        final account = NeonProvider.of<Account>(context);
        Widget image;
        if (parameter.mimetype == 'image/gif') {
          // Previews for animated GIFs are not animated, so we have to request the full file.
          image = NeonUriImage(
            account: account,
            uri: Uri.parse(
              '${account.credentials.serverURL}/remote.php/dav/files/${account.username}/${parameter.path!}',
            ),
          );
        } else {
          image = NeonApiImage(
            account: account,
            etag: parameter.etag,
            expires: null,
            getRequest: (client) => client.core.preview.$getPreviewByFileId_Request(
              fileId: int.parse(parameter.id),
              x: deviceSize.width.toInt(),
              y: deviceSize.height.toInt(),
              a: core.PreviewGetPreviewByFileIdA.$1,
              mimeFallback: core.PreviewGetPreviewByFileIdMimeFallback.$1,
            ),
          );
        }

        image = ConstrainedBox(
          constraints: logicalSize != null
              ? BoxConstraints.tight(logicalSize)
              : BoxConstraints(
                  minHeight: 100,
                  maxHeight: maxSize.height,
                  minWidth: 100,
                  maxWidth: maxSize.width,
                ),
          child: image,
        );

        if (parameter.previewAvailable == 'yes') {
          return Tooltip(
            message: parameter.name,
            child: image,
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            image,
            Text(
              parameter.name,
              style: textStyle,
            ),
          ],
        );
      },
    );

    return InkWell(
      onTap: () async {
        await launchUrl(NeonProvider.of<Account>(context), parameter.link!);
      },
      child: child,
    );
  }
}
