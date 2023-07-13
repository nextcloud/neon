part of '../neon_files.dart';

class FilePreview extends StatelessWidget {
  const FilePreview({
    required this.bloc,
    required this.details,
    this.size = const Size.square(40),
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

          return OptionBuilder<bool>(
            option: bloc.options.showPreviewsOption,
            builder: (final context, final showPreviewsSnapshot) {
              if (showPreviewsSnapshot && (details.hasPreview ?? false)) {
                final account = Provider.of<AccountsBloc>(context, listen: false).activeAccount.value!;
                final child = FilePreviewImage(
                  account: account,
                  file: details,
                  size: size,
                );
                if (withBackground) {
                  return NeonImageWrapper(
                    borderRadius: borderRadius,
                    child: child,
                  );
                }
                return child;
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

class FilePreviewImage extends NeonCachedImage {
  factory FilePreviewImage({
    required final Account account,
    required final FileDetails file,
    required final Size size,
  }) {
    final width = size.width.toInt();
    final height = size.height.toInt();
    final path = file.path.join('/');
    final cacheKey = '${account.id}-preview-$path-$width-$height';

    return FilePreviewImage._(
      account: account,
      file: file,
      size: size,
      cacheKey: cacheKey,
      path: path,
      width: width,
      height: height,
    );
  }

  FilePreviewImage._({
    required final Account account,
    required final FileDetails file,
    required Size super.size,
    required super.cacheKey,
    required final String path,
    required final int width,
    required final int height,
  }) : super.custom(
          getImage: () async => account.client.core.getPreview(
            file: path,
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
