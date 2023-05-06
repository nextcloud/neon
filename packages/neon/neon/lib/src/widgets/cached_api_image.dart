part of '../../neon.dart';

typedef APIImageDownloader = Future<Uint8List> Function();

class NeonCachedApiImage extends NeonCachedImage {
  NeonCachedApiImage({
    required final Account account,
    required final String cacheKey,
    required final APIImageDownloader download,
    final String? etag,
    super.size,
    super.fit,
    super.svgColor,
    super.iconColor,
    super.key,
  }) : super(
          getImageFile: () async {
            final realKey = '${account.id}-$cacheKey';
            final cacheFile = await _cacheManager.getFileFromCache(realKey);
            if (cacheFile != null && cacheFile.validTill.isAfter(DateTime.now())) {
              return cacheFile.file;
            }

            return _cacheManager.putFile(
              realKey,
              await download(),
              maxAge: const Duration(days: 7),
              eTag: etag,
            );
          },
        );
}
