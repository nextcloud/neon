// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'news.dart';

/// Used as a contractor for the bloc, events and states classes
/// {@nodoc}
abstract class NewsBlocType extends RxBlocTypeBase {
  NewsBlocEvents get events;
  NewsBlocStates get states;
}

/// [$NewsBloc] extended by the [NewsBloc]
/// {@nodoc}
abstract class $NewsBloc extends RxBlocBase implements NewsBlocEvents, NewsBlocStates, NewsBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [refresh]
  final _$refreshEvent = PublishSubject<bool>();

  /// Тhe [Subject] where events sink to by calling [addFeed]
  final _$addFeedEvent = PublishSubject<_AddFeedEventArgs>();

  /// Тhe [Subject] where events sink to by calling [removeFeed]
  final _$removeFeedEvent = PublishSubject<int>();

  /// Тhe [Subject] where events sink to by calling [renameFeed]
  final _$renameFeedEvent = PublishSubject<_RenameFeedEventArgs>();

  /// Тhe [Subject] where events sink to by calling [moveFeed]
  final _$moveFeedEvent = PublishSubject<_MoveFeedEventArgs>();

  /// Тhe [Subject] where events sink to by calling [markFeedAsRead]
  final _$markFeedAsReadEvent = PublishSubject<int>();

  /// Тhe [Subject] where events sink to by calling [createFolder]
  final _$createFolderEvent = PublishSubject<String>();

  /// Тhe [Subject] where events sink to by calling [deleteFolder]
  final _$deleteFolderEvent = PublishSubject<int>();

  /// Тhe [Subject] where events sink to by calling [renameFolder]
  final _$renameFolderEvent = PublishSubject<_RenameFolderEventArgs>();

  /// Тhe [Subject] where events sink to by calling [markFolderAsRead]
  final _$markFolderAsReadEvent = PublishSubject<int>();

  /// The state of [folders] implemented in [_mapToFoldersState]
  late final BehaviorSubject<Result<List<NewsFolder>>> _foldersState = _mapToFoldersState();

  /// The state of [feeds] implemented in [_mapToFeedsState]
  late final BehaviorSubject<Result<List<NewsFeed>>> _feedsState = _mapToFeedsState();

  /// The state of [errors] implemented in [_mapToErrorsState]
  late final Stream<Exception> _errorsState = _mapToErrorsState();

  @override
  void refresh({required bool mainArticlesToo}) => _$refreshEvent.add(mainArticlesToo);

  @override
  void addFeed(String url, int? folderID) => _$addFeedEvent.add(_AddFeedEventArgs(url, folderID));

  @override
  void removeFeed(int feedID) => _$removeFeedEvent.add(feedID);

  @override
  void renameFeed(int feedID, String name) => _$renameFeedEvent.add(_RenameFeedEventArgs(feedID, name));

  @override
  void moveFeed(int feedID, int? folderID) => _$moveFeedEvent.add(_MoveFeedEventArgs(feedID, folderID));

  @override
  void markFeedAsRead(int feedID) => _$markFeedAsReadEvent.add(feedID);

  @override
  void createFolder(String name) => _$createFolderEvent.add(name);

  @override
  void deleteFolder(int folderID) => _$deleteFolderEvent.add(folderID);

  @override
  void renameFolder(int folderID, String name) => _$renameFolderEvent.add(_RenameFolderEventArgs(folderID, name));

  @override
  void markFolderAsRead(int folderID) => _$markFolderAsReadEvent.add(folderID);

  @override
  BehaviorSubject<Result<List<NewsFolder>>> get folders => _foldersState;

  @override
  BehaviorSubject<Result<List<NewsFeed>>> get feeds => _feedsState;

  @override
  Stream<Exception> get errors => _errorsState;

  BehaviorSubject<Result<List<NewsFolder>>> _mapToFoldersState();

  BehaviorSubject<Result<List<NewsFeed>>> _mapToFeedsState();

  Stream<Exception> _mapToErrorsState();

  @override
  NewsBlocEvents get events => this;

  @override
  NewsBlocStates get states => this;

  @override
  void dispose() {
    _$refreshEvent.close();
    _$addFeedEvent.close();
    _$removeFeedEvent.close();
    _$renameFeedEvent.close();
    _$moveFeedEvent.close();
    _$markFeedAsReadEvent.close();
    _$createFolderEvent.close();
    _$deleteFolderEvent.close();
    _$renameFolderEvent.close();
    _$markFolderAsReadEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}

/// Helps providing the arguments in the [Subject.add] for
/// [NewsBlocEvents.addFeed] event
class _AddFeedEventArgs {
  const _AddFeedEventArgs(this.url, this.folderID);

  final String url;

  final int? folderID;
}

/// Helps providing the arguments in the [Subject.add] for
/// [NewsBlocEvents.renameFeed] event
class _RenameFeedEventArgs {
  const _RenameFeedEventArgs(this.feedID, this.name);

  final int feedID;

  final String name;
}

/// Helps providing the arguments in the [Subject.add] for
/// [NewsBlocEvents.moveFeed] event
class _MoveFeedEventArgs {
  const _MoveFeedEventArgs(this.feedID, this.folderID);

  final int feedID;

  final int? folderID;
}

/// Helps providing the arguments in the [Subject.add] for
/// [NewsBlocEvents.renameFolder] event
class _RenameFolderEventArgs {
  const _RenameFolderEventArgs(this.folderID, this.name);

  final int folderID;

  final String name;
}
