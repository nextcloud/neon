import 'package:flutter/material.dart';
import 'package:neon_files/l10n/localizations.dart';
import 'package:neon_files/src/blocs/browser.dart';
import 'package:neon_files/src/blocs/files.dart';
import 'package:neon_files/src/dialogs/create_folder.dart';
import 'package:neon_files/src/widgets/browser_view.dart';
import 'package:nextcloud/webdav.dart';

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
