part of '../neon_news.dart';

abstract class NewsArticleBlocEvents {
  void markArticleAsRead();

  void markArticleAsUnread();

  void starArticle();

  void unstarArticle();
}

abstract class NewsArticleBlocStates {
  BehaviorSubject<bool> get unread;

  BehaviorSubject<bool> get starred;
}

class NewsArticleBloc extends InteractiveBloc implements NewsArticleBlocEvents, NewsArticleBlocStates {
  NewsArticleBloc(
    this._client,
    this._newsArticlesBloc,
    final NewsArticle article,
  ) {
    _id = article.id;
    unread.add(article.unread);
    starred.add(article.starred);
  }

  final NextcloudClient _client;
  final NewsArticlesBloc _newsArticlesBloc;

  late final int _id;

  @override
  void dispose() {
    unawaited(starred.close());
    unawaited(unread.close());
    super.dispose();
  }

  @override
  BehaviorSubject<bool> starred = BehaviorSubject<bool>();

  @override
  BehaviorSubject<bool> unread = BehaviorSubject<bool>();

  @override
  Future refresh() async {}

  @override
  void markArticleAsRead() {
    _wrapArticleAction(() async {
      await _client.news.markArticleAsRead(itemId: _id);
      unread.add(false);
    });
  }

  @override
  void markArticleAsUnread() {
    _wrapArticleAction(() async {
      await _client.news.markArticleAsUnread(itemId: _id);
      unread.add(true);
    });
  }

  @override
  void starArticle() {
    _wrapArticleAction(() async {
      await _client.news.starArticle(itemId: _id);
      starred.add(true);
    });
  }

  @override
  void unstarArticle() {
    _wrapArticleAction(() async {
      await _client.news.unstarArticle(itemId: _id);
      starred.add(false);
    });
  }

  void _wrapArticleAction(final Future Function() call) => wrapAction(
        call,
        refresh: () async {
          await _newsArticlesBloc.refresh();
        },
      );
}
