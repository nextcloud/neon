part of '../neon_news.dart';

enum FilterType {
  all,
  unread,
  starred,
}

enum ListType {
  feed,
  folder,
}

abstract interface class NewsArticlesBlocEvents {
  void setFilterType(final FilterType type);

  void markArticleAsRead(final news.Article article);

  void markArticleAsUnread(final news.Article article);

  void starArticle(final news.Article article);

  void unstarArticle(final news.Article article);
}

abstract interface class NewsArticlesBlocStates {
  BehaviorSubject<Result<List<news.Article>>> get articles;

  BehaviorSubject<FilterType> get filterType;
}

class NewsMainArticlesBloc extends NewsArticlesBloc {
  NewsMainArticlesBloc(
    super._newsBloc,
    super.options,
    super.account,
  );
}

class NewsArticlesBloc extends InteractiveBloc implements NewsArticlesBlocEvents, NewsArticlesBlocStates {
  NewsArticlesBloc(
    this._newsBloc,
    this.options,
    this.account, {
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
  final Account account;
  final int? id;
  final ListType? listType;

  @override
  void dispose() {
    unawaited(articles.close());
    unawaited(filterType.close());
    super.dispose();
  }

  @override
  BehaviorSubject<Result<List<news.Article>>> articles = BehaviorSubject<Result<List<news.Article>>>();

  @override
  BehaviorSubject<FilterType> filterType = BehaviorSubject<FilterType>();

  @override
  Future<void> refresh() async {
    if (this is! NewsMainArticlesBloc) {
      await reload();
    }
    await _newsBloc.refresh();
  }

  Future<void> reload() async {
    // The API for pagination is pretty useless in this case sadly. So no pagination for us :(
    // https://github.com/nextcloud/news/blob/master/docs/api/api-v1-2.md#get-items

    // https://github.com/nextcloud/news/blob/48ee5ce4d135da20079961a62ae37958d6a6b628/lib/Db/ListType.php#L21
    late final news.ListType type;
    bool? getRead;
    if (listType != null) {
      switch (filterType.value) {
        case FilterType.all:
          break;
        case FilterType.unread:
          getRead = false;
        default:
          throw Exception('FilterType ${filterType.value} not allowed');
      }
    }
    switch (listType) {
      case ListType.feed:
        type = news.ListType.feed;
      case ListType.folder:
        type = news.ListType.folder;
      case null:
        switch (filterType.value) {
          case FilterType.starred:
            type = news.ListType.starred;
          case FilterType.all:
            type = news.ListType.allItems;
          case FilterType.unread:
            type = news.ListType.unread;
        }
    }

    await RequestManager.instance.wrapNextcloud<List<news.Article>, news.ListArticles, void>(
      account.id,
      'news-articles-${type.index}-$id-$getRead',
      articles,
      account.client.news.listArticlesRaw(
        type: type.index,
        id: id ?? 0,
        getRead: getRead ?? true ? 1 : 0,
      ),
      (final response) => response.body.items.toList(),
    );
  }

  @override
  void markArticleAsRead(final news.Article article) {
    wrapAction(() async => account.client.news.markArticleAsRead(itemId: article.id));
  }

  @override
  void markArticleAsUnread(final news.Article article) {
    wrapAction(() async => account.client.news.markArticleAsUnread(itemId: article.id));
  }

  @override
  void setFilterType(final FilterType type) {
    wrapAction(() async => filterType.add(type));
  }

  @override
  void starArticle(final news.Article article) {
    wrapAction(() async => account.client.news.starArticle(itemId: article.id));
  }

  @override
  void unstarArticle(final news.Article article) {
    wrapAction(() async => account.client.news.unstarArticle(itemId: article.id));
  }
}
