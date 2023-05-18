part of '../neon_news.dart';

class NewsFolderFloatingActionButton extends StatelessWidget {
  const NewsFolderFloatingActionButton({
    required this.bloc,
    super.key,
  });

  final NewsBloc bloc;

  @override
  Widget build(final BuildContext context) => FloatingActionButton(
        onPressed: () async {
          final result = await showDialog<String>(
            context: context,
            builder: (final context) => const NewsCreateFolderDialog(),
          );
          if (result != null) {
            bloc.createFolder(result);
          }
        },
        tooltip: AppLocalizations.of(context).createFolder,
        child: const Icon(Icons.add),
      );
}
