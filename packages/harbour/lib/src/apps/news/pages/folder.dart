part of '../app.dart';

class NewsFolderPage extends StatelessWidget {
  const NewsFolderPage({
    required this.bloc,
    required this.folder,
    super.key,
  });

  final NewsBloc bloc;
  final NewsFolder folder;

  @override
  Widget build(final BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(folder.name!),
        ),
        body: NewsFolderView(
          bloc: bloc,
          folder: folder,
        ),
      );
}
