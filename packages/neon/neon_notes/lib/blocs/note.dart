part of '../neon_notes.dart';

abstract interface class NotesNoteBlocEvents {
  void updateContent(final String content);

  void updateTitle(final String title);

  void updateCategory(final String category);
}

abstract interface class NotesNoteBlocStates {
  BehaviorSubject<String> get category;
}

class NotesNoteBloc extends InteractiveBloc implements NotesNoteBlocEvents, NotesNoteBlocStates {
  NotesNoteBloc(
    this._notesBloc,
    final notes.Note note,
  ) {
    _emitNote(note);
    id = note.id;
    initialContent = note.content;
    initialTitle = note.title;
  }

  void _emitNote(final notes.Note note) {
    category.add(note.category);
    _etag = note.etag;
  }

  // ignore: avoid_void_async
  void _wrapAction(final Future<DynamiteResponse<notes.Note, dynamic>> Function(String etag) call) async {
    await _updateQueue.add(() async {
      try {
        final response = await call(_etag);
        _emitNote(response.body);
        await _notesBloc.refresh();
      } catch (e, s) {
        debugPrint(e.toString());
        debugPrint(s.toString());
        addError(e);
      }
    });
  }

  late final NotesClientSpecificOptions options = _notesBloc.options;
  final NotesBloc _notesBloc;
  final _updateQueue = Queue();

  late final int id;
  late final String initialContent;
  late final String initialTitle;
  late String _etag;

  @override
  void dispose() {
    unawaited(category.close());
    super.dispose();
  }

  @override
  BehaviorSubject<String> category = BehaviorSubject<String>();

  @override
  void refresh() {}

  @override
  void updateCategory(final String category) {
    _wrapAction(
      (final etag) async => _notesBloc.account.client.notes.updateNote(
        id: id,
        category: category,
        ifMatch: '"$etag"',
      ),
    );
  }

  @override
  void updateContent(final String content) {
    _wrapAction(
      (final etag) async => _notesBloc.account.client.notes.updateNote(
        id: id,
        content: content,
        ifMatch: '"$etag"',
      ),
    );
  }

  @override
  void updateTitle(final String title) {
    _wrapAction(
      (final etag) async => _notesBloc.account.client.notes.updateNote(
        id: id,
        title: title,
        ifMatch: '"$etag"',
      ),
    );
  }
}
