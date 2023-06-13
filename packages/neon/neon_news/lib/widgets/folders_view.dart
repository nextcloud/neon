part of '../neon_news.dart';

class NewsFoldersView extends StatelessWidget {
  const NewsFoldersView({
    required this.bloc,
    super.key,
  });

  final NewsBloc bloc;

  @override
  Widget build(final BuildContext context) => ResultBuilder<List<NextcloudNewsFolder>>(
        stream: bloc.folders,
        builder: (final context, final folders) => ResultBuilder<List<NextcloudNewsFeed>>(
          stream: bloc.feeds,
          builder: (final context, final feeds) => SortBoxBuilder<FoldersSortProperty, FolderFeedsWrapper>(
            sortBox: foldersSortBox,
            sortPropertyOption: bloc.options.foldersSortPropertyOption,
            sortBoxOrderOption: bloc.options.foldersSortBoxOrderOption,
            input: feeds.data == null
                ? null
                : folders.data?.map((final folder) {
                    final feedsInFolder = feeds.data!.where((final feed) => feed.folderId == folder.id).toList();
                    final unreadCount = feedsInFolder.fold(0, (final a, final b) => a + b.unreadCount!);

                    return (folder, feedsInFolder, unreadCount);
                  }).toList(),
            builder: (final context, final sorted) => NeonListView<FolderFeedsWrapper>(
              scrollKey: 'news-folders',
              withFloatingActionButton: true,
              items: sorted,
              isLoading: feeds.loading || folders.loading,
              error: feeds.error ?? folders.error,
              onRefresh: bloc.refresh,
              builder: _buildFolder,
            ),
          ),
        ),
      );

  Widget _buildFolder(
    final BuildContext context,
    final FolderFeedsWrapper folderFeedsWrapper,
  ) {
    final (folder, feeds, unreadCount) = folderFeedsWrapper;
    return ListTile(
      title: Text(
        folder.name,
        style: unreadCount == 0
            ? Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).disabledColor)
            : null,
      ),
      subtitle: unreadCount > 0
          ? Text(
              AppLocalizations.of(context).articlesUnread(unreadCount),
            )
          : Container(),
      leading: SizedBox.square(
        dimension: 48,
        child: Stack(
          children: [
            Icon(
              Icons.folder,
              size: 48,
              color: Theme.of(context).colorScheme.primary,
            ),
            Center(
              child: Text(
                feeds.length.toString(),
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
            child: Text(AppLocalizations.of(context).actionDelete),
          ),
          PopupMenuItem(
            value: NewsFolderAction.rename,
            child: Text(AppLocalizations.of(context).actionRename),
          ),
        ],
        onSelected: (final action) async {
          switch (action) {
            case NewsFolderAction.delete:
              // ignore: use_build_context_synchronously
              if (await showConfirmationDialog(
                context,
                // ignore: use_build_context_synchronously
                AppLocalizations.of(context).folderDeleteConfirm(folder.name),
              )) {
                bloc.deleteFolder(folder.id);
              }
              break;
            case NewsFolderAction.rename:
              final result = await showRenameDialog(
                context: context,
                title: AppLocalizations.of(context).folderRename,
                value: folder.name,
              );
              if (result != null) {
                bloc.renameFolder(folder.id, result);
              }
              break;
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
          MaterialPageRoute(
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
