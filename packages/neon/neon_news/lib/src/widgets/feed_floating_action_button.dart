import 'package:flutter/material.dart';
import 'package:neon_news/l10n/localizations.dart';
import 'package:neon_news/src/blocs/news.dart';
import 'package:neon_news/src/dialogs/add_feed.dart';

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
        tooltip: NewsLocalizations.of(context).feedAdd,
        child: const Icon(Icons.add),
      );
}
