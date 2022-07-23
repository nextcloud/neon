import 'dart:async';

import 'package:neon/src/apps/notes/app.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/neon.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'notes.rxb.g.dart';

abstract class NotesBlocEvents {
  void refresh();

  void createNote(final NotesNote note);

  void updateNote(final NotesNote note);

  void deleteNote(final NotesNote note);
}

abstract class NotesBlocStates {
  BehaviorSubject<Result<List<NotesNote>>> get notes;

  Stream<NotesNote> get noteUpdate;

  Stream<Exception> get errors;
}

@RxBloc()
class NotesBloc extends $NotesBloc {
  NotesBloc(
    this.options,
    this.requestManager,
    this.client,
  ) {
    _$refreshEvent.listen((final _) => _loadNotes());

    _$createNoteEvent.listen((final note) {
      _wrapAction(() async => client.notes.createNote(note));
    });

    _$updateNoteEvent.listen((final note) {
      _wrapAction(
        () async => _noteUpdateController.add(
          (await client.notes.updateNote(
            note.id!,
            note,
            ifMatch: '"${note.etag}"',
          ))!,
        ),
      );
    });

    _$deleteNoteEvent.listen((final note) {
      _wrapAction(() async => client.notes.deleteNote(note.id!));
    });

    _loadNotes();
  }

  void _wrapAction(final Future Function() call) {
    final stream = requestManager.wrapWithoutCache(call).asBroadcastStream();
    stream.whereError().listen(_errorsStreamController.add);
    stream.whereSuccess().listen((final _) async {
      _loadNotes();
    });
  }

  void _loadNotes() {
    requestManager
        .wrapNextcloud<List<NotesNote>, List<NotesNote>, NotesNote, NextcloudNotesClient>(
          client.id,
          client.notes,
          'notes-notes',
          () async => (await client.notes.getNotes())!,
          (final response) => response,
          previousData: _notesSubject.valueOrNull?.data,
        )
        .listen(_notesSubject.add);
  }

  final NotesAppSpecificOptions options;
  final RequestManager requestManager;
  final NextcloudClient client;

  final _notesSubject = BehaviorSubject<Result<List<NotesNote>>>();
  final _noteUpdateController = StreamController<NotesNote>();
  final _errorsStreamController = StreamController<Exception>();

  @override
  void dispose() {
    _notesSubject.close();
    _errorsStreamController.close();
    super.dispose();
  }

  @override
  BehaviorSubject<Result<List<NotesNote>>> _mapToNotesState() => _notesSubject;

  @override
  Stream<NotesNote> _mapToNoteUpdateState() => _noteUpdateController.stream.asBroadcastStream();

  @override
  Stream<Exception> _mapToErrorsState() => _errorsStreamController.stream.asBroadcastStream();
}
