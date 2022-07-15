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

  void addFeed(final String url, final int? folderID);

  void removeFeed(final int feedID);

  void renameFeed(final int feedID, final String name);

  void moveFeed(final int feedID, final int? folderID);

  void markFeedAsRead(final int feedID);

  void createFolder(final String name);

  void deleteFolder(final int folderID);

  void renameFolder(final int folderID, final String name);

  void markFolderAsRead(final int folderID);
}

abstract class NewsBlocStates {
  BehaviorSubject<Result<List<NewsFolder>>> get folders;

  BehaviorSubject<Result<List<NewsFeed>>> get feeds;

  Stream<Exception> get errors;
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
          NewsAddFeed(
            url: event.url,
            folderId: event.folderID,
          ),
        ),
      );
    });

    _$removeFeedEvent.listen((final feedID) {
      _wrapFeedAction((final client) async => client.news.deleteFeed(feedID));
    });

    _$renameFeedEvent.listen((final event) {
      _wrapFeedAction(
        (final client) async => client.news.renameFeed(
          event.feedID,
          NewsRenameFeed(
            feedTitle: event.name,
          ),
        ),
      );
    });

    _$moveFeedEvent.listen((final event) {
      final stream = requestManager
          .wrapWithoutCache(
            () async => client.news.moveFeed(
              event.feedID,
              NewsMoveFeed(
                folderId: event.folderID,
              ),
            ),
          )
          .asBroadcastStream();
      stream.whereError().listen(_errorsStreamController.add);
      stream.whereSuccess().listen((final _) {
        _loadFeeds();
        _loadFolders();
      });
    });

    _$markFeedAsReadEvent.listen((final feedID) {
      final stream = requestManager
          .wrapWithoutCache(
            () async => client.news.markFeedAsRead(
              feedID,
              NewsMarkAsRead(
                newestItemId: _newestItemId,
              ),
            ),
          )
          .asBroadcastStream();
      stream.whereError().listen(_errorsStreamController.add);
      stream.whereSuccess().listen((final _) {
        _loadAll(true);
      });
    });

    _$createFolderEvent.listen((final name) {
      _wrapFolderAction((final client) async => client.news.createFolder(NewsCreateFolder(name: name)));
    });

    _$deleteFolderEvent.listen((final folderID) {
      _wrapFolderAction((final client) async => client.news.deleteFolder(folderID));
    });

    _$renameFolderEvent.listen((final event) {
      _wrapFolderAction(
        (final client) async => client.news.renameFolder(
          event.folderID,
          NewsRenameFolder(
            name: event.name,
          ),
        ),
      );
    });

    _$markFolderAsReadEvent.listen((final folderID) {
      final stream = requestManager
          .wrapWithoutCache(
            () async => client.news.markFolderAsRead(
              folderID,
              NewsMarkAsRead(
                newestItemId: _newestItemId,
              ),
            ),
          )
          .asBroadcastStream();
      stream.whereError().listen(_errorsStreamController.add);
      stream.whereSuccess().listen((final _) {
        _loadAll(true);
      });
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
        .wrapNextcloud<List<NewsFolder>, NewsListFolders, void, NextcloudNewsClient>(
          client.id,
          client.news,
          'news-folders',
          () async => (await client.news.listFolders())!,
          (final response) => response.folders,
          previousData: _foldersSubject.valueOrNull?.data,
        )
        .listen(_foldersSubject.add);
  }

  void _loadFeeds() {
    requestManager.wrapNextcloud<List<NewsFeed>, NewsListFeeds, void, NextcloudNewsClient>(
      client.id,
      client.news,
      'news-feeds',
      () async => (await client.news.listFeeds())!,
      (final response) {
        // This is a bit ugly, but IDGAF right now
        _newestItemId = response.newestItemId;
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

  int? _newestItemId;

  final _foldersSubject = BehaviorSubject<Result<List<NewsFolder>>>();
  final _feedsSubject = BehaviorSubject<Result<List<NewsFeed>>>();
  final _errorsStreamController = StreamController<Exception>();

  @override
  void dispose() {
    // ignore: discarded_futures
    _foldersSubject.close();
    // ignore: discarded_futures
    _feedsSubject.close();
    // ignore: discarded_futures
    _errorsStreamController.close();
    super.dispose();
  }

  @override
  BehaviorSubject<Result<List<NewsFeed>>> _mapToFeedsState() => _feedsSubject;

  @override
  BehaviorSubject<Result<List<NewsFolder>>> _mapToFoldersState() => _foldersSubject;

  @override
  Stream<Exception> _mapToErrorsState() => _errorsStreamController.stream.asBroadcastStream();
}
