part of '../app.dart';

class FilePreview extends StatelessWidget {
  const FilePreview({
    required this.bloc,
    required this.details,
    this.width = 40,
    this.height = 40,
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
  final int width;
  final int height;
  final Color? color;
  final BorderRadius? borderRadius;
  final bool withBackground;

  @override
  Widget build(final BuildContext context) {
    final color = this.color ?? Theme.of(context).colorScheme.primary;
    return SizedBox(
      width: width.toDouble(),
      height: height.toDouble(),
      child: StreamBuilder<bool?>(
        stream: bloc.options.showPreviewsOption.stream,
        builder: (final context, final showPreviewsSnapshot) {
          if ((showPreviewsSnapshot.data ?? false) && (details.hasPreview ?? false)) {
            final account = RxBlocProvider.of<AccountsBloc>(context).activeAccount.value!;
            final child = CachedAPIImage(
              account: account,
              cacheKey: 'preview-${details.path.join('/')}-$width-$height',
              etag: details.etag,
              download: () async => account.client.core.getPreview(
                file: details.path.join('/'),
                x: width,
                y: height,
              ),
            );
            if (withBackground) {
              return ImageWrapper(
                color: Colors.white,
                borderRadius: borderRadius,
                child: child,
              );
            }
            return child;
          }

          if (details.isDirectory) {
            return Icon(
              MdiIcons.folder,
              color: color,
              size: min(width.toDouble(), height.toDouble()),
            );
          }

          return FileIcon(
            details.name,
            color: color,
            size: min(width.toDouble(), height.toDouble()),
          );
        },
      ),
    );
  }
}
