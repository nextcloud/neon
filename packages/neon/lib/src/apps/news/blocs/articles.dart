part of '../app.dart';

enum FilterType {
  all,
  unread,
  starred,
}

enum ListType {
  feed,
  folder,
}

abstract class NewsArticlesBlocEvents {
  void setFilterType(final FilterType type);

  void markArticleAsRead(final NextcloudNewsArticle article);

  void markArticleAsUnread(final NextcloudNewsArticle article);

  void starArticle(final NextcloudNewsArticle article);

  void unstarArticle(final NextcloudNewsArticle article);
}

abstract class NewsArticlesBlocStates {
  BehaviorSubject<Result<List<NextcloudNewsArticle>>> get articles;

  BehaviorSubject<FilterType> get filterType;
}

class NewsMainArticlesBloc extends NewsArticlesBloc {
  NewsMainArticlesBloc(
    super.newsBloc,
    super.options,
    super.requestManager,
    super.client,
  );
}

class NewsArticlesBloc extends InteractiveBloc implements NewsArticlesBlocEvents, NewsArticlesBlocStates {
  NewsArticlesBloc(
    this._newsBloc,
    this.options,
    this.requestManager,
    this.client, {
    this.id,
    this.listType,
  }) {
    filterType.add(options.defaultArticlesFilterOption.value);
    if (listType != null && filterType.value == FilterType.starred) {
      filterType.add(FilterType.all);
    }

    if (this is! NewsMainArticlesBloc) {
      unawaited(refresh());
    }
  }

  final NewsBloc _newsBloc;
  final NewsAppSpecificOptions options;
  final RequestManager requestManager;
  final NextcloudClient client;
  final int? id;
  final ListType? listType;

  @override
  void dispose() {
    unawaited(articles.close());
    unawaited(filterType.close());
    super.dispose();
  }

  @override
  BehaviorSubject<Result<List<NextcloudNewsArticle>>> articles = BehaviorSubject<Result<List<NextcloudNewsArticle>>>();

  @override
  BehaviorSubject<FilterType> filterType = BehaviorSubject<FilterType>();

  @override
  Future refresh() async {
    if (this is! NewsMainArticlesBloc) {
      await reload();
    }
    await _newsBloc.refresh();
  }

  Future reload() async {
    // The API for pagination is pretty useless in this case sadly. So no pagination for us :(
    // https://github.com/nextcloud/news/blob/master/docs/api/api-v1-2.md#get-items

    // https://github.com/nextcloud/news/blob/48ee5ce4d135da20079961a62ae37958d6a6b628/lib/Db/ListType.php#L21
    late final NewsListType type;
    bool? getRead;
    if (listType != null) {
      switch (filterType.value) {
        case FilterType.all:
          break;
        case FilterType.unread:
          getRead = false;
          break;
        default:
          throw Exception('FilterType ${filterType.value} not allowed');
      }
    }
    switch (listType) {
      case ListType.feed:
        type = NewsListType.feed;
        break;
      case ListType.folder:
        type = NewsListType.folder;
        break;
      case null:
        switch (filterType.value) {
          case FilterType.starred:
            type = NewsListType.starred;
            break;
          case FilterType.all:
            type = NewsListType.allItems;
            break;
          case FilterType.unread:
            type = NewsListType.unread;
            break;
        }
        break;
    }

    await requestManager.wrapNextcloud<List<NextcloudNewsArticle>, NextcloudNewsListArticles>(
      client.id,
      'news-articles-${type.code}-$id-$getRead',
      articles,
      () async => client.news.listArticles(
        type: type.code,
        id: id ?? 0,
        getRead: getRead ?? true ? 1 : 0,
      ),
      (final response) => response.items.toList(),
    );
  }

  @override
  void markArticleAsRead(final NextcloudNewsArticle article) {
    wrapAction(() async => client.news.markArticleAsRead(itemId: article.id));
  }

  @override
  void markArticleAsUnread(final NextcloudNewsArticle article) {
    wrapAction(() async => client.news.markArticleAsUnread(itemId: article.id));
  }

  @override
  void setFilterType(final FilterType type) {
    wrapAction(() async => filterType.add(type));
  }

  @override
  void starArticle(final NextcloudNewsArticle article) {
    wrapAction(() async => client.news.starArticle(itemId: article.id));
  }

  @override
  void unstarArticle(final NextcloudNewsArticle article) {
    wrapAction(() async => client.news.unstarArticle(itemId: article.id));
  }
}
