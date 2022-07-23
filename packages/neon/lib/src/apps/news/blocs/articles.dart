import 'dart:async';

import 'package:neon/src/apps/news/blocs/news.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/neon.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'articles.rxb.g.dart';

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
  void refresh();

  void setFilterType(final FilterType type);

  void markArticleAsRead(final NewsArticle article);

  void markArticleAsUnread(final NewsArticle article);

  void starArticle(final NewsArticle article);

  void unstarArticle(final NewsArticle article);
}

abstract class NewsArticlesBlocStates {
  BehaviorSubject<Result<List<NewsArticle>>> get articles;

  BehaviorSubject<FilterType> get filterType;

  Stream<NewsArticle> get articleUpdate;

  Stream<Exception> get errors;
}

@RxBloc()
class NewsArticlesBloc extends $NewsArticlesBloc {
  NewsArticlesBloc(
    this.newsBloc, {
    required this.isMainArticlesBloc,
    this.id,
    this.listType,
  }) {
    var filterType = newsBloc.options.defaultArticlesFilterOption.value;
    if (listType != null && filterType == FilterType.starred) {
      filterType = FilterType.all;
    }
    _filterTypeSubject = BehaviorSubject<FilterType>.seeded(filterType);

    _$refreshEvent.listen((final _) {
      loadArticles();
      refreshNewsBloc();
    });

    _$setFilterTypeEvent.listen((final filterType) {
      _filterTypeSubject.add(filterType);
      loadArticles();
    });

    _$markArticleAsReadEvent.listen((final article) {
      _wrapArticleAction((final client) async {
        await client.news.markArticleAsRead(article.id!);
        _articleUpdateController.add(article..unread = false);
      });
    });

    _$markArticleAsUnreadEvent.listen((final article) {
      _wrapArticleAction((final client) async {
        await client.news.markArticleAsUnread(article.id!);
        _articleUpdateController.add(article..unread = true);
      });
    });

    _$starArticleEvent.listen((final article) {
      _wrapArticleAction((final client) async {
        await client.news.starArticle(article.feedId!, article.guidHash!);
        _articleUpdateController.add(article..starred = true);
      });
    });

    _$unstarArticleEvent.listen((final article) {
      _wrapArticleAction((final client) async {
        await client.news.unstarArticle(article.feedId!, article.guidHash!);
        _articleUpdateController.add(article..starred = false);
      });
    });

    loadArticles();
  }

  void _wrapArticleAction(final Future Function(NextcloudClient client) call) {
    final stream = newsBloc.requestManager.wrapWithoutCache(() async => call(newsBloc.client)).asBroadcastStream();
    stream.whereError().listen(_errorsStreamController.add);
    stream.whereSuccess().listen((final _) async {
      loadArticles();
      refreshNewsBloc();
    });
  }

  void loadArticles() {
    // The API for pagination is pretty useless in this case sadly. So no pagination for us :(
    // https://github.com/nextcloud/news/blob/master/docs/api/api-v1-2.md#get-items

    // https://github.com/nextcloud/news/blob/48ee5ce4d135da20079961a62ae37958d6a6b628/lib/Db/ListType.php#L21
    late final int type;
    bool? getRead;
    if (listType != null) {
      switch (_filterTypeSubject.value) {
        case FilterType.all:
          break;
        case FilterType.unread:
          getRead = false;
          break;
        default:
          throw Exception('FilterType ${_filterTypeSubject.value} not allowed');
      }
    }
    switch (listType) {
      case ListType.feed:
        type = 0;
        break;
      case ListType.folder:
        type = 1;
        break;
      case null:
        switch (_filterTypeSubject.value) {
          case FilterType.starred:
            type = 2;
            break;
          case FilterType.all:
            type = 3;
            break;
          case FilterType.unread:
            type = 6;
            break;
        }
        break;
    }

    newsBloc.requestManager
        .wrapNextcloud<List<NewsArticle>, NewsListArticles, void, NextcloudNewsClient>(
          newsBloc.client.id,
          newsBloc.client.news,
          'news-articles-$type-$id-$getRead',
          () async => (await newsBloc.client.news.listArticles(
            type: type,
            id: id,
            getRead: getRead,
          ))!,
          (final response) => response.items,
          previousData: _articlesSubject.valueOrNull?.data,
        )
        .listen(_articlesSubject.add);
  }

  void refreshNewsBloc() {
    newsBloc.refresh(
      mainArticlesToo: !isMainArticlesBloc,
    );
  }

  final NewsBloc newsBloc;
  final bool isMainArticlesBloc;
  final int? id;
  final ListType? listType;

  final _articlesSubject = BehaviorSubject<Result<List<NewsArticle>>>();
  late final BehaviorSubject<FilterType> _filterTypeSubject;
  final _articleUpdateController = StreamController<NewsArticle>();
  final _errorsStreamController = StreamController<Exception>();

  @override
  void dispose() {
    // ignore: discarded_futures
    _articlesSubject.close();
    // ignore: discarded_futures
    _filterTypeSubject.close();
    // ignore: discarded_futures
    _articleUpdateController.close();
    // ignore: discarded_futures
    _errorsStreamController.close();
    super.dispose();
  }

  @override
  BehaviorSubject<Result<List<NewsArticle>>> _mapToArticlesState() => _articlesSubject;

  @override
  BehaviorSubject<FilterType> _mapToFilterTypeState() => _filterTypeSubject;

  @override
  Stream<NewsArticle> _mapToArticleUpdateState() => _articleUpdateController.stream.asBroadcastStream();

  @override
  Stream<Exception> _mapToErrorsState() => _errorsStreamController.stream.asBroadcastStream();
}
