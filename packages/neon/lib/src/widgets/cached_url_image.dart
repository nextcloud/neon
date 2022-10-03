part of '../neon.dart';

final _cacheManager = DefaultCacheManager();

class CachedURLImage extends StatelessWidget {
  const CachedURLImage({
    required this.url,
    this.height,
    this.width,
    this.fit,
    this.svgColor,
    this.iconColor,
    super.key,
  });

  final String url;

  final double? height;
  final double? width;
  final BoxFit? fit;

  final Color? svgColor;
  final Color? iconColor;

  @override
  Widget build(final BuildContext context) => FutureBuilder<File>(
        // Really weird false positive
        // ignore: discarded_futures
        future: _cacheManager.getSingleFile(url),
        builder: (final context, final fileSnapshot) {
          if (fileSnapshot.hasData) {
            final content = fileSnapshot.data!.readAsBytesSync();

            var isSvg = false;
            if (Uri.parse(url).path.endsWith('.svg')) {
              isSvg = true;
            }
            if (!isSvg) {
              try {
                // TODO: Is this safe enough?
                if (utf8.decode(content).contains('<svg')) {
                  isSvg = true;
                }
              } catch (_) {
                // If the data is not UTF-8
              }
            }

            if (isSvg) {
              return SvgPicture.memory(
                content,
                height: height,
                width: width,
                fit: fit ?? BoxFit.contain,
                color: svgColor,
              );
            }

            return Image.memory(
              content,
              height: height,
              width: width,
              fit: fit,
              gaplessPlayback: true,
            );
          }
          if (fileSnapshot.hasError) {
            return Icon(
              Icons.error_outline,
              size: height != null && width != null ? min(height!, width!) : height ?? width,
              color: iconColor,
            );
          }
          return SizedBox(
            width: width,
            child: CustomLinearProgressIndicator(
              color: iconColor,
            ),
          );
        },
      );
}
