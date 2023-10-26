part of '../neon_news.dart';

abstract interface class NewsBlocEvents {
  void addFeed(final String url, final int? folderId);

  void removeFeed(final int feedId);

  void renameFeed(final int feedId, final String feedTitle);

  void moveFeed(final int feedId, final int? folderId);

  void markFeedAsRead(final int feedId);

  void createFolder(final String name);

  void deleteFolder(final int folderId);

  void renameFolder(final int folderId, final String name);

  void markFolderAsRead(final int folderId);
}

abstract interface class NewsBlocStates {
  BehaviorSubject<Result<List<news.Folder>>> get folders;

  BehaviorSubject<Result<List<news.Feed>>> get feeds;

  BehaviorSubject<int> get unreadCounter;
}

class NewsBloc extends InteractiveBloc implements NewsBlocEvents, NewsBlocStates, NewsMainArticlesBloc {
  NewsBloc(
    this.options,
    this.account,
  ) {
    mainArticlesBloc.articles.listen((final result) {
      if (result.hasData) {
        final type = mainArticlesBloc.filterType.valueOrNull;
        unreadCounter
            .add(result.requireData.where((final a) => type == FilterType.starred ? a.starred : a.unread).length);
      }
    });

    unawaited(mainArticlesBloc.refresh());
  }

  @override
  NewsBloc get _newsBloc => this;
  @override
  final NewsClientSpecificOptions options;
  @override
  @override
  final Account account;
  late final mainArticlesBloc = NewsMainArticlesBloc(
    this,
    options,
    account,
  );

  late int _newestItemId;
  @override
  int? id;
  @override
  ListType? listType;

  @override
  void dispose() {
    unawaited(feeds.close());
    unawaited(folders.close());
    unawaited(unreadCounter.close());
    unawaited(articles.close());
    unawaited(filterType.close());
    mainArticlesBloc.dispose();
    super.dispose();
  }

  @override
  BehaviorSubject<Result<List<news.Feed>>> feeds = BehaviorSubject<Result<List<news.Feed>>>();

  @override
  BehaviorSubject<Result<List<news.Folder>>> folders = BehaviorSubject<Result<List<news.Folder>>>();

  @override
  BehaviorSubject<int> unreadCounter = BehaviorSubject<int>();

  @override
  late BehaviorSubject<Result<List<news.Article>>> articles = mainArticlesBloc.articles;

  @override
  late BehaviorSubject<FilterType> filterType = mainArticlesBloc.filterType;

  @override
  Future<void> refresh() async {
    await Future.wait([
      RequestManager.instance.wrapNextcloud<List<news.Folder>, news.ListFolders, void>(
        account.id,
        'news-folders',
        folders,
        account.client.news.listFoldersRaw(),
        (final response) => response.body.folders.toList(),
      ),
      RequestManager.instance.wrapNextcloud<List<news.Feed>, news.ListFeeds, void>(
        account.id,
        'news-feeds',
        feeds,
        account.client.news.listFeedsRaw(),
        (final response) {
          if (response.body.newestItemId != null) {
            _newestItemId = response.body.newestItemId!;
          }
          return response.body.feeds.toList();
        },
      ),
      mainArticlesBloc.reload(),
    ]);
  }

  @override
  void addFeed(final String url, final int? folderId) {
    wrapAction(() async => account.client.news.addFeed(url: url, folderId: folderId));
  }

  @override
  void createFolder(final String name) {
    wrapAction(() async => account.client.news.createFolder(name: name));
  }

  @override
  void deleteFolder(final int folderId) {
    wrapAction(() async => account.client.news.deleteFolder(folderId: folderId));
  }

  @override
  void markFeedAsRead(final int feedId) {
    wrapAction(() async => account.client.news.markFeedAsRead(feedId: feedId, newestItemId: _newestItemId));
  }

  @override
  void markFolderAsRead(final int folderId) {
    wrapAction(() async => account.client.news.markFolderAsRead(folderId: folderId, newestItemId: _newestItemId));
  }

  @override
  void moveFeed(final int feedId, final int? folderId) {
    wrapAction(() async => account.client.news.moveFeed(feedId: feedId, folderId: folderId));
  }

  @override
  void removeFeed(final int feedId) {
    wrapAction(() async => account.client.news.deleteFeed(feedId: feedId));
  }

  @override
  void renameFeed(final int feedId, final String feedTitle) {
    wrapAction(() async => account.client.news.renameFeed(feedId: feedId, feedTitle: feedTitle));
  }

  @override
  void renameFolder(final int folderId, final String name) {
    wrapAction(() async => account.client.news.renameFolder(folderId: folderId, name: name));
  }

  @override
  void markArticleAsRead(final news.Article article) {
    mainArticlesBloc.markArticleAsRead(article);
  }

  @override
  void markArticleAsUnread(final news.Article article) {
    mainArticlesBloc.markArticleAsUnread(article);
  }

  @override
  void setFilterType(final FilterType type) {
    mainArticlesBloc.setFilterType(type);
  }

  @override
  void starArticle(final news.Article article) {
    mainArticlesBloc.starArticle(article);
  }

  @override
  void unstarArticle(final news.Article article) {
    mainArticlesBloc.unstarArticle(article);
  }

  @override
  Future<void> reload() async {
    await mainArticlesBloc.reload();
  }
}
