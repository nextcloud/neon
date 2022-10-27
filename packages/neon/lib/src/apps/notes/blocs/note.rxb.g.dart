// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'note.dart';

/// Used as a contractor for the bloc, events and states classes
/// {@nodoc}
abstract class NotesNoteBlocType extends RxBlocTypeBase {
  NotesNoteBlocEvents get events;
  NotesNoteBlocStates get states;
}

/// [$NotesNoteBloc] extended by the [NotesNoteBloc]
/// {@nodoc}
abstract class $NotesNoteBloc extends RxBlocBase
    implements NotesNoteBlocEvents, NotesNoteBlocStates, NotesNoteBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [updateNote]
  final _$updateNoteEvent = PublishSubject<_UpdateNoteEventArgs>();

  /// The state of [content] implemented in [_mapToContentState]
  late final BehaviorSubject<String> _contentState = _mapToContentState();

  /// The state of [title] implemented in [_mapToTitleState]
  late final BehaviorSubject<String> _titleState = _mapToTitleState();

  /// The state of [category] implemented in [_mapToCategoryState]
  late final BehaviorSubject<String> _categoryState = _mapToCategoryState();

  /// The state of [etag] implemented in [_mapToEtagState]
  late final BehaviorSubject<String> _etagState = _mapToEtagState();

  /// The state of [errors] implemented in [_mapToErrorsState]
  late final Stream<Exception> _errorsState = _mapToErrorsState();

  @override
  void updateNote(
    int id,
    String etag, {
    String? title,
    String? category,
    String? content,
    bool? favorite,
  }) =>
      _$updateNoteEvent.add(_UpdateNoteEventArgs(
        id,
        etag,
        title: title,
        category: category,
        content: content,
        favorite: favorite,
      ));

  @override
  BehaviorSubject<String> get content => _contentState;

  @override
  BehaviorSubject<String> get title => _titleState;

  @override
  BehaviorSubject<String> get category => _categoryState;

  @override
  BehaviorSubject<String> get etag => _etagState;

  @override
  Stream<Exception> get errors => _errorsState;

  BehaviorSubject<String> _mapToContentState();

  BehaviorSubject<String> _mapToTitleState();

  BehaviorSubject<String> _mapToCategoryState();

  BehaviorSubject<String> _mapToEtagState();

  Stream<Exception> _mapToErrorsState();

  @override
  NotesNoteBlocEvents get events => this;

  @override
  NotesNoteBlocStates get states => this;

  @override
  void dispose() {
    _$updateNoteEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}

/// Helps providing the arguments in the [Subject.add] for
/// [NotesNoteBlocEvents.updateNote] event
class _UpdateNoteEventArgs {
  const _UpdateNoteEventArgs(
    this.id,
    this.etag, {
    this.title,
    this.category,
    this.content,
    this.favorite,
  });

  final int id;

  final String etag;

  final String? title;

  final String? category;

  final String? content;

  final bool? favorite;
}
