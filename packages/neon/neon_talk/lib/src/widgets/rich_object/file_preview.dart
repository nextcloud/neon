import 'package:flutter/material.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/core.dart';
import 'package:nextcloud/spreed.dart' as spreed;

/// Displays a file preview from a rich object.
class TalkRichObjectFilePreview extends StatelessWidget {
  /// Creates a new Talk rich object file preview.
  const TalkRichObjectFilePreview({
    required this.parameter,
    super.key,
  });

  /// The parameter to display.
  final spreed.RichObjectParameter parameter;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxSize = Size(constraints.maxWidth, MediaQuery.sizeOf(context).height / 2);

        Size? logicalSize;
        var deviceSize = const Size(-1, -1);

        if (parameter.width != null && parameter.height != null) {
          final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

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
            uri: Uri.parse('${account.serverURL}/remote.php/dav/files/${account.username}/${parameter.path!}'),
          );
        } else {
          image = NeonApiImage(
            account: account,
            cacheKey: 'preview-${parameter.path!}-${deviceSize.width.toInt()}-${deviceSize.height.toInt()}',
            etag: parameter.etag,
            expires: null,
            getRequest: (client) => client.core.preview.$getPreviewByFileId_Request(
              fileId: int.parse(parameter.id),
              x: deviceSize.width.toInt(),
              y: deviceSize.height.toInt(),
            ),
          );
        }

        return ConstrainedBox(
          constraints: logicalSize != null ? BoxConstraints.tight(logicalSize) : BoxConstraints.loose(maxSize),
          child: Tooltip(
            message: parameter.name,
            child: image,
          ),
        );
      },
    );
  }

  int _parseDimension(({int? $int, String? string}) dimension) => dimension.$int ?? int.parse(dimension.string!);
}
