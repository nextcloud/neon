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
    final maxHeight = MediaQuery.sizeOf(context).height / 2;

    Size? logicalSize;
    var deviceSize = const Size(-1, -1);

    if (parameter.width != null && parameter.height != null) {
      final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

      deviceSize = Size(_parseDimension(parameter.width!).toDouble(), _parseDimension(parameter.height!).toDouble());

      // Convert to logical pixels
      logicalSize = deviceSize / devicePixelRatio;

      // Constrain size to max height but keep aspect ratio
      if (logicalSize.height > maxHeight) {
        logicalSize = logicalSize * (maxHeight / logicalSize.height);
      }

      // Convert back to device pixels
      deviceSize = logicalSize * devicePixelRatio;
    }

    return ConstrainedBox(
      constraints: logicalSize != null
          ? BoxConstraints.tight(logicalSize)
          : BoxConstraints.loose(Size(double.infinity, maxHeight)),
      child: Tooltip(
        message: parameter.name,
        child: NeonApiImage(
          account: NeonProvider.of<Account>(context),
          cacheKey: 'preview-${parameter.path!}-${deviceSize.width.toInt()}-${deviceSize.height.toInt()}',
          etag: parameter.etag,
          expires: null,
          getRequest: (client) => client.core.preview.$getPreviewByFileId_Request(
            fileId: int.parse(parameter.id),
            x: deviceSize.width.toInt(),
            y: deviceSize.height.toInt(),
          ),
        ),
      ),
    );
  }

  int _parseDimension(({int? $int, String? string}) dimension) => dimension.$int ?? int.parse(dimension.string!);
}
