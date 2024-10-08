import 'package:files_app/l10n/localizations.dart';
import 'package:files_app/src/blocs/files.dart';
import 'package:files_app/src/models/file_details.dart';
import 'package:files_app/src/widgets/dialog.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/webdav.dart' as webdav;

/// Displays a [FilesCreateFolderDialog] for creating a new folder.
///
/// Returns a future with the folder name split by `/`.
Future<String?> showFolderCreateDialog({
  required BuildContext context,
}) =>
    showAdaptiveDialog<String>(
      context: context,
      builder: (context) => const FilesCreateFolderDialog(),
    );

/// Displays a [NeonConfirmationDialog] to confirm downloading a file larger
/// than the configured limit.
///
/// Returns a future whether the action has been accepted.
Future<bool> showDownloadConfirmationDialog(
  BuildContext context,
  int warningSize,
  int actualSize,
) async =>
    await showAdaptiveDialog<bool>(
      context: context,
      builder: (context) => NeonConfirmationDialog(
        title: FilesLocalizations.of(context).optionsDownloadSizeWarning,
        content: Text(
          FilesLocalizations.of(context).downloadConfirmSizeWarning(
            filesize(warningSize),
            filesize(actualSize),
          ),
        ),
      ),
    ) ??
    false;

/// Displays a [NeonConfirmationDialog] to confirm uploading a file larger than
/// the configured limit.
///
/// Returns a future whether the action has been accepted.
Future<bool> showUploadConfirmationDialog(
  BuildContext context,
  int warningSize,
  int actualSize,
) async =>
    await showAdaptiveDialog<bool>(
      context: context,
      builder: (context) => NeonConfirmationDialog(
        title: FilesLocalizations.of(context).optionsUploadSizeWarning,
        content: Text(
          FilesLocalizations.of(context).uploadConfirmSizeWarning(
            filesize(warningSize),
            filesize(actualSize),
          ),
        ),
      ),
    ) ??
    false;

/// Displays a [FilesChooseFolderDialog] to choose a new location for a file with the given [details].
///
/// Returns a future with the new location.
Future<webdav.PathUri?> showChooseFolderDialog(BuildContext context, FileDetails details) async {
  final filesBloc = NeonProvider.of<FilesBloc>(context);

  final result = await showDialog<webdav.PathUri>(
    context: context,
    builder: (context) => FilesChooseFolderDialog(
      bloc: filesBloc,
      uri: details.uri.parent!,
      hideUri: details.uri,
    ),
  );

  return result;
}

/// Displays a [NeonConfirmationDialog] to confirm deleting a file or folder with the given [details].
///
/// Returns a future whether the action has been accepted.
Future<bool> showDeleteConfirmationDialog(BuildContext context, FileDetails details) async =>
    await showAdaptiveDialog<bool>(
      context: context,
      builder: (context) => NeonConfirmationDialog(
        title: FilesLocalizations.of(context).actionDeleteTitle,
        icon: const Icon(Icons.delete_outlined),
        content: Text(
          details.isDirectory
              ? FilesLocalizations.of(context).folderDeleteConfirm(details.name)
              : FilesLocalizations.of(context).fileDeleteConfirm(details.name),
        ),
      ),
    ) ??
    false;

/// Displays an adaptive modal to select or create a file.
Future<void> showFilesCreateModal(BuildContext context, webdav.PathUri uri) {
  final theme = Theme.of(context);
  final bloc = NeonProvider.of<FilesBloc>(context);

  switch (theme.platform) {
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
    case TargetPlatform.linux:
    case TargetPlatform.windows:
      return showModalBottomSheet(
        context: context,
        builder: (_) => FilesChooseCreateModal(
          bloc: bloc,
          uri: uri,
        ),
      );

    case TargetPlatform.iOS:
    case TargetPlatform.macOS:
      return showCupertinoModalPopup(
        context: context,
        builder: (_) => FilesChooseCreateModal(
          bloc: bloc,
          uri: uri,
        ),
      );
  }
}
