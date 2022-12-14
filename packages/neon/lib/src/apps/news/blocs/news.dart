part of '../app.dart';

abstract class NewsBlocEvents {
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

abstract class NewsBlocStates {
  BehaviorSubject<Result<List<NewsFolder>>> get folders;

  BehaviorSubject<Result<List<NewsFeed>>> get feeds;

  BehaviorSubject<int> get unreadCounter;
}

class NewsBloc extends InteractiveBloc implements NewsBlocEvents, NewsBlocStates, NewsMainArticlesBloc {
  NewsBloc(
    this.options,
    this.requestManager,
    this.client,
  ) {
    mainArticlesBloc.articles.listen((final result) {
      if (result.data != null) {
        final type = mainArticlesBloc.filterType.valueOrNull;
        unreadCounter.add(result.data!.where((final a) => type == FilterType.starred ? a.starred : a.unread).length);
      }
    });

    unawaited(mainArticlesBloc.refresh());
  }

  @override
  NewsBloc get _newsBloc => this;
  @override
  final NewsAppSpecificOptions options;
  @override
  final RequestManager requestManager;
  @override
  final NextcloudClient client;
  late final mainArticlesBloc = NewsMainArticlesBloc(
    this,
    options,
    requestManager,
    client,
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
  BehaviorSubject<Result<List<NewsFeed>>> feeds = BehaviorSubject<Result<List<NewsFeed>>>();

  @override
  BehaviorSubject<Result<List<NewsFolder>>> folders = BehaviorSubject<Result<List<NewsFolder>>>();

  @override
  BehaviorSubject<int> unreadCounter = BehaviorSubject<int>();

  @override
  late BehaviorSubject<Result<List<NewsArticle>>> articles = mainArticlesBloc.articles;

  @override
  late BehaviorSubject<FilterType> filterType = mainArticlesBloc.filterType;

  @override
  Future refresh() async {
    await Future.wait([
      requestManager.wrapNextcloud<List<NewsFolder>, NewsListFolders>(
        client.id,
        'news-folders',
        folders,
        () async => client.news.listFolders(),
        (final response) => response.folders,
      ),
      requestManager.wrapNextcloud<List<NewsFeed>, NewsListFeeds>(
        client.id,
        'news-feeds',
        feeds,
        () async => client.news.listFeeds(),
        (final response) {
          // This is a bit ugly, but IDGAF right now
          if (response.newestItemId != null) {
            _newestItemId = response.newestItemId!;
          }
          return response.feeds;
        },
      ),
      mainArticlesBloc.reload(),
    ]);
  }

  @override
  void addFeed(final String url, final int? folderId) {
    wrapAction(() async => client.news.addFeed(url: url, folderId: folderId));
  }

  @override
  void createFolder(final String name) {
    wrapAction(() async => client.news.createFolder(name: name));
  }

  @override
  void deleteFolder(final int folderId) {
    wrapAction(() async => client.news.deleteFolder(folderId: folderId));
  }

  @override
  void markFeedAsRead(final int feedId) {
    wrapAction(() async => client.news.markFeedAsRead(feedId: feedId, newestItemId: _newestItemId));
  }

  @override
  void markFolderAsRead(final int folderId) {
    wrapAction(() async => client.news.markFolderAsRead(folderId: folderId, newestItemId: _newestItemId));
  }

  @override
  void moveFeed(final int feedId, final int? folderId) {
    wrapAction(() async => client.news.moveFeed(feedId: feedId, folderId: folderId));
  }

  @override
  void removeFeed(final int feedId) {
    wrapAction(() async => client.news.deleteFeed(feedId: feedId));
  }

  @override
  void renameFeed(final int feedId, final String feedTitle) {
    wrapAction(() async => client.news.renameFeed(feedId: feedId, feedTitle: feedTitle));
  }

  @override
  void renameFolder(final int folderId, final String name) {
    wrapAction(() async => client.news.renameFolder(folderId: folderId, name: name));
  }

  @override
  void markArticleAsRead(final NewsArticle article) {
    mainArticlesBloc.markArticleAsRead(article);
  }

  @override
  void markArticleAsUnread(final NewsArticle article) {
    mainArticlesBloc.markArticleAsUnread(article);
  }

  @override
  void setFilterType(final FilterType type) {
    mainArticlesBloc.setFilterType(type);
  }

  @override
  void starArticle(final NewsArticle article) {
    mainArticlesBloc.starArticle(article);
  }

  @override
  void unstarArticle(final NewsArticle article) {
    mainArticlesBloc.unstarArticle(article);
  }

  @override
  Future reload() async {
    await mainArticlesBloc.reload();
  }
}
