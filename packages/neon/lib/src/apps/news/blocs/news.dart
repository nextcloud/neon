import 'dart:async';

import 'package:neon/src/apps/news/app.dart';
import 'package:neon/src/apps/news/blocs/articles.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/neon.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'news.rxb.g.dart';

abstract class NewsBlocEvents {
  void refresh({required final bool mainArticlesToo});

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

  Stream<Exception> get errors;

  BehaviorSubject<int> get unreadCounter;
}

@RxBloc()
class NewsBloc extends $NewsBloc {
  NewsBloc(
    this.options,
    this.requestManager,
    this.client,
  ) {
    _$refreshEvent.listen(_loadAll);

    _$addFeedEvent.listen((final event) {
      _wrapFeedAction(
        (final client) async => client.news.addFeed(
          url: event.url,
          folderId: event.folderId,
        ),
      );
    });

    _$removeFeedEvent.listen((final feedId) {
      _wrapFeedAction((final client) async => client.news.deleteFeed(feedId: feedId));
    });

    _$renameFeedEvent.listen((final event) {
      _wrapFeedAction(
        (final client) async => client.news.renameFeed(
          feedId: event.feedId,
          feedTitle: event.feedTitle,
        ),
      );
    });

    _$moveFeedEvent.listen((final event) {
      final stream = requestManager
          .wrapWithoutCache(
            () async => client.news.moveFeed(
              feedId: event.feedId,
              folderId: event.folderId,
            ),
          )
          .asBroadcastStream();
      stream.whereError().listen(_errorsStreamController.add);
      stream.whereSuccess().listen((final _) {
        _loadFeeds();
        _loadFolders();
      });
    });

    _$markFeedAsReadEvent.listen((final feedId) {
      final stream = requestManager
          .wrapWithoutCache(
            () async => client.news.markFeedAsRead(
              feedId: feedId,
              newestItemId: _newestItemId,
            ),
          )
          .asBroadcastStream();
      stream.whereError().listen(_errorsStreamController.add);
      stream.whereSuccess().listen((final _) {
        _loadAll(true);
      });
    });

    _$createFolderEvent.listen((final name) {
      _wrapFolderAction((final client) async => client.news.createFolder(name: name));
    });

    _$deleteFolderEvent.listen((final folderId) {
      _wrapFolderAction((final client) async => client.news.deleteFolder(folderId: folderId));
    });

    _$renameFolderEvent.listen((final event) {
      _wrapFolderAction(
        (final client) async => client.news.renameFolder(
          folderId: event.folderId,
          name: event.name,
        ),
      );
    });

    _$markFolderAsReadEvent.listen((final folderId) {
      final stream = requestManager
          .wrapWithoutCache(
            () async => client.news.markFolderAsRead(
              folderId: folderId,
              newestItemId: _newestItemId,
            ),
          )
          .asBroadcastStream();
      stream.whereError().listen(_errorsStreamController.add);
      stream.whereSuccess().listen((final _) {
        _loadAll(true);
      });
    });

    mainArticlesBloc.articles.listen((final result) {
      if (result.data != null) {
        final type = mainArticlesBloc.filterType.valueOrNull;
        _unreadCounterSubject
            .add(result.data!.where((final a) => type == FilterType.starred ? a.starred : a.unread).length);
      }
    });

    _loadAll(false);
  }

  void _wrapFolderAction(final Future Function(NextcloudClient client) call) {
    final stream = requestManager
        .wrapWithoutCache(
          () async => call(client),
        )
        .asBroadcastStream();
    stream.whereError().listen(_errorsStreamController.add);
    stream.whereSuccess().listen((final _) {
      _loadFolders();
    });
  }

  void _wrapFeedAction(final Future Function(NextcloudClient client) call) {
    final stream = requestManager
        .wrapWithoutCache(
          () async => call(client),
        )
        .asBroadcastStream();
    stream.whereError().listen(_errorsStreamController.add);
    stream.whereSuccess().listen((final _) {
      _loadFeeds();
      mainArticlesBloc.loadArticles();
    });
  }

  void _loadAll(final bool mainArticlesToo) {
    if (mainArticlesToo) {
      mainArticlesBloc.loadArticles();
    }
    _loadFolders();
    _loadFeeds();
  }

  void _loadFolders() {
    requestManager
        .wrapNextcloud<List<NewsFolder>, NewsListFolders>(
          client.id,
          'news-folders',
          () async => client.news.listFolders(),
          (final response) => response.folders,
          previousData: _foldersSubject.valueOrNull?.data,
        )
        .listen(_foldersSubject.add);
  }

  void _loadFeeds() {
    requestManager.wrapNextcloud<List<NewsFeed>, NewsListFeeds>(
      client.id,
      'news-feeds',
      () async => client.news.listFeeds(),
      (final response) {
        // This is a bit ugly, but IDGAF right now
        if (response.newestItemId != null) {
          _newestItemId = response.newestItemId!;
        }
        return response.feeds;
      },
      previousData: _feedsSubject.valueOrNull?.data,
    ).listen(_feedsSubject.add);
  }

  final NewsAppSpecificOptions options;
  final RequestManager requestManager;
  final NextcloudClient client;
  late final mainArticlesBloc = NewsArticlesBloc(
    this,
    isMainArticlesBloc: true,
  );

  late int _newestItemId;

  final _foldersSubject = BehaviorSubject<Result<List<NewsFolder>>>();
  final _feedsSubject = BehaviorSubject<Result<List<NewsFeed>>>();
  final _errorsStreamController = StreamController<Exception>();
  final _unreadCounterSubject = BehaviorSubject<int>();

  @override
  void dispose() {
    unawaited(_foldersSubject.close());
    unawaited(_feedsSubject.close());
    unawaited(_errorsStreamController.close());
    unawaited(_unreadCounterSubject.close());
    super.dispose();
  }

  @override
  BehaviorSubject<Result<List<NewsFeed>>> _mapToFeedsState() => _feedsSubject;

  @override
  BehaviorSubject<Result<List<NewsFolder>>> _mapToFoldersState() => _foldersSubject;

  @override
  Stream<Exception> _mapToErrorsState() => _errorsStreamController.stream.asBroadcastStream();

  @override
  BehaviorSubject<int> _mapToUnreadCounterState() => _unreadCounterSubject;
}
