part of '../app.dart';

class FilesChooseCreateDialog extends StatelessWidget {
  const FilesChooseCreateDialog({
    required this.bloc,
    required this.basePath,
    super.key,
  });

  final FilesBloc bloc;
  final List<String> basePath;

  Future upload(final FileType type) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: type,
    );
    if (result != null) {
      for (final file in result.files) {
        bloc.uploadFile([...basePath, file.name], file.path!);
      }
    }
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
              Navigator.of(context).pop();

              await upload(FileType.any);
            },
          ),
          ListTile(
            leading: Icon(
              MdiIcons.fileImagePlus,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(AppLocalizations.of(context).filesUploadImages),
            onTap: () async {
              Navigator.of(context).pop();

              await upload(FileType.image);
            },
          ),
          if (Provider.of<HarbourPlatform>(context, listen: false).canUseCamera) ...[
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
                  bloc.uploadFile([...basePath, result.name], result.path);
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
                bloc.browser.createFolder([...basePath, ...result]);
              }
            },
          ),
        ],
      );
}
