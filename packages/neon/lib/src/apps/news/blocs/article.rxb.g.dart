// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'article.dart';

/// Used as a contractor for the bloc, events and states classes
/// {@nodoc}
abstract class NewsArticleBlocType extends RxBlocTypeBase {
  NewsArticleBlocEvents get events;
  NewsArticleBlocStates get states;
}

/// [$NewsArticleBloc] extended by the [NewsArticleBloc]
/// {@nodoc}
abstract class $NewsArticleBloc extends RxBlocBase
    implements NewsArticleBlocEvents, NewsArticleBlocStates, NewsArticleBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [markArticleAsRead]
  final _$markArticleAsReadEvent = PublishSubject<void>();

  /// Тhe [Subject] where events sink to by calling [markArticleAsUnread]
  final _$markArticleAsUnreadEvent = PublishSubject<void>();

  /// Тhe [Subject] where events sink to by calling [starArticle]
  final _$starArticleEvent = PublishSubject<void>();

  /// Тhe [Subject] where events sink to by calling [unstarArticle]
  final _$unstarArticleEvent = PublishSubject<void>();

  /// The state of [unread] implemented in [_mapToUnreadState]
  late final BehaviorSubject<bool> _unreadState = _mapToUnreadState();

  /// The state of [starred] implemented in [_mapToStarredState]
  late final BehaviorSubject<bool> _starredState = _mapToStarredState();

  /// The state of [errors] implemented in [_mapToErrorsState]
  late final Stream<Exception> _errorsState = _mapToErrorsState();

  @override
  void markArticleAsRead() => _$markArticleAsReadEvent.add(null);

  @override
  void markArticleAsUnread() => _$markArticleAsUnreadEvent.add(null);

  @override
  void starArticle() => _$starArticleEvent.add(null);

  @override
  void unstarArticle() => _$unstarArticleEvent.add(null);

  @override
  BehaviorSubject<bool> get unread => _unreadState;

  @override
  BehaviorSubject<bool> get starred => _starredState;

  @override
  Stream<Exception> get errors => _errorsState;

  BehaviorSubject<bool> _mapToUnreadState();

  BehaviorSubject<bool> _mapToStarredState();

  Stream<Exception> _mapToErrorsState();

  @override
  NewsArticleBlocEvents get events => this;

  @override
  NewsArticleBlocStates get states => this;

  @override
  void dispose() {
    _$markArticleAsReadEvent.close();
    _$markArticleAsUnreadEvent.close();
    _$starArticleEvent.close();
    _$unstarArticleEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}
