part of '../neon_files.dart';

class FilesDetailsPage extends StatelessWidget {
  const FilesDetailsPage({
    required this.bloc,
    required this.details,
    super.key,
  });

  final FilesBloc bloc;
  final FileDetails details;

  @override
  Widget build(final BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(details.name),
        ),
        body: ListView(
          primary: true,
          children: [
            ColoredBox(
              color: Theme.of(context).colorScheme.primary,
              child: FilePreview(
                bloc: bloc,
                details: details,
                color: Theme.of(context).colorScheme.onPrimary,
                size: Size(
                  MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height / 4,
                ),
              ),
            ),
            DataTable(
              headingRowHeight: 0,
              columns: const [
                DataColumn(label: SizedBox()),
                DataColumn(label: SizedBox()),
              ],
              rows: [
                for (final entry in {
                  details.isDirectory
                      ? FilesLocalizations.of(context).detailsFolderName
                      : FilesLocalizations.of(context).detailsFileName: details.name,
                  FilesLocalizations.of(context).detailsParentFolder:
                      details.path.length == 1 ? '/' : details.path.sublist(0, details.path.length - 1).join('/'),
                  if (details.size != null) ...{
                    details.isDirectory
                        ? FilesLocalizations.of(context).detailsFolderSize
                        : FilesLocalizations.of(context).detailsFileSize: filesize(details.size, 1),
                  },
                  if (details.lastModified != null) ...{
                    FilesLocalizations.of(context).detailsLastModified:
                        details.lastModified!.toLocal().toIso8601String(),
                  },
                  if (details.isFavorite != null) ...{
                    FilesLocalizations.of(context).detailsIsFavorite: details.isFavorite!
                        ? FilesLocalizations.of(context).actionYes
                        : FilesLocalizations.of(context).actionNo,
                  },
                }.entries) ...[
                  DataRow(
                    cells: [
                      DataCell(Text(entry.key)),
                      DataCell(Text(entry.value)),
                    ],
                  ),
                ],
              ],
            ),
          ],
        ),
      );
}
