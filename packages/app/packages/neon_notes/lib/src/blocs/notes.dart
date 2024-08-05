import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:logging/logging.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/utils.dart';
import 'package:nextcloud/notes.dart' as $notes;
import 'package:rxdart/rxdart.dart';

sealed class NotesBloc implements InteractiveBloc {
  factory NotesBloc({
    required Account account,
  }) = _NotesBloc;

  void createNote({
    String title = '',
    String category = '',
  });

  void updateNote(
    int id,
    String etag, {
    String? title,
    String? category,
    String? content,
    bool? favorite,
  });

  void deleteNote(int id);

  BehaviorSubject<Result<BuiltList<$notes.Note>>> get notes;
}

class _NotesBloc extends InteractiveBloc implements NotesBloc {
  _NotesBloc({
    required this.account,
  }) {
    unawaited(refresh());
  }

  @override
  final log = Logger('NotesBloc');

  final Account account;

  @override
  void dispose() {
    unawaited(notes.close());
    super.dispose();
  }

  @override
  final notes = BehaviorSubject();

  @override
  Future<void> refresh() async {
    await RequestManager.instance.wrap(
      account: account,
      subject: notes,
      getRequest: account.client.notes.$getNotes_Request,
      converter: ResponseConverter(account.client.notes.$getNotes_Serializer()),
      unwrap: (response) => response.body,
    );
  }

  @override
  Future<void> createNote({String title = '', String category = ''}) async {
    await wrapAction(
      () async => account.client.notes.createNote(
        title: title,
        category: category,
      ),
    );
  }

  @override
  Future<void> deleteNote(int id) async {
    await wrapAction(() async => account.client.notes.deleteNote(id: id));
  }

  @override
  Future<void> updateNote(
    int id,
    String etag, {
    String? title,
    String? category,
    String? content,
    bool? favorite,
  }) async {
    await wrapAction(
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
