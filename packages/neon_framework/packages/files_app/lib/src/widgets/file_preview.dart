import 'package:files_app/src/blocs/files.dart';
import 'package:files_app/src/models/file_details.dart';
import 'package:flutter/material.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/core.dart' as core;

class FilePreview extends StatelessWidget {
  const FilePreview({
    required this.bloc,
    required this.details,
    this.size = const Size.square(largeIconSize),
    this.color,
    super.key,
  });

  final FilesBloc bloc;
  final FileDetails details;
  final Size size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? Theme.of(context).colorScheme.primary;

    Widget child;
    if (details.isDirectory) {
      child = Icon(
        AdaptiveIcons.folder,
        color: color,
        size: size.shortestSide,
      );
    } else {
      child = FilePreviewImage(
        file: details,
        size: size,
        account: NeonProvider.of<Account>(context),
      );
    }

    return SizedBox.fromSize(
      size: size,
      child: child,
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

    return FilePreviewImage._(
      file: file,
      size: size,
      width: width,
      height: height,
      account: account,
    );
  }

  FilePreviewImage._({
    required FileDetails file,
    required Size super.size,
    required int width,
    required int height,
    required super.account,
  }) : super(
          getRequest: (client) => client.core.preview.$getPreview_Request(
            file: file.uri.path,
            x: width,
            y: height,
            mimeFallback: core.PreviewGetPreviewMimeFallback.$1,
          ),
          etag: file.etag,
          expires: null,
          isSvgHint: file.mimeType?.contains('svg') ?? false,
          blurHash: file.blurHash,
        );
}
