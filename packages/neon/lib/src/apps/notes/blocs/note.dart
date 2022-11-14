import 'dart:async';

import 'package:neon/src/apps/notes/app.dart';
import 'package:neon/src/apps/notes/blocs/notes.dart';
import 'package:neon/src/neon.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:queue/queue.dart';
import 'package:rx_bloc/rx_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'note.rxb.g.dart';

abstract class NotesNoteBlocEvents {
  void updateContent(final String content);

  void updateTitle(final String title);

  void updateCategory(final String category);
}

abstract class NotesNoteBlocStates {
  BehaviorSubject<String> get category;

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
    _$updateContentEvent.debounceTime(const Duration(seconds: 1)).listen((final content) {
      _wrapAction(
        (final etag) async => _client.notes.updateNote(
          id: id,
          content: content,
          ifMatch: '"$etag"',
        ),
      );
    });

    _$updateTitleEvent.debounceTime(const Duration(seconds: 1)).listen((final title) {
      _wrapAction(
        (final etag) async => _client.notes.updateNote(
          id: id,
          title: title,
          ifMatch: '"$etag"',
        ),
      );
    });

    _$updateCategoryEvent.listen((final category) {
      _wrapAction(
        (final etag) async => _client.notes.updateNote(
          id: id,
          category: category,
          ifMatch: '"$etag"',
        ),
      );
    });

    _emitNote(note);
    id = note.id;
    initialContent = note.content;
    initialTitle = note.title;
  }

  void _emitNote(final NotesNote note) {
    _categorySubject.add(note.category);
    _etag = note.etag;
  }

  void _wrapAction(final Future<NotesNote> Function(String etag) call) {
    unawaited(
      _updateQueue.add(() async {
        final stream = _requestManager.wrapWithoutCache(() async => _emitNote(await call(_etag))).asBroadcastStream();
        stream.whereError().listen(_errorsStreamController.add);
        stream.whereSuccess().listen((final _) => _notesBloc.refresh());
        await stream.last;
      }),
    );
  }

  final NotesAppSpecificOptions options;
  final RequestManager _requestManager;
  final NextcloudClient _client;
  final NotesBloc _notesBloc;
  final _updateQueue = Queue();

  late final int id;
  late final String initialContent;
  late final String initialTitle;
  late String _etag;
  final _categorySubject = BehaviorSubject<String>();
  final _errorsStreamController = StreamController<Exception>();

  @override
  void dispose() {
    unawaited(_categorySubject.close());
    unawaited(_errorsStreamController.close());
    super.dispose();
  }

  @override
  BehaviorSubject<String> _mapToCategoryState() => _categorySubject;

  @override
  Stream<Exception> _mapToErrorsState() => _errorsStreamController.stream.asBroadcastStream();
}
