import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:neon/theme.dart';
import 'package:neon/utils.dart';
import 'package:neon/widgets.dart';
import 'package:neon_files/l10n/localizations.dart';
import 'package:neon_files/neon_files.dart';
import 'package:neon_files/widgets/actions.dart';

class FileListTile extends StatelessWidget {
  const FileListTile({
    required this.bloc,
    required this.browserBloc,
    required this.details,
    this.mode = FilesBrowserMode.browser,
    super.key,
  });

  final FilesBloc bloc;
  final FilesBrowserBloc browserBloc;
  final FileDetails details;
  final FilesBrowserMode mode;

  Future<void> _onTap(final BuildContext context, final FileDetails details) async {
    if (details.isDirectory) {
      browserBloc.setPath(details.path);
    } else if (mode == FilesBrowserMode.browser) {
      final sizeWarning = bloc.options.downloadSizeWarning.value;
      if (sizeWarning != null && details.size != null && details.size! > sizeWarning) {
        if (!(await showConfirmationDialog(
          context,
          FilesLocalizations.of(context).downloadConfirmSizeWarning(
            filesize(sizeWarning),
            filesize(details.size),
          ),
        ))) {
          return;
        }
      }
      bloc.openFile(details.path, details.etag!, details.mimeType);
    }
  }

  @override
  Widget build(final BuildContext context) => ListTile(
        // When the ETag is null it means we are uploading this file right now
        onTap: details.isDirectory || details.etag != null ? () async => _onTap(context, details) : null,
        title: Text(
          details.name,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Row(
          children: [
            if (details.lastModified != null)
              RelativeTime(
                date: details.lastModified!,
              ),
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
          details: details,
          bloc: bloc,
        ),
        trailing: !details.hasTask && mode == FilesBrowserMode.browser
            ? FileActions(details: details)
            : const SizedBox.square(
                dimension: largeIconSize,
              ),
      );
}

class _FileIcon extends StatelessWidget {
  const _FileIcon({
    required this.details,
    required this.bloc,
  });

  final FileDetails details;
  final FilesBloc bloc;

  @override
  Widget build(final BuildContext context) {
    Widget icon = Center(
      child: details.hasTask
          ? StreamBuilder<double>(
              stream: details.task!.progress,
              builder: (final context, final progress) => Column(
                children: [
                  Icon(
                    switch (details.task!) {
                      FilesUploadTask() => MdiIcons.upload,
                      FilesDownloadTask() => MdiIcons.download,
                    },
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  LinearProgressIndicator(
                    value: progress.data,
                  ),
                ],
              ),
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
              size: smallIconSize,
              color: Colors.yellow,
            ),
          ),
        ],
      );
    }

    return SizedBox.square(
      dimension: largeIconSize,
      child: icon,
    );
  }
}
