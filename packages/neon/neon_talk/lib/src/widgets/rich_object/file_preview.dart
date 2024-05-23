import 'package:flutter/material.dart';
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

    var width = _parseDimension(parameter.width);
    var height = _parseDimension(parameter.height);
    if (width != null && height != null) {
      final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

      var size = Size(width.toDouble(), height.toDouble());

      // Convert to logical pixels
      size /= devicePixelRatio;

      // Constrain size to max height but keep aspect ratio
      if (size.height > maxHeight) {
        size = size * (maxHeight / size.height);
      }

      // Convert back to device pixels
      size *= devicePixelRatio;

      width = size.width.toInt();
      height = size.height.toInt();
    }

    height ??= -1;
    width ??= -1;

    return ConstrainedBox(
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
