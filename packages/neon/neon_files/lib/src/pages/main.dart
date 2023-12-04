import 'package:flutter/material.dart';
import 'package:neon/utils.dart';
import 'package:neon/widgets.dart';
import 'package:neon_files/l10n/localizations.dart';
import 'package:neon_files/src/blocs/files.dart';
import 'package:neon_files/src/dialogs/choose_create.dart';
import 'package:neon_files/src/widgets/browser_view.dart';

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
      NeonError.showSnackbar(context, error);
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
                basePath: bloc.browser.uri.value,
              ),
            );
          },
          tooltip: FilesLocalizations.of(context).uploadFiles,
          child: const Icon(Icons.add),
        ),
      );
}
