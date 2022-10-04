part of '../neon.dart';

class CachedURLImage extends CachedImage {
  CachedURLImage({
    required final String url,
    super.height,
    super.width,
    super.fit,
    super.svgColor,
    super.iconColor,
    super.key,
  }) : super(
          future: _cacheManager.getSingleFile(url),
          isSvgHint: Uri.parse(url).path.endsWith('.svg'),
        );
}
