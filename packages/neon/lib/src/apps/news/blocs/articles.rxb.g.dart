// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'articles.dart';

/// Used as a contractor for the bloc, events and states classes
/// {@nodoc}
abstract class NewsArticlesBlocType extends RxBlocTypeBase {
  NewsArticlesBlocEvents get events;
  NewsArticlesBlocStates get states;
}

/// [$NewsArticlesBloc] extended by the [NewsArticlesBloc]
/// {@nodoc}
abstract class $NewsArticlesBloc extends RxBlocBase
    implements NewsArticlesBlocEvents, NewsArticlesBlocStates, NewsArticlesBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [refresh]
  final _$refreshEvent = PublishSubject<void>();

  /// Тhe [Subject] where events sink to by calling [setFilterType]
  final _$setFilterTypeEvent = PublishSubject<FilterType>();

  /// Тhe [Subject] where events sink to by calling [markArticleAsRead]
  final _$markArticleAsReadEvent = PublishSubject<NewsArticle>();

  /// Тhe [Subject] where events sink to by calling [markArticleAsUnread]
  final _$markArticleAsUnreadEvent = PublishSubject<NewsArticle>();

  /// Тhe [Subject] where events sink to by calling [starArticle]
  final _$starArticleEvent = PublishSubject<NewsArticle>();

  /// Тhe [Subject] where events sink to by calling [unstarArticle]
  final _$unstarArticleEvent = PublishSubject<NewsArticle>();

  /// The state of [articles] implemented in [_mapToArticlesState]
  late final BehaviorSubject<Result<List<NewsArticle>>> _articlesState = _mapToArticlesState();

  /// The state of [filterType] implemented in [_mapToFilterTypeState]
  late final BehaviorSubject<FilterType> _filterTypeState = _mapToFilterTypeState();

  /// The state of [articleUpdate] implemented in [_mapToArticleUpdateState]
  late final Stream<NewsArticle> _articleUpdateState = _mapToArticleUpdateState();

  /// The state of [errors] implemented in [_mapToErrorsState]
  late final Stream<Exception> _errorsState = _mapToErrorsState();

  @override
  void refresh() => _$refreshEvent.add(null);

  @override
  void setFilterType(FilterType type) => _$setFilterTypeEvent.add(type);

  @override
  void markArticleAsRead(NewsArticle article) => _$markArticleAsReadEvent.add(article);

  @override
  void markArticleAsUnread(NewsArticle article) => _$markArticleAsUnreadEvent.add(article);

  @override
  void starArticle(NewsArticle article) => _$starArticleEvent.add(article);

  @override
  void unstarArticle(NewsArticle article) => _$unstarArticleEvent.add(article);

  @override
  BehaviorSubject<Result<List<NewsArticle>>> get articles => _articlesState;

  @override
  BehaviorSubject<FilterType> get filterType => _filterTypeState;

  @override
  Stream<NewsArticle> get articleUpdate => _articleUpdateState;

  @override
  Stream<Exception> get errors => _errorsState;

  BehaviorSubject<Result<List<NewsArticle>>> _mapToArticlesState();

  BehaviorSubject<FilterType> _mapToFilterTypeState();

  Stream<NewsArticle> _mapToArticleUpdateState();

  Stream<Exception> _mapToErrorsState();

  @override
  NewsArticlesBlocEvents get events => this;

  @override
  NewsArticlesBlocStates get states => this;

  @override
  void dispose() {
    _$refreshEvent.close();
    _$setFilterTypeEvent.close();
    _$markArticleAsReadEvent.close();
    _$markArticleAsUnreadEvent.close();
    _$starArticleEvent.close();
    _$unstarArticleEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}
