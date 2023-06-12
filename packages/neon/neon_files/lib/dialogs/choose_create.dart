part of '../neon_files.dart';

class FilesChooseCreateDialog extends StatefulWidget {
  const FilesChooseCreateDialog({
    required this.basePath,
    super.key,
  });

  final List<String> basePath;

  @override
  State<FilesChooseCreateDialog> createState() => _FilesChooseCreateDialogState();
}

class _FilesChooseCreateDialogState extends State<FilesChooseCreateDialog> {
  late FilesBloc filesBloc;

  @override
  void initState() {
    filesBloc = Provider.of<FilesBloc>(context, listen: false);

    super.initState();
  }

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
    final sizeWarning = filesBloc.options.uploadSizeWarning.value;
    if (sizeWarning != null) {
      final stat = file.statSync();
      if (stat.size > sizeWarning) {
        // ignore: use_build_context_synchronously
        if (!(await showConfirmationDialog(
          context,
          // ignore: use_build_context_synchronously
          AppLocalizations.of(context).uploadConfirmSizeWarning(
            filesize(sizeWarning),
            filesize(stat.size),
          ),
        ))) {
          return;
        }
      }
    }
    filesBloc.uploadFile([...widget.basePath, p.basename(file.path)], file.path);
  }

  @override
  Widget build(final BuildContext context) => NeonDialog(
        children: [
          ListTile(
            leading: Icon(
              MdiIcons.filePlus,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(AppLocalizations.of(context).uploadFiles),
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
            title: Text(AppLocalizations.of(context).uploadImages),
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
              title: Text(AppLocalizations.of(context).uploadCamera),
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
            title: Text(AppLocalizations.of(context).folderCreate),
            onTap: () async {
              Navigator.of(context).pop();

              final result = await showDialog<List<String>>(
                context: context,
                builder: (final context) => const FilesCreateFolderDialog(),
              );
              if (result != null) {
                filesBloc.browser.createFolder([...widget.basePath, ...result]);
              }
            },
          ),
        ],
      );
}
