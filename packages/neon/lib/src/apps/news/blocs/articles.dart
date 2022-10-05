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
        await client.news.markArticleAsRead(itemId: article.id!);
        // TODO
        //_articleUpdateController.add(article..unread = false);
      });
    });

    _$markArticleAsUnreadEvent.listen((final article) {
      _wrapArticleAction((final client) async {
        await client.news.markArticleAsUnread(itemId: article.id!);
        // TODO
        //_articleUpdateController.add(article..unread = true);
      });
    });

    _$starArticleEvent.listen((final article) {
      _wrapArticleAction((final client) async {
        await client.news.starArticle(
          itemId: article.id!,
        );
        // TODO
        //_articleUpdateController.add(article..starred = true);
      });
    });

    _$unstarArticleEvent.listen((final article) {
      _wrapArticleAction((final client) async {
        await client.news.unstarArticle(
          itemId: article.id!,
        );
        // TODO
        //_articleUpdateController.add(article..starred = false);
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
    late final NewsListType type;
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
        type = NewsListType.feed;
        break;
      case ListType.folder:
        type = NewsListType.folder;
        break;
      case null:
        switch (_filterTypeSubject.value) {
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

    newsBloc.requestManager
        .wrapNextcloud<List<NewsArticle>, NewsListArticles>(
          newsBloc.client.id,
          'news-articles-${type.code}-$id-$getRead',
          () async => newsBloc.client.news.listArticles(
            type: type.code,
            id: id ?? 0,
            getRead: getRead ?? true ? 1 : 0,
          ),
          (final response) => response.items!,
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
    unawaited(_articlesSubject.close());
    unawaited(_filterTypeSubject.close());
    unawaited(_articleUpdateController.close());
    unawaited(_errorsStreamController.close());
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
