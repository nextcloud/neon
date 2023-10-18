import 'package:flutter/material.dart';
import 'package:neon_news/l10n/localizations.dart';
import 'package:neon_news/src/blocs/news.dart';
import 'package:neon_news/src/widgets/dialog.dart';

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
        tooltip: NewsLocalizations.of(context).folderCreate,
        child: const Icon(Icons.add),
      );
}
