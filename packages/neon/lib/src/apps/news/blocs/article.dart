import 'dart:async';

import 'package:neon/src/apps/news/blocs/articles.dart';
import 'package:neon/src/neon.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'article.rxb.g.dart';

abstract class NewsArticleBlocEvents {
  void markArticleAsRead();

  void markArticleAsUnread();

  void starArticle();

  void unstarArticle();
}

abstract class NewsArticleBlocStates {
  BehaviorSubject<bool> get unread;

  BehaviorSubject<bool> get starred;

  Stream<Exception> get errors;
}

@RxBloc()
class NewsArticleBloc extends $NewsArticleBloc {
  NewsArticleBloc(
    this._requestManager,
    this._client,
    this._newsArticlesBloc,
    final NewsArticle article,
  ) {
    _$markArticleAsReadEvent.listen((final _) {
      _wrapArticleAction(() async {
        await _client.news.markArticleAsRead(itemId: article.id);
        _unreadSubject.add(false);
      });
    });

    _$markArticleAsUnreadEvent.listen((final _) {
      _wrapArticleAction(() async {
        await _client.news.markArticleAsUnread(itemId: article.id);
        _unreadSubject.add(true);
      });
    });

    _$starArticleEvent.listen((final _) {
      _wrapArticleAction(() async {
        await _client.news.starArticle(itemId: article.id);
        _starredSubject.add(true);
      });
    });

    _$unstarArticleEvent.listen((final _) {
      _wrapArticleAction(() async {
        await _client.news.unstarArticle(itemId: article.id);
        _starredSubject.add(false);
      });
    });

    _unreadSubject.add(article.unread);
    _starredSubject.add(article.starred);
    url = article.url;
  }

  void _wrapArticleAction(final Future Function() call) {
    final stream = _requestManager.wrapWithoutCache(() async => call()).asBroadcastStream();
    stream.whereError().listen(_errorsStreamController.add);
    stream.whereSuccess().listen((final _) async {
      _newsArticlesBloc.refresh();
    });
  }

  final RequestManager _requestManager;
  final NextcloudClient _client;
  final NewsArticlesBloc _newsArticlesBloc;

  late final String url;
  final _unreadSubject = BehaviorSubject<bool>();
  final _starredSubject = BehaviorSubject<bool>();
  final _errorsStreamController = StreamController<Exception>();

  @override
  void dispose() {
    unawaited(_unreadSubject.close());
    unawaited(_starredSubject.close());
    unawaited(_errorsStreamController.close());
    super.dispose();
  }

  @override
  BehaviorSubject<bool> _mapToUnreadState() => _unreadSubject;

  @override
  BehaviorSubject<bool> _mapToStarredState() => _starredSubject;

  @override
  Stream<Exception> _mapToErrorsState() => _errorsStreamController.stream.asBroadcastStream();
}
