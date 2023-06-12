part of '../neon_news.dart';

class NewsFolderFloatingActionButton extends StatelessWidget {
  const NewsFolderFloatingActionButton({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    final bloc = Provider.of<NewsBloc>(context, listen: false);

    return FloatingActionButton(
      onPressed: () async {
        final result = await showDialog<String>(
          context: context,
          builder: (final context) => const NewsCreateFolderDialog(),
        );
        if (result != null) {
          bloc.createFolder(result);
        }
      },
      tooltip: AppLocalizations.of(context).folderCreate,
      child: const Icon(Icons.add),
    );
  }
}
