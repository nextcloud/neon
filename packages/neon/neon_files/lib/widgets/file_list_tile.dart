import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:neon/widgets.dart';
import 'package:neon_files/neon_files.dart';
import 'package:neon_files/widgets/actions.dart';
import 'package:provider/provider.dart';

class FileListTile extends StatelessWidget {
  const FileListTile({
    required this.context,
    required this.details,
    required this.uploadProgress,
    required this.downloadProgress,
    this.enableFileActions = true,
    this.onPickFile,
    super.key,
  });

  final BuildContext context;
  final FileDetails details;
  final int? uploadProgress;
  final int? downloadProgress;
  final bool enableFileActions;
  final Function(FileDetails)? onPickFile;

  bool get _isUploading => uploadProgress != null;

  bool get _hasProgress => uploadProgress != null || downloadProgress != null;

  double? get _progress {
    if (!_hasProgress) {
      return null;
    }

    return (uploadProgress ?? downloadProgress)! / 100;
  }

  @override
  Widget build(final BuildContext context) {
    final bloc = Provider.of<FilesBloc>(context);
    final browserBloc = bloc.browser;

    // When the ETag is null it means we are uploading this file right now
    final onTap = details.isDirectory || details.etag != null
        ? () {
            if (details.isDirectory) {
              browserBloc.setPath(details.path);
            } else {
              onPickFile?.call(details);
            }
          }
        : null;

    return ListTile(
      onTap: onTap,
      title: Text(
        details.name,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Row(
        children: [
          if (details.lastModified != null) ...[
            RelativeTime(
              date: details.lastModified!,
            ),
          ],
          if (details.size != null && details.size! > 0) ...[
            const SizedBox(
              width: 10,
            ),
            Text(
              filesize(details.size, 1),
              style: DefaultTextStyle.of(context).style.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ],
        ],
      ),
      leading: _FileIcon(
        hasProgress: _hasProgress,
        isUploading: _isUploading,
        progress: _progress,
        details: details,
      ),
      trailing: !_hasProgress && enableFileActions
          ? FileActions(details: details)
          : const SizedBox.square(
              dimension: 48,
            ),
    );
  }
}

class _FileIcon extends StatelessWidget {
  const _FileIcon({
    required this.details,
    required this.hasProgress,
    required this.isUploading,
    this.progress,
  });

  final bool hasProgress;
  final bool isUploading;
  final double? progress;
  final FileDetails details;

  @override
  Widget build(final BuildContext context) {
    final bloc = Provider.of<FilesBloc>(context);

    Widget icon = Center(
      child: hasProgress
          ? Column(
              children: [
                Icon(
                  isUploading ? MdiIcons.upload : MdiIcons.download,
                  color: Theme.of(context).colorScheme.primary,
                ),
                LinearProgressIndicator(
                  value: progress,
                ),
              ],
            )
          : FilePreview(
              bloc: bloc,
              details: details,
              withBackground: true,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
    );

    if (details.isFavorite ?? false) {
      icon = Stack(
        children: [
          icon,
          const Align(
            alignment: Alignment.bottomRight,
            child: Icon(
              Icons.star,
              size: 14,
              color: Colors.yellow,
            ),
          )
        ],
      );
    }

    return SizedBox.square(
      dimension: 40,
      child: icon,
    );
  }
}
