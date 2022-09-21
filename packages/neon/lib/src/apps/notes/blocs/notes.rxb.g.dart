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
  final _$createNoteEvent = PublishSubject<_CreateNoteEventArgs>();

  /// Тhe [Subject] where events sink to by calling [updateNote]
  final _$updateNoteEvent = PublishSubject<_UpdateNoteEventArgs>();

  /// Тhe [Subject] where events sink to by calling [deleteNote]
  final _$deleteNoteEvent = PublishSubject<int>();

  /// The state of [notes] implemented in [_mapToNotesState]
  late final BehaviorSubject<Result<List<NotesNote>>> _notesState = _mapToNotesState();

  /// The state of [noteUpdate] implemented in [_mapToNoteUpdateState]
  late final Stream<NotesNote> _noteUpdateState = _mapToNoteUpdateState();

  /// The state of [errors] implemented in [_mapToErrorsState]
  late final Stream<Exception> _errorsState = _mapToErrorsState();

  @override
  void refresh() => _$refreshEvent.add(null);

  @override
  void createNote({String title = '', String category = ''}) =>
      _$createNoteEvent.add(_CreateNoteEventArgs(title: title, category: category));

  @override
  void updateNote(int id, String etag, {String? title, String? category, String? content, bool? favorite}) =>
      _$updateNoteEvent
          .add(_UpdateNoteEventArgs(id, etag, title: title, category: category, content: content, favorite: favorite));

  @override
  void deleteNote(int id) => _$deleteNoteEvent.add(id);

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

/// Helps providing the arguments in the [Subject.add] for
/// [NotesBlocEvents.createNote] event
class _CreateNoteEventArgs {
  const _CreateNoteEventArgs({this.title = '', this.category = ''});

  final String title;

  final String category;
}

/// Helps providing the arguments in the [Subject.add] for
/// [NotesBlocEvents.updateNote] event
class _UpdateNoteEventArgs {
  const _UpdateNoteEventArgs(this.id, this.etag, {this.title, this.category, this.content, this.favorite});

  final int id;

  final String etag;

  final String? title;

  final String? category;

  final String? content;

  final bool? favorite;
}
