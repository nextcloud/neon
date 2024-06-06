import 'package:file_icons/file_icons.dart';
import 'package:flutter/material.dart';
import 'package:neon_files/src/blocs/files.dart';
import 'package:neon_files/src/models/file_details.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/core.dart';

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
  Widget build(BuildContext context) {
    final color = this.color ?? Theme.of(context).colorScheme.primary;

    return SizedBox.fromSize(
      size: size,
      child: Builder(
        builder: (context) {
          if (details.isDirectory) {
            return Icon(
              AdaptiveIcons.folder,
              color: color,
              size: size.shortestSide,
            );
          }

          return ValueListenableBuilder(
            valueListenable: bloc.options.showPreviewsOption,
            builder: (context, showPreviews, _) {
              if (showPreviews && (details.hasPreview ?? false)) {
                final preview = FilePreviewImage(
                  file: details,
                  size: size,
                  account: NeonProvider.of<Account>(context),
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
    required FileDetails file,
    required Size size,
    required Account account,
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
      account: account,
    );
  }

  FilePreviewImage._({
    required FileDetails file,
    required Size super.size,
    required super.cacheKey,
    required int width,
    required int height,
    required super.account,
  }) : super(
          getRequest: (client) => client.core.preview.$getPreview_Request(
            file: file.uri.path,
            x: width,
            y: height,
          ),
          etag: file.etag,
          expires: null,
          isSvgHint: file.mimeType?.contains('svg') ?? false,
          blurHash: file.blurHash,
        );
}
