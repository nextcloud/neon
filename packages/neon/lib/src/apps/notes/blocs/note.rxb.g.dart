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

  /// Тhe [Subject] where events sink to by calling [updateContent]
  final _$updateContentEvent = PublishSubject<String>();

  /// Тhe [Subject] where events sink to by calling [updateTitle]
  final _$updateTitleEvent = PublishSubject<String>();

  /// Тhe [Subject] where events sink to by calling [updateCategory]
  final _$updateCategoryEvent = PublishSubject<String>();

  /// The state of [category] implemented in [_mapToCategoryState]
  late final BehaviorSubject<String> _categoryState = _mapToCategoryState();

  /// The state of [errors] implemented in [_mapToErrorsState]
  late final Stream<Exception> _errorsState = _mapToErrorsState();

  @override
  void updateContent(String content) => _$updateContentEvent.add(content);

  @override
  void updateTitle(String title) => _$updateTitleEvent.add(title);

  @override
  void updateCategory(String category) => _$updateCategoryEvent.add(category);

  @override
  BehaviorSubject<String> get category => _categoryState;

  @override
  Stream<Exception> get errors => _errorsState;

  BehaviorSubject<String> _mapToCategoryState();

  Stream<Exception> _mapToErrorsState();

  @override
  NotesNoteBlocEvents get events => this;

  @override
  NotesNoteBlocStates get states => this;

  @override
  void dispose() {
    _$updateContentEvent.close();
    _$updateTitleEvent.close();
    _$updateCategoryEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}
