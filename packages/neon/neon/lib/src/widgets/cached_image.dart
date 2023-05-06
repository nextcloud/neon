part of '../../neon.dart';

final _cacheManager = DefaultCacheManager();

abstract class NeonCachedImage extends StatefulWidget {
  const NeonCachedImage({
    required this.getImageFile,
    this.isSvgHint = false,
    this.size,
    this.fit,
    this.svgColor,
    this.iconColor,
    super.key,
  });

  final Future<File> Function() getImageFile;
  final bool isSvgHint;

  final Size? size;
  final BoxFit? fit;

  final Color? svgColor;
  final Color? iconColor;

  @override
  State<NeonCachedImage> createState() => _NeonCachedImageState();
}

class _NeonCachedImageState extends State<NeonCachedImage> {
  late Future<File> future = widget.getImageFile();

  @override
  Widget build(final BuildContext context) => Center(
        child: FutureBuilder<File>(
          future: future,
          builder: (final context, final fileSnapshot) {
            if (fileSnapshot.hasData) {
              final content = fileSnapshot.data!.readAsBytesSync();

              try {
                // TODO: Is this safe enough?
                if (widget.isSvgHint || utf8.decode(content).contains('<svg')) {
                  return SvgPicture.memory(
                    content,
                    height: widget.size?.height,
                    width: widget.size?.width,
                    fit: widget.fit ?? BoxFit.contain,
                    color: widget.svgColor,
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
            }
            if (fileSnapshot.hasError) {
              return NeonException(
                fileSnapshot.error,
                onRetry: () {
                  setState(() {
                    // ignore: discarded_futures
                    future = widget.getImageFile();
                  });
                },
                onlyIcon: true,
                iconSize: widget.size?.shortestSide,
                color: widget.iconColor ?? Colors.red,
              );
            }
            return SizedBox(
              width: widget.size?.width,
              child: NeonLinearProgressIndicator(
                color: widget.iconColor,
              ),
            );
          },
        ),
      );
}
