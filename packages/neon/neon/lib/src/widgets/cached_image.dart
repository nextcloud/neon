part of '../../neon.dart';

final _cacheManager = DefaultCacheManager();

abstract class NeonCachedImage extends StatelessWidget {
  const NeonCachedImage({
    required this.future,
    this.isSvgHint = false,
    this.height,
    this.width,
    this.fit,
    this.svgColor,
    this.iconColor,
    super.key,
  });

  final Future<File> future;
  final bool isSvgHint;

  final double? height;
  final double? width;
  final BoxFit? fit;

  final Color? svgColor;
  final Color? iconColor;

  @override
  Widget build(final BuildContext context) => FutureBuilder<File>(
        future: future,
        builder: (final context, final fileSnapshot) {
          if (fileSnapshot.hasData) {
            final content = fileSnapshot.data!.readAsBytesSync();

            try {
              // TODO: Is this safe enough?
              if (isSvgHint || utf8.decode(content).contains('<svg')) {
                return SvgPicture.memory(
                  content,
                  height: height,
                  width: width,
                  fit: fit ?? BoxFit.contain,
                  color: svgColor,
                );
              }
            } catch (_) {
              // If the data is not UTF-8
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
            child: NeonLinearProgressIndicator(
              color: iconColor,
            ),
          );
        },
      );
}
