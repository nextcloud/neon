import 'package:flutter/material.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/sort_box.dart';
import 'package:neon_framework/theme.dart';
import 'package:neon_framework/widgets.dart';
import 'package:neon_news/l10n/localizations.dart';
import 'package:neon_news/src/blocs/news.dart';
import 'package:neon_news/src/pages/folder.dart';
import 'package:neon_news/src/sort/folders.dart';
import 'package:neon_news/src/utils/dialog.dart';

class NewsFoldersView extends StatelessWidget {
  const NewsFoldersView({
    required this.bloc,
    super.key,
  });

  final NewsBloc bloc;

  @override
  Widget build(BuildContext context) {
    return ResultBuilder.behaviorSubject(
      subject: bloc.folders,
      builder: (context, folders) => ResultBuilder.behaviorSubject(
        subject: bloc.feeds,
        builder: (context, feeds) => SortBoxBuilder(
          sortBox: foldersSortBox,
          sortProperty: bloc.options.foldersSortPropertyOption,
          sortBoxOrder: bloc.options.foldersSortBoxOrderOption,
          input: feeds.hasData
              ? [
                  ...?folders.data,
                  if (feeds.requireData.where((feed) => feed.folderId == null).isNotEmpty) null,
                ].map((folder) {
                  final feedsInFolder = feeds.requireData.where((feed) => feed.folderId == folder?.id);
                  final feedCount = feedsInFolder.length;
                  final unreadCount = feedsInFolder.fold(0, (a, b) => a + b.unreadCount!);

                  return (folder: folder, feedCount: feedCount, unreadCount: unreadCount);
                }).toList()
              : null,
          builder: (context, sorted) => NeonListView(
            scrollKey: 'news-folders',
            isLoading: feeds.isLoading || folders.isLoading,
            error: feeds.error ?? folders.error,
            onRefresh: bloc.refresh,
            itemCount: sorted.length,
            itemBuilder: (context, index) => _buildFolder(
              context,
              sorted[index],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFolder(
    BuildContext context,
    FolderFeedsWrapper folderFeedsWrapper,
  ) {
    final (folder: folder, feedCount: feedCount, unreadCount: unreadCount) = folderFeedsWrapper;
    return ListTile(
      title: Text(
        folder?.name ?? NewsLocalizations.of(context).folderRoot,
        style: unreadCount == 0
            ? Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).disabledColor)
            : null,
      ),
      subtitle: unreadCount > 0 ? Text(NewsLocalizations.of(context).articlesUnread(unreadCount)) : const SizedBox(),
      leading: SizedBox.square(
        dimension: largeIconSize,
        child: Stack(
          children: [
            Icon(
              AdaptiveIcons.folder,
              size: largeIconSize,
              color: Theme.of(context).colorScheme.primary,
            ),
            Center(
              child: Text(
                feedCount.toString(),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
      trailing: folder != null
          ? PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: NewsFolderAction.delete,
                  child: Text(NewsLocalizations.of(context).actionDelete),
                ),
                PopupMenuItem(
                  value: NewsFolderAction.rename,
                  child: Text(NewsLocalizations.of(context).actionRename),
                ),
              ],
              onSelected: (action) async {
                switch (action) {
                  case NewsFolderAction.delete:
                    final result = await showFolderDeleteDialog(context: context, folderName: folder.name);
                    if (result) {
                      bloc.deleteFolder(folder.id);
                    }
                  case NewsFolderAction.rename:
                    if (!context.mounted) {
                      return;
                    }
                    final result = await showFolderRenameDialog(context: context, folderName: folder.name);
                    if (result != null) {
                      bloc.renameFolder(folder.id, result);
                    }
                }
              },
            )
          : null,
      onLongPress: folder != null
          ? () {
              if (unreadCount > 0) {
                bloc.markFolderAsRead(folder.id);
              }
            }
          : null,
      onTap: folder != null
          ? () async {
              await Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => NewsFolderPage(
                    bloc: bloc,
                    folder: folder,
                  ),
                ),
              );
            }
          : null,
    );
  }
}

enum NewsFolderAction {
  delete,
  rename,
}
