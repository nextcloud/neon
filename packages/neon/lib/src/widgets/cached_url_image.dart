part of '../neon.dart';

final _cacheManager = DefaultCacheManager();

class CachedURLImage extends StatelessWidget {
  const CachedURLImage({
    required this.url,
    required this.account,
    this.height,
    this.width,
    this.fit,
    this.color,
    super.key,
  });

  final String url;
  final Account account;

  final double? height;
  final double? width;
  final BoxFit? fit;

  /// Only works for SVGs
  final Color? color;

  @override
  Widget build(final BuildContext context) => FutureBuilder<File>(
        // Really weird false positive
        // ignore: discarded_futures
        future: _cacheManager.getSingleFile(
          url,
          headers: account.client.baseHeaders,
        ),
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
                color: color,
              );
            }

            return Image.memory(
              content,
              height: height,
              width: width,
              fit: fit,
            );
          }
          if (fileSnapshot.hasError) {
            return Icon(
              Icons.error_outline,
              size: height != null && width != null ? min(height!, width!) : height ?? width,
            );
          }
          return SizedBox(
            width: width,
            child: const CustomLinearProgressIndicator(),
          );
        },
      );
}
