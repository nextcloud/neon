part of '../neon_files.dart';

class FilesMainPage extends StatefulWidget {
  const FilesMainPage({
    super.key,
  });

  @override
  State<FilesMainPage> createState() => _FilesMainPageState();
}

class _FilesMainPageState extends State<FilesMainPage> {
  late FilesBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Provider.of<FilesBloc>(context, listen: false);

    bloc.errors.listen((final error) {
      NeonException.showSnackbar(context, error);
    });
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: FilesBrowserView(
          bloc: bloc.browser,
          filesBloc: bloc,
          onPickFile: (final details) async {
            final sizeWarning = bloc.options.downloadSizeWarning.value;
            if (sizeWarning != null && details.size != null && details.size! > sizeWarning) {
              if (!(await showConfirmationDialog(
                context,
                AppLocalizations.of(context).downloadConfirmSizeWarning(
                  filesize(sizeWarning),
                  filesize(details.size),
                ),
              ))) {
                return;
              }
            }
            bloc.openFile(details.path, details.etag!, details.mimeType);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await showDialog(
              context: context,
              builder: (final context) => FilesChooseCreateDialog(
                bloc: bloc,
                basePath: bloc.browser.path.value,
              ),
            );
          },
          tooltip: AppLocalizations.of(context).uploadFiles,
          child: const Icon(Icons.add),
        ),
      );
}
