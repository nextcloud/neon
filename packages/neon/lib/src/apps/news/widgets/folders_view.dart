part of '../app.dart';

class NewsFoldersView extends StatelessWidget {
  const NewsFoldersView({
    required this.bloc,
    super.key,
  });

  final NewsBloc bloc;

  @override
  Widget build(final BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await showDialog<String>(
              context: context,
              builder: (final context) => const NewsCreateFolderDialog(),
            );
            if (result != null) {
              bloc.createFolder(result);
            }
          },
          child: const Icon(Icons.add),
        ),
        body: ResultBuilder<NewsBloc, List<NewsFolder>>(
          stream: bloc.folders,
          builder: (final context, final folders) => ResultBuilder<NewsBloc, List<NewsFeed>>(
            stream: bloc.feeds,
            builder: (final context, final feeds) => SortBoxBuilder<FoldersSortProperty, FolderFeedsWrapper>(
              sortBox: foldersSortBox,
              sortPropertyOption: bloc.options.foldersSortPropertyOption,
              sortBoxOrderOption: bloc.options.foldersSortBoxOrderOption,
              input: feeds.data == null
                  ? null
                  : folders.data
                      ?.map(
                        (final folder) => FolderFeedsWrapper(
                          folder,
                          feeds.data!.where((final feed) => feed.folderId == folder.id).toList(),
                        ),
                      )
                      .toList(),
              builder: (final context, final sorted) => CustomListView<FolderFeedsWrapper>(
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
        ),
      );

  Widget _buildFolder(
    final BuildContext context,
    final FolderFeedsWrapper folderFeedsWrapper,
  ) {
    final unreadCount = feedsUnreadCountSum(folderFeedsWrapper.feeds);
    return ListTile(
      title: Text(
        folderFeedsWrapper.folder.name,
        style: unreadCount == 0
            ? Theme.of(context).textTheme.subtitle1!.copyWith(color: Theme.of(context).disabledColor)
            : null,
      ),
      subtitle: unreadCount > 0
          ? Text(
              AppLocalizations.of(context).newsUnreadArticles(unreadCount),
            )
          : Container(),
      leading: SizedBox(
        width: 48,
        height: 48,
        child: Stack(
          children: [
            Icon(
              Icons.folder,
              size: 48,
              color: Theme.of(context).colorScheme.primary,
            ),
            Center(
              child: Text(
                folderFeedsWrapper.feeds.length.toString(),
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
            child: Text(AppLocalizations.of(context).delete),
          ),
          PopupMenuItem(
            value: NewsFolderAction.rename,
            child: Text(AppLocalizations.of(context).rename),
          ),
        ],
        onSelected: (final action) async {
          switch (action) {
            case NewsFolderAction.delete:
              if (await showConfirmationDialog(
                context,
                AppLocalizations.of(context).newsDeleteFolderConfirm(folderFeedsWrapper.folder.name),
              )) {
                bloc.deleteFolder(folderFeedsWrapper.folder.id);
              }
              break;
            case NewsFolderAction.rename:
              final result = await showRenameDialog(
                context: context,
                title: AppLocalizations.of(context).newsRenameFolder,
                value: folderFeedsWrapper.folder.name,
              );
              if (result != null) {
                bloc.renameFolder(folderFeedsWrapper.folder.id, result);
              }
              break;
          }
        },
      ),
      onLongPress: () {
        if (unreadCount > 0) {
          bloc.markFolderAsRead(folderFeedsWrapper.folder.id);
        }
      },
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (final context) => NewsFolderPage(
              bloc: bloc,
              folder: folderFeedsWrapper.folder,
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
