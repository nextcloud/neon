part of '../neon.dart';

typedef APIImageDownloader = Future<Uint8List> Function();

class CachedAPIImage extends CachedImage {
  CachedAPIImage({
    required final Account account,
    required final String cacheKey,
    required final APIImageDownloader download,
    final String? etag,
    super.height,
    super.width,
    super.fit,
    super.svgColor,
    super.iconColor,
    super.key,
  }) : super(
          future: () async {
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
          }(),
        );
}
