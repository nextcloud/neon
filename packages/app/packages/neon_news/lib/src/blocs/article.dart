import 'dart:async';

import 'package:logging/logging.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_news/src/blocs/articles.dart';
import 'package:nextcloud/news.dart' as news;
import 'package:rxdart/rxdart.dart';

sealed class NewsArticleBloc implements InteractiveBloc {
  factory NewsArticleBloc({
    required NewsArticlesBloc articlesBloc,
    required Account account,
    required news.Article article,
  }) = _NewsArticleBloc;

  void markArticleAsRead();

  void markArticleAsUnread();

  void starArticle();

  void unstarArticle();

  BehaviorSubject<bool> get unread;

  BehaviorSubject<bool> get starred;
}

class _NewsArticleBloc extends InteractiveBloc implements NewsArticleBloc {
  _NewsArticleBloc({
    required this.articlesBloc,
    required this.account,
    required news.Article article,
  }) {
    id = article.id;
    unread.add(article.unread);
    starred.add(article.starred);
  }

  @override
  final log = Logger('NewsArticleBloc');

  final NewsArticlesBloc articlesBloc;
  final Account account;

  late final int id;

  @override
  void dispose() {
    unawaited(starred.close());
    unawaited(unread.close());
    super.dispose();
  }

  @override
  final starred = BehaviorSubject();

  @override
  final unread = BehaviorSubject();

  @override
  Future<void> refresh() async {
    await articlesBloc.refresh();
  }

  @override
  Future<void> markArticleAsRead() async {
    await wrapAction(() async {
      await account.client.news.items.markArticleAsRead(itemId: id);
      unread.add(false);
    });
  }

  @override
  Future<void> markArticleAsUnread() async {
    await wrapAction(() async {
      await account.client.news.items.markArticleAsUnread(itemId: id);
      unread.add(true);
    });
  }

  @override
  Future<void> starArticle() async {
    await wrapAction(() async {
      await account.client.news.items.starArticle(itemId: id);
      starred.add(true);
    });
  }

  @override
  Future<void> unstarArticle() async {
    await wrapAction(() async {
      await account.client.news.items.unstarArticle(itemId: id);
      starred.add(false);
    });
  }
}
