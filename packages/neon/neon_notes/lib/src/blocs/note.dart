import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_notes/src/blocs/notes.dart';
import 'package:neon_notes/src/options.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/notes.dart' as notes;
import 'package:queue/queue.dart';
import 'package:rxdart/rxdart.dart';

sealed class NotesNoteBloc implements InteractiveBloc {
  factory NotesNoteBloc({
    required NotesBloc notesBloc,
    required Account account,
    required notes.Note note,
  }) = _NotesNoteBloc;

  void updateContent(String content);

  void updateTitle(String title);

  void updateCategory(String category);

  BehaviorSubject<String> get category;

  NotesOptions get options;

  String get initialContent;

  String get initialTitle;
}

class _NotesNoteBloc extends InteractiveBloc implements NotesNoteBloc {
  _NotesNoteBloc({
    required this.notesBloc,
    required this.account,
    required notes.Note note,
  }) {
    emitNote(note);
    id = note.id;
    initialContent = note.content;
    initialTitle = note.title;
  }

  @override
  final log = Logger('NotesNoteBloc');

  void emitNote(notes.Note note) {
    category.add(note.category);
    etag = note.etag;
  }

  Future<void> wrapNoteAction(Future<DynamiteResponse<notes.Note, dynamic>> Function(String etag) call) async {
    await updateQueue.add(() async {
      try {
        final response = await call(etag);
        emitNote(response.body);
        await notesBloc.refresh();
      } on http.ClientException catch (error, stackTrace) {
        log.warning(
          'Error executing note action.',
          error,
          stackTrace,
        );

        addError(error);
      }
    });
  }

  @override
  NotesOptions get options => notesBloc.options;

  final NotesBloc notesBloc;
  final Account account;
  final updateQueue = Queue();

  late final int id;
  @override
  late final String initialContent;
  @override
  late final String initialTitle;
  late String etag;

  @override
  void dispose() {
    unawaited(category.close());
    super.dispose();
  }

  @override
  final category = BehaviorSubject();

  @override
  Future<void> refresh() async {}

  @override
  Future<void> updateCategory(String category) async {
    await wrapNoteAction(
      (etag) async => account.client.notes.updateNote(
        id: id,
        category: category,
        ifMatch: '"$etag"',
      ),
    );
  }

  @override
  Future<void> updateContent(String content) async {
    await wrapNoteAction(
      (etag) async => account.client.notes.updateNote(
        id: id,
        content: content,
        ifMatch: '"$etag"',
      ),
    );
  }

  @override
  Future<void> updateTitle(String title) async {
    await wrapNoteAction(
      (etag) async => account.client.notes.updateNote(
        id: id,
        title: title,
        ifMatch: '"$etag"',
      ),
    );
  }
}
