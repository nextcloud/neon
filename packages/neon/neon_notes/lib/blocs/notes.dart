part of '../neon_notes.dart';

abstract interface class NotesBlocEvents {
  void createNote({
    final String title = '',
    final String category = '',
  });

  void updateNote(
    final int id,
    final String etag, {
    final String? title,
    final String? category,
    final String? content,
    final bool? favorite,
  });

  void deleteNote(final int id);
}

abstract interface class NotesBlocStates {
  BehaviorSubject<Result<List<notes.Note>>> get notesList;
}

class NotesBloc extends InteractiveBloc implements NotesBlocEvents, NotesBlocStates {
  NotesBloc(
    this.options,
    this.account,
  ) {
    unawaited(refresh());
  }

  final NotesClientSpecificOptions options;
  final Account account;

  @override
  void dispose() {
    unawaited(notesList.close());
    super.dispose();
  }

  @override
  BehaviorSubject<Result<List<notes.Note>>> notesList = BehaviorSubject<Result<List<notes.Note>>>();

  @override
  Future<void> refresh() async {
    await RequestManager.instance.wrapNextcloud<List<notes.Note>, BuiltList<notes.Note>, void>(
      account.id,
      'notes-notes',
      notesList,
      account.client.notes.getNotesRaw(),
      (final response) => List<notes.Note>.from(response.body),
    );
  }

  @override
  void createNote({final String title = '', final String category = ''}) {
    wrapAction(
      () async => account.client.notes.createNote(
        title: title,
        category: category,
      ),
    );
  }

  @override
  void deleteNote(final int id) {
    wrapAction(() async => account.client.notes.deleteNote(id: id));
  }

  @override
  void updateNote(
    final int id,
    final String etag, {
    final String? title,
    final String? category,
    final String? content,
    final bool? favorite,
  }) {
    wrapAction(
      () async => account.client.notes.updateNote(
        id: id,
        title: title,
        category: category,
        content: content,
        favorite: favorite ?? false ? 1 : 0,
        ifMatch: '"$etag"',
      ),
    );
  }
}
