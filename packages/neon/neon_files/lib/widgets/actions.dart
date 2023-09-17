import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:neon/utils.dart';
import 'package:neon_files/l10n/localizations.dart';
import 'package:neon_files/neon_files.dart';

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
      case FilesFileAction.toggleFavorite:
        if (details.isFavorite ?? false) {
          bloc.removeFavorite(details.path);
        } else {
          bloc.addFavorite(details.path);
        }
      case FilesFileAction.details:
        await Navigator.of(context).push(
          MaterialPageRoute(
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
          title:
              details.isDirectory ? AppLocalizations.of(context).folderRename : AppLocalizations.of(context).fileRename,
          value: details.name,
        );
        if (result != null) {
          bloc.rename(details.path, result);
        }
      case FilesFileAction.move:
        if (!context.mounted) {
          return;
        }
        final b = bloc.getNewFilesBrowserBloc();
        final originalPath = details.path.sublist(0, details.path.length - 1);
        b.setPath(originalPath);
        final result = await showDialog<List<String>?>(
          context: context,
          builder: (final context) => FilesChooseFolderDialog(
            bloc: b,
            filesBloc: bloc,
            originalPath: originalPath,
          ),
        );
        b.dispose();
        if (result != null) {
          bloc.move(details.path, result..add(details.name));
        }
      case FilesFileAction.copy:
        if (!context.mounted) {
          return;
        }
        final b = bloc.getNewFilesBrowserBloc();
        final originalPath = details.path.sublist(0, details.path.length - 1);
        b.setPath(originalPath);
        final result = await showDialog<List<String>?>(
          context: context,
          builder: (final context) => FilesChooseFolderDialog(
            bloc: b,
            filesBloc: bloc,
            originalPath: originalPath,
          ),
        );
        b.dispose();
        if (result != null) {
          bloc.copy(details.path, result..add(details.name));
        }
      case FilesFileAction.sync:
        if (!context.mounted) {
          return;
        }
        final sizeWarning = browserBloc.options.downloadSizeWarning.value;
        if (sizeWarning != null && details.size != null && details.size! > sizeWarning) {
          if (!(await showConfirmationDialog(
            context,
            AppLocalizations.of(context).downloadConfirmSizeWarning(
              filesize(sizeWarning),
              filesize(details.size),
            ),
          ))) {
            return;
          }
        }
        bloc.syncFile(details.path);
      case FilesFileAction.delete:
        if (!context.mounted) {
          return;
        }
        if (await showConfirmationDialog(
          context,
          details.isDirectory
              ? AppLocalizations.of(context).folderDeleteConfirm(details.name)
              : AppLocalizations.of(context).fileDeleteConfirm(details.name),
        )) {
          bloc.delete(details.path);
        }
    }
  }

  @override
  Widget build(final BuildContext context) => PopupMenuButton<FilesFileAction>(
        itemBuilder: (final context) => [
          if (details.isFavorite != null) ...[
            PopupMenuItem(
              value: FilesFileAction.toggleFavorite,
              child: Text(
                details.isFavorite!
                    ? AppLocalizations.of(context).removeFromFavorites
                    : AppLocalizations.of(context).addToFavorites,
              ),
            ),
          ],
          PopupMenuItem(
            value: FilesFileAction.details,
            child: Text(AppLocalizations.of(context).details),
          ),
          PopupMenuItem(
            value: FilesFileAction.rename,
            child: Text(AppLocalizations.of(context).actionRename),
          ),
          PopupMenuItem(
            value: FilesFileAction.move,
            child: Text(AppLocalizations.of(context).actionMove),
          ),
          PopupMenuItem(
            value: FilesFileAction.copy,
            child: Text(AppLocalizations.of(context).actionCopy),
          ),
          // TODO: https://github.com/provokateurin/nextcloud-neon/issues/4
          if (!details.isDirectory) ...[
            PopupMenuItem(
              value: FilesFileAction.sync,
              child: Text(AppLocalizations.of(context).actionSync),
            ),
          ],
          PopupMenuItem(
            value: FilesFileAction.delete,
            child: Text(AppLocalizations.of(context).actionDelete),
          ),
        ],
        onSelected: (final action) async => onSelected(context, action),
      );
}

enum FilesFileAction {
  toggleFavorite,
  details,
  rename,
  move,
  copy,
  sync,
  delete,
}
