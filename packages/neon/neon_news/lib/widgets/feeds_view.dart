part of '../neon_news.dart';

class NewsFeedsView extends StatelessWidget {
  const NewsFeedsView({
    required this.bloc,
    this.folderID,
    super.key,
  });

  final NewsBloc bloc;
  final int? folderID;

  @override
  Widget build(final BuildContext context) => ResultBuilder<List<NextcloudNewsFolder>>.behaviorSubject(
        stream: bloc.folders,
        builder: (final context, final folders) => ResultBuilder<List<NextcloudNewsFeed>>.behaviorSubject(
          stream: bloc.feeds,
          builder: (final context, final feeds) => SortBoxBuilder<FeedsSortProperty, NextcloudNewsFeed>(
            sortBox: feedsSortBox,
            sortPropertyOption: bloc.options.feedsSortPropertyOption,
            sortBoxOrderOption: bloc.options.feedsSortBoxOrderOption,
            input: folders.data == null
                ? null
                : feeds.data?.where((final f) => folderID == null || f.folderId == folderID).toList(),
            builder: (final context, final sorted) => NeonListView<NextcloudNewsFeed>(
              scrollKey: 'news-feeds',
              withFloatingActionButton: true,
              items: sorted,
              isLoading: feeds.isLoading || folders.isLoading,
              error: feeds.error ?? folders.error,
              onRefresh: bloc.refresh,
              builder: (final context, final feed) => _buildFeed(
                context,
                feed,
                folders.data!,
              ),
            ),
          ),
        ),
      );

  Widget _buildFeed(
    final BuildContext context,
    final NextcloudNewsFeed feed,
    final List<NextcloudNewsFolder> folders,
  ) =>
      ListTile(
        title: Text(
          feed.title,
          style: feed.unreadCount! == 0
              ? Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).disabledColor)
              : null,
        ),
        subtitle:
            feed.unreadCount! > 0 ? Text(AppLocalizations.of(context).articlesUnread(feed.unreadCount!)) : Container(),
        leading: NewsFeedIcon(
          feed: feed,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (feed.updateErrorCount > 0) ...[
              IconButton(
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (final context) => NewsFeedUpdateErrorDialog(
                      feed: feed,
                    ),
                  );
                },
                tooltip: AppLocalizations.of(context).feedShowErrorMessage,
                iconSize: 30,
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
                  child: Text(AppLocalizations.of(context).feedShowURL),
                ),
                PopupMenuItem(
                  value: NewsFeedAction.delete,
                  child: Text(AppLocalizations.of(context).actionDelete),
                ),
                PopupMenuItem(
                  value: NewsFeedAction.rename,
                  child: Text(AppLocalizations.of(context).actionRename),
                ),
                if (folders.isNotEmpty) ...[
                  PopupMenuItem(
                    value: NewsFeedAction.move,
                    child: Text(AppLocalizations.of(context).actionMove),
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
                    // ignore: use_build_context_synchronously
                    if (await showConfirmationDialog(
                      context,
                      // ignore: use_build_context_synchronously
                      AppLocalizations.of(context).feedRemoveConfirm(feed.title),
                    )) {
                      bloc.removeFeed(feed.id);
                    }
                    break;
                  case NewsFeedAction.rename:
                    final result = await showRenameDialog(
                      context: context,
                      title: AppLocalizations.of(context).feedRename,
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
