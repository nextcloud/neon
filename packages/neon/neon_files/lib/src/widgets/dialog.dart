import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neon_files/l10n/localizations.dart';
import 'package:neon_files/src/blocs/browser.dart';
import 'package:neon_files/src/blocs/files.dart';
import 'package:neon_files/src/widgets/browser_view.dart';
import 'package:neon_framework/platform.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:path/path.dart' as p;
import 'package:universal_io/io.dart';

class FilesChooseCreateDialog extends StatefulWidget {
  const FilesChooseCreateDialog({
    required this.bloc,
    required this.basePath,
    super.key,
  });

  final FilesBloc bloc;
  final PathUri basePath;

  @override
  State<FilesChooseCreateDialog> createState() => _FilesChooseCreateDialogState();
}

class _FilesChooseCreateDialogState extends State<FilesChooseCreateDialog> {
  Future<void> uploadFromPick(final FileType type) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: type,
    );
    if (result != null) {
      for (final file in result.files) {
        await upload(File(file.path!));
      }
    }
  }

  Future<void> upload(final File file) async {
    final sizeWarning = widget.bloc.options.uploadSizeWarning.value;
    if (sizeWarning != null) {
      final stat = file.statSync();
      if (stat.size > sizeWarning) {
        if (!(await showConfirmationDialog(
          context,
          FilesLocalizations.of(context).uploadConfirmSizeWarning(
            filesize(sizeWarning),
            filesize(stat.size),
          ),
        ))) {
          return;
        }
      }
    }
    widget.bloc.uploadFile(
      widget.basePath.join(PathUri.parse(p.basename(file.path))),
      file.path,
    );
  }

  @override
  Widget build(final BuildContext context) => NeonDialog(
        children: [
          ListTile(
            leading: Icon(
              MdiIcons.filePlus,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(FilesLocalizations.of(context).uploadFiles),
            onTap: () async {
              await uploadFromPick(FileType.any);

              if (mounted) {
                Navigator.of(context).pop();
              }
            },
          ),
          ListTile(
            leading: Icon(
              MdiIcons.fileImagePlus,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(FilesLocalizations.of(context).uploadImages),
            onTap: () async {
              await uploadFromPick(FileType.image);

              if (mounted) {
                Navigator.of(context).pop();
              }
            },
          ),
          if (NeonPlatform.instance.canUseCamera) ...[
            ListTile(
              leading: Icon(
                MdiIcons.cameraPlus,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(FilesLocalizations.of(context).uploadCamera),
              onTap: () async {
                Navigator.of(context).pop();

                final picker = ImagePicker();
                final result = await picker.pickImage(source: ImageSource.camera);
                if (result != null) {
                  await upload(File(result.path));
                }
              },
            ),
          ],
          ListTile(
            leading: Icon(
              MdiIcons.folderPlus,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(FilesLocalizations.of(context).folderCreate),
            onTap: () async {
              Navigator.of(context).pop();

              final result = await showDialog<String>(
                context: context,
                builder: (final context) => const FilesCreateFolderDialog(),
              );
              if (result != null) {
                widget.bloc.browser.createFolder(widget.basePath.join(PathUri.parse(result)));
              }
            },
          ),
        ],
      );
}

class FilesChooseFolderDialog extends StatelessWidget {
  const FilesChooseFolderDialog({
    required this.bloc,
    required this.filesBloc,
    required this.originalPath,
    super.key,
  });

  final FilesBrowserBloc bloc;
  final FilesBloc filesBloc;

  final PathUri originalPath;

  @override
  Widget build(final BuildContext context) => AlertDialog(
        title: Text(FilesLocalizations.of(context).folderChoose),
        contentPadding: EdgeInsets.zero,
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              Expanded(
                child: FilesBrowserView(
                  bloc: bloc,
                  filesBloc: filesBloc,
                  mode: FilesBrowserMode.selectDirectory,
                ),
              ),
              StreamBuilder<PathUri>(
                stream: bloc.uri,
                builder: (final context, final uriSnapshot) => uriSnapshot.hasData
                    ? Container(
                        margin: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                final result = await showDialog<String>(
                                  context: context,
                                  builder: (final context) => const FilesCreateFolderDialog(),
                                );
                                if (result != null) {
                                  bloc.createFolder(uriSnapshot.requireData.join(PathUri.parse(result)));
                                }
                              },
                              child: Text(FilesLocalizations.of(context).folderCreate),
                            ),
                            ElevatedButton(
                              onPressed: originalPath != uriSnapshot.requireData
                                  ? () => Navigator.of(context).pop(uriSnapshot.requireData)
                                  : null,
                              child: Text(FilesLocalizations.of(context).folderChoose),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        ),
      );
}

class FilesCreateFolderDialog extends StatefulWidget {
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
  Widget build(final BuildContext context) => NeonDialog(
        title: Text(FilesLocalizations.of(context).folderCreate),
        children: [
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: FilesLocalizations.of(context).folderName,
                  ),
                  autofocus: true,
                  validator: (final input) => validateNotEmpty(context, input),
                  onFieldSubmitted: (final _) {
                    submit();
                  },
                ),
                ElevatedButton(
                  onPressed: submit,
                  child: Text(FilesLocalizations.of(context).folderCreate),
                ),
              ],
            ),
          ),
        ],
      );
}
