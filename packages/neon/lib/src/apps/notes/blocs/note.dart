import 'dart:async';

import 'package:neon/src/apps/notes/app.dart';
import 'package:neon/src/apps/notes/blocs/notes.dart';
import 'package:neon/src/neon.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'note.rxb.g.dart';

abstract class NotesNoteBlocEvents {
  void updateNote(
    final int id,
    final String etag, {
    final String? title,
    final String? category,
    final String? content,
    final bool? favorite,
  });
}

abstract class NotesNoteBlocStates {
  BehaviorSubject<String> get content;

  BehaviorSubject<String> get title;

  BehaviorSubject<String> get category;

  BehaviorSubject<String> get etag;

  Stream<Exception> get errors;
}

@RxBloc()
class NotesNoteBloc extends $NotesNoteBloc {
  NotesNoteBloc(
    this.options,
    this._requestManager,
    this._client,
    this._notesBloc,
    final NotesNote note,
  ) {
    _$updateNoteEvent.listen((final event) {
      _wrapAction(
        () async {
          _emitNote(
            await _client.notes.updateNote(
              id: event.id,
              title: event.title,
              category: event.category,
              content: event.content,
              favorite: event.favorite ?? false ? 1 : 0,
              ifMatch: '"${event.etag}"',
            ),
          );
        },
      );
    });

    _emitNote(note);
    id = note.id;
  }

  void _emitNote(final NotesNote note) {
    _contentSubject.add(note.content);
    _titleSubject.add(note.title);
    _categorySubject.add(note.category);
    _etagSubject.add(note.etag);
  }

  void _wrapAction(final Future Function() call) {
    final stream = _requestManager.wrapWithoutCache(call).asBroadcastStream();
    stream.whereError().listen(_errorsStreamController.add);
    stream.whereSuccess().listen((final _) async {
      _notesBloc.refresh();
    });
  }

  final NotesAppSpecificOptions options;
  final RequestManager _requestManager;
  final NextcloudClient _client;
  final NotesBloc _notesBloc;

  late final int id;
  final _contentSubject = BehaviorSubject<String>();
  final _titleSubject = BehaviorSubject<String>();
  final _categorySubject = BehaviorSubject<String>();
  final _etagSubject = BehaviorSubject<String>();
  final _errorsStreamController = StreamController<Exception>();

  @override
  void dispose() {
    unawaited(_contentSubject.close());
    unawaited(_titleSubject.close());
    unawaited(_categorySubject.close());
    unawaited(_etagSubject.close());
    unawaited(_errorsStreamController.close());
    super.dispose();
  }

  @override
  Stream<Exception> _mapToErrorsState() => _errorsStreamController.stream.asBroadcastStream();

  @override
  BehaviorSubject<String> _mapToContentState() => _contentSubject;

  @override
  BehaviorSubject<String> _mapToTitleState() => _titleSubject;

  @override
  BehaviorSubject<String> _mapToCategoryState() => _categorySubject;

  @override
  BehaviorSubject<String> _mapToEtagState() => _etagSubject;
}
