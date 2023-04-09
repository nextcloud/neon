part of '../neon_files.dart';

class FilesMainPage extends StatefulWidget {
  const FilesMainPage({
    required this.bloc,
    super.key,
  });

  final FilesBloc bloc;

  @override
  State<FilesMainPage> createState() => _FilesMainPageState();
}

class _FilesMainPageState extends State<FilesMainPage> {
  @override
  void initState() {
    super.initState();

    widget.bloc.errors.listen((final error) {
      NeonException.showSnackbar(context, error);
    });
  }

  @override
  Widget build(final BuildContext context) => FilesBrowserView(
        bloc: widget.bloc.browser,
        filesBloc: widget.bloc,
        onPickFile: (final details) async {
          final sizeWarning = widget.bloc.options.downloadSizeWarning.value;
          if (sizeWarning != null && details.size > sizeWarning) {
            // ignore: use_build_context_synchronously
            if (!(await showConfirmationDialog(
              context,
              // ignore: use_build_context_synchronously
              AppLocalizations.of(context).filesConfirmDownloadSizeWarning(
                filesize(sizeWarning),
                filesize(details.size),
              ),
            ))) {
              return;
            }
          }
          widget.bloc.openFile(details.path, details.etag!, details.mimeType);
        },
      );
}
