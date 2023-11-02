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
  Widget build(final BuildContext context) {
    final l10n = FilesLocalizations.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(details.name),
      ),
      body: SafeArea(
        child: ListView(
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
                _buildDataRow(
                  details.isDirectory ? l10n.detailsFolderName : l10n.detailsFileName,
                  details.name,
                ),
                _buildDataRow(
                  l10n.detailsParentFolder,
                  details.path.length == 1 ? '/' : details.path.sublist(0, details.path.length - 1).join('/'),
                ),
                if (details.size != null)
                  _buildDataRow(
                    details.isDirectory ? l10n.detailsFolderSize : l10n.detailsFileSize,
                    filesize(details.size, 1),
                  ),
                if (details.lastModified != null)
                  _buildDataRow(
                    l10n.detailsLastModified,
                    details.lastModified!.toLocal().toIso8601String(),
                  ),
                if (details.isFavorite != null)
                  _buildDataRow(
                    l10n.detailsIsFavorite,
                    details.isFavorite! ? l10n.actionYes : l10n.actionNo,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  DataRow _buildDataRow(final String key, final String value) => DataRow(
        cells: [
          DataCell(Text(key)),
          DataCell(Text(value)),
        ],
      );
}
