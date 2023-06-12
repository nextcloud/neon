part of '../neon_files.dart';

class FilesChooseFolderDialog extends StatelessWidget {
  const FilesChooseFolderDialog({
    required this.originalPath,
    super.key,
  });

  final List<String> originalPath;

  @override
  Widget build(final BuildContext context) {
    final bloc = Provider.of<FilesBloc>(context, listen: false).browser;

    return AlertDialog(
      title: Text(AppLocalizations.of(context).folderChoose),
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            const Expanded(
              child: FilesBrowserView(
                enableFileActions: false,
                onlyShowDirectories: true,
              ),
            ),
            StreamBuilder<List<String>>(
              stream: bloc.path,
              builder: (final context, final pathSnapshot) => pathSnapshot.hasData
                  ? Container(
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              final result = await showDialog<List<String>>(
                                context: context,
                                builder: (final context) => const FilesCreateFolderDialog(),
                              );
                              if (result != null) {
                                bloc.createFolder([...pathSnapshot.data!, ...result]);
                              }
                            },
                            child: Text(AppLocalizations.of(context).folderCreate),
                          ),
                          ElevatedButton(
                            onPressed: !(const ListEquality().equals(originalPath, pathSnapshot.data))
                                ? () => Navigator.of(context).pop(pathSnapshot.data)
                                : null,
                            child: Text(AppLocalizations.of(context).folderChoose),
                          ),
                        ],
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
