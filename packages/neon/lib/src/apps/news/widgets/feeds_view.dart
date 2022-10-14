part of '../app.dart';

class NewsFeedsView extends StatelessWidget {
  const NewsFeedsView({
    required this.bloc,
    this.folderID,
    super.key,
  });

  final NewsBloc bloc;
  final int? folderID;

  @override
  Widget build(final BuildContext context) => StandardRxResultBuilder<NewsBloc, List<NewsFolder>>(
        bloc: bloc,
        state: (final bloc) => bloc.folders,
        builder: (
          final context,
          final foldersData,
          final foldersError,
          final foldersLoading,
          final _,
        ) =>
            StandardRxResultBuilder<NewsBloc, List<NewsFeed>>(
          bloc: bloc,
          state: (final bloc) => bloc.feeds,
          builder: (
            final context,
            final feedsData,
            final feedsError,
            final feedsLoading,
            final _,
          ) =>
              Scaffold(
            resizeToAvoidBottomInset: false,
            floatingActionButton: FloatingActionButton(
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
              child: const Icon(Icons.add),
            ),
            body: SortBoxBuilder<FeedsSortProperty, NewsFeed>(
              sortBox: feedsSortBox,
              sortPropertyOption: bloc.options.feedsSortPropertyOption,
              sortBoxOrderOption: bloc.options.feedsSortBoxOrderOption,
              input: foldersData == null
                  ? null
                  : feedsData?.where((final f) => folderID == null || f.folderId == folderID).toList(),
              builder: (final context, final sorted) => CustomListView<NewsFeed>(
                scrollKey: 'news-feeds',
                withFloatingActionButton: true,
                items: sorted,
                isLoading: feedsLoading || foldersLoading,
                error: feedsError ?? foldersError,
                onRetry: () {
                  bloc.refresh(
                    mainArticlesToo: false,
                  );
                },
                onRefresh: () async {
                  bloc.refresh(
                    mainArticlesToo: true,
                  );
                },
                builder: (final context, final feed) => _buildFeed(
                  context,
                  feed,
                  foldersData!,
                ),
              ),
            ),
          ),
        ),
      );

  Widget _buildFeed(
    final BuildContext context,
    final NewsFeed feed,
    final List<NewsFolder> folders,
  ) =>
      ListTile(
        title: Text(
          feed.title,
          style: feed.unreadCount! == 0
              ? Theme.of(context).textTheme.subtitle1!.copyWith(color: Theme.of(context).disabledColor)
              : null,
        ),
        subtitle: feed.unreadCount! > 0
            ? Text(AppLocalizations.of(context).newsUnreadArticles(feed.unreadCount!))
            : Container(),
        leading: NewsFeedIcon(
          feed: feed,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (feed.updateErrorCount > 0) ...[
              IconButton(
                iconSize: 30,
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (final context) => NewsFeedUpdateErrorDialog(
                      feed: feed,
                    ),
                  );
                },
                icon: Text(
                  feed.updateErrorCount.toString(),
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ],
            PopupMenuButton<NewsFeedAction>(
              itemBuilder: (final context) => [
                PopupMenuItem(
                  value: NewsFeedAction.showURL,
                  child: Text(AppLocalizations.of(context).newsShowFeedURL),
                ),
                PopupMenuItem(
                  value: NewsFeedAction.delete,
                  child: Text(AppLocalizations.of(context).delete),
                ),
                PopupMenuItem(
                  value: NewsFeedAction.rename,
                  child: Text(AppLocalizations.of(context).rename),
                ),
                if (folders.isNotEmpty) ...[
                  PopupMenuItem(
                    value: NewsFeedAction.move,
                    child: Text(AppLocalizations.of(context).move),
                  ),
                ],
              ],
              onSelected: (final action) async {
                switch (action) {
                  case NewsFeedAction.showURL:
                    await showDialog(
                      context: context,
                      builder: (final context) => NewsFeedShowURLDialog(
                        feed: feed,
                      ),
                    );
                    break;
                  case NewsFeedAction.delete:
                    if (await showConfirmationDialog(
                      context,
                      AppLocalizations.of(context).newsRemoveFeedConfirm(feed.title),
                    )) {
                      bloc.removeFeed(feed.id);
                    }
                    break;
                  case NewsFeedAction.rename:
                    final result = await showRenameDialog(
                      context: context,
                      title: AppLocalizations.of(context).newsRenameFeed,
                      value: feed.title,
                    );
                    if (result != null) {
                      bloc.renameFeed(feed.id, result);
                    }
                    break;
                  case NewsFeedAction.move:
                    final result = await showDialog<List<int?>>(
                      context: context,
                      builder: (final context) => NewsMoveFeedDialog(
                        folders: folders,
                        feed: feed,
                      ),
                    );
                    if (result != null) {
                      bloc.moveFeed(feed.id, result[0]);
                    }
                    break;
                }
              },
            ),
          ],
        ),
        onLongPress: () {
          if (feed.unreadCount! > 0) {
            bloc.markFeedAsRead(feed.id);
          }
        },
        onTap: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (final context) => NewsFeedPage(
                bloc: bloc,
                feed: feed,
              ),
            ),
          );
        },
      );
}

enum NewsFeedAction {
  showURL,
  delete,
  rename,
  move,
}
