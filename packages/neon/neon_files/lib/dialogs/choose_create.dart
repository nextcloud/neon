part of '../neon_files.dart';

class FilesChooseCreateDialog extends StatefulWidget {
  const FilesChooseCreateDialog({
    required this.bloc,
    required this.basePath,
    super.key,
  });

  final FilesBloc bloc;
  final List<String> basePath;

  @override
  State<FilesChooseCreateDialog> createState() => _FilesChooseCreateDialogState();
}

class _FilesChooseCreateDialogState extends State<FilesChooseCreateDialog> {
  Future uploadFromPick(final FileType type) async {
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

  Future upload(final File file) async {
    final sizeWarning = widget.bloc.options.uploadSizeWarning.value;
    if (sizeWarning != null) {
      final stat = file.statSync();
      if (stat.size > sizeWarning) {
        // ignore: use_build_context_synchronously
        if (!(await showConfirmationDialog(
          context,
          // ignore: use_build_context_synchronously
          AppLocalizations.of(context).filesConfirmUploadSizeWarning(
            filesize(sizeWarning),
            filesize(stat.size),
          ),
        ))) {
          return;
        }
      }
    }
    widget.bloc.uploadFile([...widget.basePath, p.basename(file.path)], file.path);
  }

  @override
  Widget build(final BuildContext context) => CustomDialog(
        children: [
          ListTile(
            leading: Icon(
              MdiIcons.filePlus,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(AppLocalizations.of(context).filesUploadFiles),
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
            title: Text(AppLocalizations.of(context).filesUploadImages),
            onTap: () async {
              await uploadFromPick(FileType.image);

              if (mounted) {
                Navigator.of(context).pop();
              }
            },
          ),
          if (Provider.of<NeonPlatform>(context, listen: false).canUseCamera) ...[
            ListTile(
              leading: Icon(
                MdiIcons.cameraPlus,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(AppLocalizations.of(context).filesUploadCamera),
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
            title: Text(AppLocalizations.of(context).filesCreateFolder),
            onTap: () async {
              Navigator.of(context).pop();

              final result = await showDialog<List<String>>(
                context: context,
                builder: (final context) => const FilesCreateFolderDialog(),
              );
              if (result != null) {
                widget.bloc.browser.createFolder([...widget.basePath, ...result]);
              }
            },
          ),
        ],
      );
}
