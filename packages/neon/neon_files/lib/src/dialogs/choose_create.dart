import 'package:file_picker/file_picker.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neon_files/l10n/localizations.dart';
import 'package:neon_files/src/blocs/files.dart';
import 'package:neon_files/src/dialogs/create_folder.dart';
import 'package:neon_framework/platform.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/webdav.dart';
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
