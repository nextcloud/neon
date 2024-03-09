import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_news/src/blocs/articles.dart';
import 'package:neon_news/src/options.dart';
import 'package:nextcloud/news.dart' as news;
import 'package:rxdart/rxdart.dart';

sealed class NewsBloc implements InteractiveBloc {
  @internal
  factory NewsBloc(
    NewsOptions options,
    Account account,
  ) =>
      _NewsBloc(
        options,
        account,
      );

  void addFeed(String url, int? folderId);

  void removeFeed(int feedId);

  void renameFeed(int feedId, String feedTitle);

  void moveFeed(int feedId, int? folderId);

  void markFeedAsRead(int feedId);

  void createFolder(String name);

  void deleteFolder(int folderId);

  void renameFolder(int folderId, String name);

  void markFolderAsRead(int folderId);

  BehaviorSubject<Result<BuiltList<news.Folder>>> get folders;

  BehaviorSubject<Result<BuiltList<news.Feed>>> get feeds;

  BehaviorSubject<int> get unreadCounter;

  NewsOptions get options;

  NewsMainArticlesBloc get mainArticlesBloc;
}

class _NewsBloc extends InteractiveBloc implements NewsBloc, NewsMainArticlesBloc {
  _NewsBloc(
    this.options,
    this.account,
  ) {
    mainArticlesBloc.articles.listen((result) {
      if (result.hasData) {
        final type = mainArticlesBloc.filterType.valueOrNull;
        unreadCounter.add(result.requireData.where((a) => type == FilterType.starred ? a.starred : a.unread).length);
      }
    });

    unawaited(mainArticlesBloc.refresh());
  }

  @override
  final log = Logger('NewsBloc');

  @override
  final NewsOptions options;
  @override
  final Account account;
  @override
  late final mainArticlesBloc = NewsMainArticlesBloc(
    this,
    options,
    account,
  );

  late int newestItemId;
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
  final feeds = BehaviorSubject();

  @override
  final folders = BehaviorSubject();

  @override
  final unreadCounter = BehaviorSubject();

  @override
  late final articles = mainArticlesBloc.articles;

  @override
  late final filterType = mainArticlesBloc.filterType;

  @override
  Future<void> refresh() async {
    await Future.wait([
      RequestManager.instance.wrapNextcloud(
        account: account,
        cacheKey: 'news-folders',
        subject: folders,
        request: account.client.news.$listFolders_Request(),
        serializer: account.client.news.$listFolders_Serializer(),
        unwrap: (response) => response.body.folders,
      ),
      RequestManager.instance.wrapNextcloud(
        account: account,
        cacheKey: 'news-feeds',
        subject: feeds,
        request: account.client.news.$listFeeds_Request(),
        serializer: account.client.news.$listFeeds_Serializer(),
        unwrap: (response) {
          if (response.body.newestItemId != null) {
            newestItemId = response.body.newestItemId!;
          }
          return response.body.feeds;
        },
      ),
      mainArticlesBloc.reload(),
    ]);
  }

  @override
  Future<void> addFeed(String url, int? folderId) async {
    await wrapAction(() async => account.client.news.addFeed(url: url, folderId: folderId));
  }

  @override
  Future<void> createFolder(String name) async {
    await wrapAction(() async => account.client.news.createFolder(name: name));
  }

  @override
  Future<void> deleteFolder(int folderId) async {
    await wrapAction(() async => account.client.news.deleteFolder(folderId: folderId));
  }

  @override
  Future<void> markFeedAsRead(int feedId) async {
    await wrapAction(() async => account.client.news.markFeedAsRead(feedId: feedId, newestItemId: newestItemId));
  }

  @override
  Future<void> markFolderAsRead(int folderId) async {
    await wrapAction(() async => account.client.news.markFolderAsRead(folderId: folderId, newestItemId: newestItemId));
  }

  @override
  Future<void> moveFeed(int feedId, int? folderId) async {
    await wrapAction(() async => account.client.news.moveFeed(feedId: feedId, folderId: folderId));
  }

  @override
  Future<void> removeFeed(int feedId) async {
    await wrapAction(() async => account.client.news.deleteFeed(feedId: feedId));
  }

  @override
  Future<void> renameFeed(int feedId, String feedTitle) async {
    await wrapAction(() async => account.client.news.renameFeed(feedId: feedId, feedTitle: feedTitle));
  }

  @override
  Future<void> renameFolder(int folderId, String name) async {
    await wrapAction(() async => account.client.news.renameFolder(folderId: folderId, name: name));
  }

  @override
  Future<void> markArticleAsRead(news.Article article) async {
    await mainArticlesBloc.markArticleAsRead(article);
  }

  @override
  Future<void> markArticleAsUnread(news.Article article) async {
    await mainArticlesBloc.markArticleAsUnread(article);
  }

  @override
  Future<void> setFilterType(FilterType type) async {
    await mainArticlesBloc.setFilterType(type);
  }

  @override
  Future<void> starArticle(news.Article article) async {
    await mainArticlesBloc.starArticle(article);
  }

  @override
  Future<void> unstarArticle(news.Article article) async {
    await mainArticlesBloc.unstarArticle(article);
  }

  @override
  Future<void> reload() async {
    await mainArticlesBloc.reload();
  }
}
