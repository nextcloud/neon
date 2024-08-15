import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:files_app/l10n/localizations.dart';
import 'package:files_app/src/blocs/browser.dart';
import 'package:files_app/src/blocs/files.dart';
import 'package:files_app/src/options.dart';
import 'package:files_app/src/utils/dialog.dart';
import 'package:files_app/src/widgets/browser_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neon_framework/platform.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/webdav.dart' as webdav;

/// Creates an adaptive bottom sheet to select an action to add a file.
class FilesChooseCreateModal extends StatelessWidget {
  /// Creates a new add files modal.
  const FilesChooseCreateModal({
    required this.bloc,
    required this.uri,
    super.key,
  });

  /// The bloc of the flies client.
  final FilesBloc bloc;

  final webdav.PathUri uri;

  Future<void> uploadFromPick(BuildContext context, FileType type) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: type,
    );

    if (context.mounted) {
      Navigator.of(context).pop();
    }

    if (result != null) {
      for (final file in result.files) {
        if (!context.mounted || !await confirmUpload(context, file.size)) {
          return;
        }

        if (kIsWeb) {
          bloc.uploadMemory(
            uri.join(webdav.PathUri.parse(file.name)),
            file.bytes!,
          );
        } else {
          bloc.uploadFile(
            uri.join(webdav.PathUri.parse(file.name)),
            file.path!,
          );
        }
      }
    }
  }

  Future<bool> confirmUpload(BuildContext context, int size) async {
    final sizeWarning = NeonProvider.of<FilesOptions>(context).uploadSizeWarning.value;
    if (sizeWarning != null) {
      if (size > sizeWarning) {
        final result = await showUploadConfirmationDialog(context, sizeWarning, size);

        if (!result) {
          return false;
        }
      }
    }
    return true;
  }

  Widget wrapAction({
    required BuildContext context,
    required Widget icon,
    required Widget message,
    required VoidCallback onPressed,
  }) {
    final theme = Theme.of(context);

    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return ListTile(
          leading: icon,
          title: message,
          onTap: onPressed,
        );

      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoActionSheetAction(
          onPressed: onPressed,
          child: message,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final title = FilesLocalizations.of(context).filesChooseCreate;

    final actions = [
      wrapAction(
        context: context,
        icon: Icon(
          MdiIcons.filePlus,
          color: Theme.of(context).colorScheme.primary,
        ),
        message: Text(FilesLocalizations.of(context).uploadFiles),
        onPressed: () async => uploadFromPick(context, FileType.any),
      ),
      wrapAction(
        context: context,
        icon: Icon(
          MdiIcons.fileImagePlus,
          color: Theme.of(context).colorScheme.primary,
        ),
        message: Text(FilesLocalizations.of(context).uploadImages),
        onPressed: () async => uploadFromPick(context, FileType.image),
      ),
      if (NeonPlatform.instance.canUseCamera)
        wrapAction(
          context: context,
          icon: Icon(
            MdiIcons.cameraPlus,
            color: Theme.of(context).colorScheme.primary,
          ),
          message: Text(FilesLocalizations.of(context).uploadCamera),
          onPressed: () async {
            Navigator.of(context).pop();

            final picker = ImagePicker();
            final result = await picker.pickImage(source: ImageSource.camera);
            if (result != null) {
              final length = await result.length();
              if (!context.mounted || !await confirmUpload(context, length)) {
                return;
              }
              if (kIsWeb) {
                bloc.uploadMemory(
                  uri.join(webdav.PathUri.parse(result.name)),
                  await result.readAsBytes(),
                );
              } else {
                bloc.uploadFile(
                  uri.join(webdav.PathUri.parse(result.name)),
                  result.path,
                );
              }
            }
          },
        ),
      wrapAction(
        context: context,
        icon: Icon(
          MdiIcons.folderPlus,
          color: Theme.of(context).colorScheme.primary,
        ),
        message: Text(FilesLocalizations.of(context).folderCreate),
        onPressed: () async {
          Navigator.of(context).pop();

          final result = await showFolderCreateDialog(context: context);
          if (result != null) {
            bloc.createFolder(uri.join(webdav.PathUri.parse(result)));
          }
        },
      ),
    ];

    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return BottomSheet(
          onClosing: () {},
          builder: (context) => Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      title,
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                ),
                ...actions,
              ],
            ),
          ),
        );

      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoActionSheet(
          actions: actions,
          title: Text(title),
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context),
            isDestructiveAction: true,
            child: Text(NeonLocalizations.of(context).actionCancel),
          ),
        );
    }
  }
}

/// A dialog for choosing a folder.
///
/// This dialog is not adaptive and always builds a material design dialog.
class FilesChooseFolderDialog extends StatefulWidget {
  /// Creates a new folder chooser dialog.
  const FilesChooseFolderDialog({
    required this.bloc,
    required this.uri,
    this.hideUri,
    super.key,
  });

  final FilesBloc bloc;

  final webdav.PathUri uri;

  final webdav.PathUri? hideUri;

  @override
  State<FilesChooseFolderDialog> createState() => _FilesChooseFolderDialogState();
}

class _FilesChooseFolderDialogState extends State<FilesChooseFolderDialog> {
  late webdav.PathUri uri = widget.uri;

  @override
  Widget build(BuildContext context) {
    final dialogTheme = NeonDialogTheme.of(context);

    final actions = [
      OutlinedButton(
        onPressed: () async {
          final result = await showFolderCreateDialog(context: context);

          if (result != null) {
            widget.bloc.createFolder(uri.join(webdav.PathUri.parse(result)));
          }
        },
        child: Text(
          FilesLocalizations.of(context).folderCreate,
          textAlign: TextAlign.end,
        ),
      ),
      ElevatedButton(
        onPressed: () => Navigator.of(context).pop(uri),
        child: Text(
          FilesLocalizations.of(context).folderChoose,
          textAlign: TextAlign.end,
        ),
      ),
    ];

    return AlertDialog(
      title: Text(FilesLocalizations.of(context).folderChoose),
      content: ConstrainedBox(
        constraints: dialogTheme.constraints,
        child: SizedBox(
          width: double.maxFinite,
          child: FilesBrowserView(
            filesBloc: widget.bloc,
            uri: uri,
            mode: FilesBrowserMode.selectDirectory,
            setPath: (uri) {
              setState(() {
                this.uri = uri;
              });
            },
            hideUri: widget.hideUri,
          ),
        ),
      ),
      actions: actions,
    );
  }
}

/// A [NeonDialog] that shows for renaming creating a new folder.
///
/// Use `showFolderCreateDialog` to display this dialog.
///
/// When submitted the folder name will be popped as a `String`.
class FilesCreateFolderDialog extends StatefulWidget {
  /// Creates a new NeonDialog for creating a folder.
  const FilesCreateFolderDialog({
    super.key,
  });

  @override
  State<FilesCreateFolderDialog> createState() => _FilesCreateFolderDialogState();
}

class _FilesCreateFolderDialogState extends State<FilesCreateFolderDialog> {
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void submit() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pop(controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final content = Material(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: FilesLocalizations.of(context).folderName,
        ),
        autofocus: true,
        validator: (input) => validateNotEmpty(context, input),
        onFieldSubmitted: (_) {
          submit();
        },
      ),
    );

    return NeonDialog(
      title: Text(FilesLocalizations.of(context).folderCreate),
      content: Form(
        key: formKey,
        child: content,
      ),
      actions: [
        NeonDialogAction(
          isDefaultAction: true,
          onPressed: submit,
          child: Text(
            FilesLocalizations.of(context).folderCreate,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
