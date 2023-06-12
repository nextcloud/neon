part of '../neon_news.dart';

class NewsFeedFloatingActionButton extends StatelessWidget {
  const NewsFeedFloatingActionButton({
    this.folderID,
    super.key,
  });

  final int? folderID;

  @override
  Widget build(final BuildContext context) {
    final bloc = Provider.of<NewsBloc>(context, listen: false);

    return FloatingActionButton(
      onPressed: () async {
        final result = await showDialog<List>(
          context: context,
          builder: (final context) => NewsAddFeedDialog(
            folderID: folderID,
          ),
        );
        if (result != null) {
          bloc.addFeed(result[0] as String, result[1] as int?);
        }
      },
      tooltip: AppLocalizations.of(context).feedAdd,
      child: const Icon(Icons.add),
    );
  }
}
