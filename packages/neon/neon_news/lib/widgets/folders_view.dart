part of '../neon_news.dart';

class NewsFoldersView extends StatelessWidget {
  const NewsFoldersView({
    required this.bloc,
    super.key,
  });

  final NewsBloc bloc;

  @override
  Widget build(final BuildContext context) => ResultBuilder<List<news.Folder>>.behaviorSubject(
        subject: bloc.folders,
        builder: (final context, final folders) => ResultBuilder<List<news.Feed>>.behaviorSubject(
          subject: bloc.feeds,
          builder: (final context, final feeds) => SortBoxBuilder<FoldersSortProperty, FolderFeedsWrapper>(
            sortBox: foldersSortBox,
            sortProperty: bloc.options.foldersSortPropertyOption,
            sortBoxOrder: bloc.options.foldersSortBoxOrderOption,
            input: feeds.hasData
                ? folders.data?.map((final folder) {
                    final feedsInFolder = feeds.requireData.where((final feed) => feed.folderId == folder.id);
                    final feedCount = feedsInFolder.length;
                    final unreadCount = feedsInFolder.fold(0, (final a, final b) => a + b.unreadCount!);

                    return (folder: folder, feedCount: feedCount, unreadCount: unreadCount);
                  }).toList()
                : null,
            builder: (final context, final sorted) => NeonListView(
              scrollKey: 'news-folders',
              isLoading: feeds.isLoading || folders.isLoading,
              error: feeds.error ?? folders.error,
              onRefresh: bloc.refresh,
              itemCount: sorted.length,
              itemBuilder: (final context, final index) => _buildFolder(
                context,
                sorted[index],
              ),
            ),
          ),
        ),
      );

  Widget _buildFolder(
    final BuildContext context,
    final FolderFeedsWrapper folderFeedsWrapper,
  ) {
    final (folder: folder, feedCount: feedCount, unreadCount: unreadCount) = folderFeedsWrapper;
    return ListTile(
      title: Text(
        folder.name,
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
              Icons.folder,
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
      trailing: PopupMenuButton<NewsFolderAction>(
        itemBuilder: (final context) => [
          PopupMenuItem(
            value: NewsFolderAction.delete,
            child: Text(NewsLocalizations.of(context).actionDelete),
          ),
          PopupMenuItem(
            value: NewsFolderAction.rename,
            child: Text(NewsLocalizations.of(context).actionRename),
          ),
        ],
        onSelected: (final action) async {
          switch (action) {
            case NewsFolderAction.delete:
              if (await showConfirmationDialog(
                context,
                NewsLocalizations.of(context).folderDeleteConfirm(folder.name),
              )) {
                bloc.deleteFolder(folder.id);
              }
            case NewsFolderAction.rename:
              if (!context.mounted) {
                return;
              }
              final result = await showRenameDialog(
                context: context,
                title: NewsLocalizations.of(context).folderRename,
                value: folder.name,
              );
              if (result != null) {
                bloc.renameFolder(folder.id, result);
              }
          }
        },
      ),
      onLongPress: () {
        if (unreadCount > 0) {
          bloc.markFolderAsRead(folder.id);
        }
      },
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (final context) => NewsFolderPage(
              bloc: bloc,
              folder: folder,
            ),
          ),
        );
      },
    );
  }
}

enum NewsFolderAction {
  delete,
  rename,
}
