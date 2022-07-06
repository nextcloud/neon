part of '../app.dart';

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
      ExceptionWidget.showSnackbar(context, error);
    });
  }

  @override
  Widget build(BuildContext context) => FilesBrowserView(
        bloc: widget.bloc.browser,
        filesBloc: widget.bloc,
        onPickFile: (final details) {
          widget.bloc.openFile(details.path, details.etag!, details.mimeType);
        },
      );
}
