import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:neon_files/l10n/localizations.dart';
import 'package:neon_files/src/blocs/files.dart';
import 'package:neon_files/src/dialogs/choose_folder.dart';
import 'package:neon_files/src/models/file_details.dart';
import 'package:neon_files/src/pages/details.dart';
import 'package:neon_framework/platform.dart';
import 'package:neon_framework/utils.dart';
import 'package:nextcloud/webdav.dart';

class FileActions extends StatelessWidget {
  const FileActions({
    required this.details,
    super.key,
  });

  final FileDetails details;

  Future<void> onSelected(final BuildContext context, final FilesFileAction action) async {
    final bloc = NeonProvider.of<FilesBloc>(context);
    final browserBloc = bloc.browser;
    switch (action) {
      case FilesFileAction.share:
        bloc.shareFileNative(details.uri, details.etag!);
      case FilesFileAction.toggleFavorite:
        if (details.isFavorite ?? false) {
          bloc.removeFavorite(details.uri);
        } else {
          bloc.addFavorite(details.uri);
        }
      case FilesFileAction.details:
        await Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (final context) => FilesDetailsPage(
              bloc: bloc,
              details: details,
            ),
          ),
        );
      case FilesFileAction.rename:
        if (!context.mounted) {
          return;
        }
        final result = await showRenameDialog(
          context: context,
          title: details.isDirectory
              ? FilesLocalizations.of(context).folderRename
              : FilesLocalizations.of(context).fileRename,
          value: details.name,
        );
        if (result != null) {
          bloc.rename(details.uri, result);
        }
      case FilesFileAction.move:
        if (!context.mounted) {
          return;
        }
        final originalPath = details.uri.parent!;
        final b = bloc.getNewFilesBrowserBloc(initialUri: originalPath);
        final result = await showDialog<PathUri>(
          context: context,
          builder: (final context) => FilesChooseFolderDialog(
            bloc: b,
            filesBloc: bloc,
            originalPath: originalPath,
          ),
        );
        b.dispose();
        if (result != null) {
          bloc.move(details.uri, result.join(PathUri.parse(details.name)));
        }
      case FilesFileAction.copy:
        if (!context.mounted) {
          return;
        }
        final originalPath = details.uri.parent!;
        final b = bloc.getNewFilesBrowserBloc(initialUri: originalPath);
        final result = await showDialog<PathUri>(
          context: context,
          builder: (final context) => FilesChooseFolderDialog(
            bloc: b,
            filesBloc: bloc,
            originalPath: originalPath,
          ),
        );
        b.dispose();
        if (result != null) {
          bloc.copy(details.uri, result.join(PathUri.parse(details.name)));
        }
      case FilesFileAction.sync:
        if (!context.mounted) {
          return;
        }
        final sizeWarning = browserBloc.options.downloadSizeWarning.value;
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
        bloc.syncFile(details.uri);
      case FilesFileAction.delete:
        if (!context.mounted) {
          return;
        }
        if (await showConfirmationDialog(
          context,
          details.isDirectory
              ? FilesLocalizations.of(context).folderDeleteConfirm(details.name)
              : FilesLocalizations.of(context).fileDeleteConfirm(details.name),
        )) {
          bloc.delete(details.uri);
        }
    }
  }

  @override
  Widget build(final BuildContext context) => PopupMenuButton<FilesFileAction>(
        itemBuilder: (final context) => [
          if (!details.isDirectory && NeonPlatform.instance.canUseSharing) ...[
            PopupMenuItem(
              value: FilesFileAction.share,
              child: Text(FilesLocalizations.of(context).actionShare),
            ),
          ],
          if (details.isFavorite != null) ...[
            PopupMenuItem(
              value: FilesFileAction.toggleFavorite,
              child: Text(
                details.isFavorite!
                    ? FilesLocalizations.of(context).removeFromFavorites
                    : FilesLocalizations.of(context).addToFavorites,
              ),
            ),
          ],
          PopupMenuItem(
            value: FilesFileAction.details,
            child: Text(FilesLocalizations.of(context).details),
          ),
          PopupMenuItem(
            value: FilesFileAction.rename,
            child: Text(FilesLocalizations.of(context).actionRename),
          ),
          PopupMenuItem(
            value: FilesFileAction.move,
            child: Text(FilesLocalizations.of(context).actionMove),
          ),
          PopupMenuItem(
            value: FilesFileAction.copy,
            child: Text(FilesLocalizations.of(context).actionCopy),
          ),
          // TODO: https://github.com/provokateurin/nextcloud-neon/issues/4
          if (!details.isDirectory) ...[
            PopupMenuItem(
              value: FilesFileAction.sync,
              child: Text(FilesLocalizations.of(context).actionSync),
            ),
          ],
          PopupMenuItem(
            value: FilesFileAction.delete,
            child: Text(FilesLocalizations.of(context).actionDelete),
          ),
        ],
        onSelected: (final action) async => onSelected(context, action),
      );
}

enum FilesFileAction {
  share,
  toggleFavorite,
  details,
  rename,
  move,
  copy,
  sync,
  delete,
}
