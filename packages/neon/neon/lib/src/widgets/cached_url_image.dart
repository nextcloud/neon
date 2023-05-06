part of '../../neon.dart';

class NeonCachedUrlImage extends NeonCachedImage {
  NeonCachedUrlImage({
    required final String url,
    super.size,
    super.fit,
    super.svgColor,
    super.iconColor,
    super.key,
  }) : super(
          getImageFile: () => _cacheManager.getSingleFile(url),
          isSvgHint: Uri.parse(url).path.endsWith('.svg'),
        );
}
