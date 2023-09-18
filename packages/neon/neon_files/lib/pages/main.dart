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
    bloc = NeonProvider.of<FilesBloc>(context);

    bloc.errors.listen((final error) {
      NeonException.showSnackbar(context, error);
    });
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: FilesBrowserView(
          bloc: bloc.browser,
          filesBloc: bloc,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await showDialog<void>(
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
