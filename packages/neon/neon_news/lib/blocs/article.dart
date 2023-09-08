part of '../neon_news.dart';

abstract interface class NewsArticleBlocEvents {
  void markArticleAsRead();

  void markArticleAsUnread();

  void starArticle();

  void unstarArticle();
}

abstract interface class NewsArticleBlocStates {
  BehaviorSubject<bool> get unread;

  BehaviorSubject<bool> get starred;
}

class NewsArticleBloc extends InteractiveBloc implements NewsArticleBlocEvents, NewsArticleBlocStates {
  NewsArticleBloc(
    this._newsArticlesBloc,
    final NewsArticle article,
  ) {
    _id = article.id;
    unread.add(article.unread);
    starred.add(article.starred);
  }

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
  Future<void> refresh() async {}

  @override
  void markArticleAsRead() {
    _wrapArticleAction(() async {
      await _newsArticlesBloc.account.client.news.markArticleAsRead(itemId: _id);
      unread.add(false);
    });
  }

  @override
  void markArticleAsUnread() {
    _wrapArticleAction(() async {
      await _newsArticlesBloc.account.client.news.markArticleAsUnread(itemId: _id);
      unread.add(true);
    });
  }

  @override
  void starArticle() {
    _wrapArticleAction(() async {
      await _newsArticlesBloc.account.client.news.starArticle(itemId: _id);
      starred.add(true);
    });
  }

  @override
  void unstarArticle() {
    _wrapArticleAction(() async {
      await _newsArticlesBloc.account.client.news.unstarArticle(itemId: _id);
      starred.add(false);
    });
  }

  void _wrapArticleAction(final AsyncCallback call) => wrapAction(
        call,
        refresh: () async {
          await _newsArticlesBloc.refresh();
        },
      );
}
