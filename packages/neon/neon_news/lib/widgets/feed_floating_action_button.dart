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
          final result = await showDialog<List>(
            context: context,
            builder: (final context) => NewsAddFeedDialog(
              bloc: bloc,
              folderID: folderID,
            ),
          );
          if (result != null) {
            bloc.addFeed(result[0] as String, result[1] as int?);
          }
        },
        tooltip: AppLocalizations.of(context).addFeed,
        child: const Icon(Icons.add),
      );
}
