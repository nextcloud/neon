// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: RxBlocGeneratorForAnnotation
// **************************************************************************

part of 'notes.dart';

/// Used as a contractor for the bloc, events and states classes
/// {@nodoc}
abstract class NotesBlocType extends RxBlocTypeBase {
  NotesBlocEvents get events;
  NotesBlocStates get states;
}

/// [$NotesBloc] extended by the [NotesBloc]
/// {@nodoc}
abstract class $NotesBloc extends RxBlocBase implements NotesBlocEvents, NotesBlocStates, NotesBlocType {
  final _compositeSubscription = CompositeSubscription();

  /// Тhe [Subject] where events sink to by calling [refresh]
  final _$refreshEvent = PublishSubject<void>();

  /// Тhe [Subject] where events sink to by calling [createNote]
  final _$createNoteEvent = PublishSubject<NotesNote>();

  /// Тhe [Subject] where events sink to by calling [updateNote]
  final _$updateNoteEvent = PublishSubject<NotesNote>();

  /// Тhe [Subject] where events sink to by calling [deleteNote]
  final _$deleteNoteEvent = PublishSubject<NotesNote>();

  /// The state of [notes] implemented in [_mapToNotesState]
  late final BehaviorSubject<Result<List<NotesNote>>> _notesState = _mapToNotesState();

  /// The state of [noteUpdate] implemented in [_mapToNoteUpdateState]
  late final Stream<NotesNote> _noteUpdateState = _mapToNoteUpdateState();

  /// The state of [errors] implemented in [_mapToErrorsState]
  late final Stream<Exception> _errorsState = _mapToErrorsState();

  @override
  void refresh() => _$refreshEvent.add(null);

  @override
  void createNote(NotesNote note) => _$createNoteEvent.add(note);

  @override
  void updateNote(NotesNote note) => _$updateNoteEvent.add(note);

  @override
  void deleteNote(NotesNote note) => _$deleteNoteEvent.add(note);

  @override
  BehaviorSubject<Result<List<NotesNote>>> get notes => _notesState;

  @override
  Stream<NotesNote> get noteUpdate => _noteUpdateState;

  @override
  Stream<Exception> get errors => _errorsState;

  BehaviorSubject<Result<List<NotesNote>>> _mapToNotesState();

  Stream<NotesNote> _mapToNoteUpdateState();

  Stream<Exception> _mapToErrorsState();

  @override
  NotesBlocEvents get events => this;

  @override
  NotesBlocStates get states => this;

  @override
  void dispose() {
    _$refreshEvent.close();
    _$createNoteEvent.close();
    _$updateNoteEvent.close();
    _$deleteNoteEvent.close();
    _compositeSubscription.dispose();
    super.dispose();
  }
}
