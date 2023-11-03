part of '../neon_files.dart';

class FilePreview extends StatelessWidget {
  const FilePreview({
    required this.bloc,
    required this.details,
    this.size = const Size.square(largeIconSize),
    this.color,
    this.borderRadius,
    this.withBackground = false,
    super.key,
  }) : assert(
          (borderRadius != null && withBackground) || borderRadius == null,
          'withBackground needs to be true when borderRadius is set',
        );

  final FilesBloc bloc;
  final FileDetails details;
  final Size size;
  final Color? color;
  final BorderRadius? borderRadius;
  final bool withBackground;

  @override
  Widget build(final BuildContext context) {
    final color = this.color ?? Theme.of(context).colorScheme.primary;

    return SizedBox.fromSize(
      size: size,
      child: Builder(
        builder: (final context) {
          if (details.isDirectory) {
            return Icon(
              MdiIcons.folder,
              color: color,
              size: size.shortestSide,
            );
          }

          return ValueListenableBuilder<bool>(
            valueListenable: bloc.options.showPreviewsOption,
            builder: (final context, final showPreviews, final _) {
              if (showPreviews && (details.hasPreview ?? false)) {
                final preview = FilePreviewImage(
                  file: details,
                  size: size,
                );

                if (withBackground) {
                  return NeonImageWrapper(
                    borderRadius: borderRadius,
                    child: preview,
                  );
                }

                return preview;
              }

              return FileIcon(
                details.name,
                color: color,
                size: size.shortestSide,
              );
            },
          );
        },
      ),
    );
  }
}

class FilePreviewImage extends NeonApiImage {
  factory FilePreviewImage({
    required final FileDetails file,
    required final Size size,
  }) {
    final width = size.width.toInt();
    final height = size.height.toInt();
    final cacheKey = 'preview-${file.uri.path}-$width-$height';

    return FilePreviewImage._(
      file: file,
      size: size,
      cacheKey: cacheKey,
      width: width,
      height: height,
    );
  }

  FilePreviewImage._({
    required final FileDetails file,
    required Size super.size,
    required super.cacheKey,
    required final int width,
    required final int height,
  }) : super(
          getImage: (final client) async => client.core.preview.getPreview(
            file: file.uri.path,
            x: width,
            y: height,
          ),
          writeCache: (final cacheManager, final data) async {
            await cacheManager.putFile(
              cacheKey,
              data,
              maxAge: const Duration(days: 7),
              eTag: file.etag,
            );
          },
          isSvgHint: file.mimeType?.contains('svg') ?? false,
        );
}
