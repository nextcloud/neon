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

    _$createNoteEvent.listen((final event) {
      _wrapAction(
        () async => client.notes.createNote(
          title: event.title,
          category: event.category,
        ),
      );
    });

    _$updateNoteEvent.listen((final event) {
      _wrapAction(
        () async => _noteUpdateController.add(
          await client.notes.updateNote(
            id: event.id,
            title: event.title,
            category: event.category,
            content: event.content,
            favorite: event.favorite ?? false ? 1 : 0,
            ifMatch: '"${event.etag}"',
          ),
        ),
      );
    });

    _$deleteNoteEvent.listen((final id) {
      _wrapAction(() async => client.notes.deleteNote(id: id));
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
        .wrapNextcloud<List<NotesNote>, List<NotesNote>>(
          client.id,
          'notes-notes',
          () async => client.notes.getNotes(),
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
    unawaited(_notesSubject.close());
    unawaited(_errorsStreamController.close());
    super.dispose();
  }

  @override
  BehaviorSubject<Result<List<NotesNote>>> _mapToNotesState() => _notesSubject;

  @override
  Stream<NotesNote> _mapToNoteUpdateState() => _noteUpdateController.stream.asBroadcastStream();

  @override
  Stream<Exception> _mapToErrorsState() => _errorsStreamController.stream.asBroadcastStream();
}
