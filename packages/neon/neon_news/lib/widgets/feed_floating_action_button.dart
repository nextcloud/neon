part of '../neon_news.dart';

class NewsFeedFloatingActionButton extends StatelessWidget {
  const NewsFeedFloatingActionButton({
    required this.bloc,
    this.folderID,
    super.key,
  });

  final NewsBloc bloc;
  final int? folderID;

  @override
  Widget build(final BuildContext context) => FloatingActionButton(
        onPressed: () async {
          final result = await showDialog<(String, int?)>(
            context: context,
            builder: (final context) => NewsAddFeedDialog(
              bloc: bloc,
              folderID: folderID,
            ),
          );
          if (result != null) {
            final (url, folderId) = result;
            bloc.addFeed(url, folderId);
          }
        },
        tooltip: AppLocalizations.of(context).feedAdd,
        child: const Icon(Icons.add),
      );
}
