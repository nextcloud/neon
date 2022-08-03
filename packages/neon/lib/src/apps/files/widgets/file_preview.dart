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
  Widget build(BuildContext context) {
    final color = this.color ?? Theme.of(context).colorScheme.primary;
    return SizedBox(
      width: width.toDouble(),
      height: height.toDouble(),
      child: StreamBuilder<bool?>(
        stream: bloc.options.showPreviewsOption.stream,
        builder: (final context, final showPreviewsSnapshot) {
          if (!showPreviewsSnapshot.hasData) {
            return Container();
          }
          if (showPreviewsSnapshot.data! && (details.hasPreview ?? false) && details.etag != null) {
            return Builder(
              builder: (final context) {
                final account = RxBlocProvider.of<AccountsBloc>(context).activeAccount.value;
                if (account == null) {
                  return Container();
                }

                final stream = Provider.of<RequestManager>(context).wrapBytes(
                  account.client.id,
                  'files-preview-${details.etag}-$width-$height',
                  () async => (await account.client.core.getPreviewBytes(
                    details.path.join('/'),
                    width: width,
                    height: height,
                  ))!,
                  preferCache: true,
                );

                return ResultStreamBuilder<Uint8List>(
                  stream: stream,
                  builder: (
                    final context,
                    final previewData,
                    final previewError,
                    final previewLoading,
                  ) =>
                      Stack(
                    children: [
                      if (previewData != null) ...[
                        Center(
                          child: Builder(
                            builder: (final context) {
                              final child = Image.memory(
                                previewData,
                                fit: BoxFit.cover,
                                width: width.toDouble(),
                                height: height.toDouble(),
                              );
                              if (withBackground) {
                                return ImageWrapper(
                                  backgroundColor: Colors.white,
                                  borderRadius: borderRadius,
                                  child: child,
                                );
                              }
                              return child;
                            },
                          ),
                        ),
                      ],
                      if (previewError != null) ...[
                        Center(
                          child: Icon(
                            Icons.error_outline,
                            size: min(width.toDouble(), height.toDouble()),
                            color: color,
                          ),
                        ),
                      ],
                      if (previewLoading) ...[
                        Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: color,
                          ),
                        ),
                      ],
                    ],
                  ),
                );
              },
            );
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
