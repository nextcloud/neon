part of '../../neon.dart';

typedef CacheReviver = FutureOr<Uint8List?> Function(CacheManager cacheManager);
typedef ImageDownloader = FutureOr<Uint8List> Function();
typedef CacheWriter = Future<void> Function(CacheManager cacheManager, Uint8List image);

class NeonCachedImage extends StatefulWidget {
  const NeonCachedImage({
    required this.image,
    required Key super.key,
    this.isSvgHint = false,
    this.size,
    this.fit,
    this.svgColor,
    this.iconColor,
  });

  NeonCachedImage.url({
    required final String url,
    final Key? key,
    this.isSvgHint = false,
    this.size,
    this.fit,
    this.svgColor,
    this.iconColor,
  })  : image = _getImageFromUrl(url),
        super(key: key ?? Key(url));

  NeonCachedImage.custom({
    required final ImageDownloader getImage,
    required final String cacheKey,
    final CacheReviver? reviver,
    final CacheWriter? writeCache,
    this.isSvgHint = false,
    this.size,
    this.fit,
    this.svgColor,
    this.iconColor,
  })  : image = _customImageGetter(
          reviver,
          getImage,
          writeCache,
          cacheKey,
        ),
        super(key: Key(cacheKey));

  final Future<Uint8List> image;
  final bool isSvgHint;

  final Size? size;
  final BoxFit? fit;

  final Color? svgColor;
  final Color? iconColor;

  static Future<Uint8List> _getImageFromUrl(final String url) async {
    final file = await _cacheManager.getSingleFile(url);
    return file.readAsBytes();
  }

  static Future<Uint8List> _customImageGetter(
    final CacheReviver? checkCache,
    final ImageDownloader getImage,
    final CacheWriter? writeCache,
    final String cacheKey,
  ) async {
    final cached = await checkCache?.call(_cacheManager) ?? await _defaultCacheReviver(cacheKey);
    if (cached != null) {
      return cached;
    }

    final data = await getImage();

    unawaited(writeCache?.call(_cacheManager, data) ?? _defaultCacheWriter(data, cacheKey));

    return data;
  }

  static Future<Uint8List?> _defaultCacheReviver(final String cacheKey) async {
    final cacheFile = await _cacheManager.getFileFromCache(cacheKey);
    if (cacheFile != null && cacheFile.validTill.isAfter(DateTime.now())) {
      return cacheFile.file.readAsBytes();
    }

    return null;
  }

  static Future<void> _defaultCacheWriter(
    final Uint8List data,
    final String cacheKey,
  ) async {
    await _cacheManager.putFile(
      cacheKey,
      data,
      maxAge: const Duration(days: 7),
    );
  }

  static final _cacheManager = DefaultCacheManager();

  @override
  State<NeonCachedImage> createState() => _NeonCachedImageState();
}

class _NeonCachedImageState extends State<NeonCachedImage> {
  @override
  Widget build(final BuildContext context) => Center(
        child: FutureBuilder<Uint8List>(
          future: widget.image,
          builder: (final context, final fileSnapshot) {
            if (!fileSnapshot.hasData) {
              return SizedBox(
                width: widget.size?.width,
                child: NeonLinearProgressIndicator(
                  color: widget.iconColor,
                ),
              );
            }

            if (fileSnapshot.hasError) {
              return NeonException(
                fileSnapshot.error,
                onRetry: () {
                  setState(() {});
                },
                onlyIcon: true,
                iconSize: widget.size?.shortestSide,
                color: widget.iconColor ?? Theme.of(context).colorScheme.error,
              );
            }

            final content = fileSnapshot.requireData;

            try {
              // TODO: Is this safe enough?
              if (widget.isSvgHint || utf8.decode(content).contains('<svg')) {
                return SvgPicture.memory(
                  content,
                  height: widget.size?.height,
                  width: widget.size?.width,
                  fit: widget.fit ?? BoxFit.contain,
                  colorFilter: widget.svgColor != null ? ColorFilter.mode(widget.svgColor!, BlendMode.srcIn) : null,
                );
              }
            } catch (_) {
              // If the data is not UTF-8
            }

            return Image.memory(
              content,
              height: widget.size?.height,
              width: widget.size?.width,
              fit: widget.fit,
              gaplessPlayback: true,
            );
          },
        ),
      );
}
