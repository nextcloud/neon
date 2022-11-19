import 'package:nextcloud/nextcloud.dart';
import 'package:test/test.dart';

import 'helper.dart';

Future main() async {
  final image = await getDockerImage(apps: ['notes']);

  group('notes', () {
    late DockerContainer container;
    late TestNextcloudClient client;
    setUp(() async {
      container = await getDockerContainer(image);
      client = await getTestClient(container);
    });
    tearDown(() => container.destroy());

    test('Is supported', () async {
      final response = await client.notes.isSupported();
      expect(response, isTrue);
    });

    test('Create note favorite', () async {
      final response = await client.notes.createNote(
        title: 'a',
        content: 'b',
        category: 'c',
        favorite: 1,
      );
      expect(response.id, isPositive);
      expect(response.title, 'a');
      expect(response.content, 'b');
      expect(response.category, 'c');
      expect(response.favorite, true);
      expect(response.readonly, false);
      expect(response.etag, isNotNull);
      expect(response.modified, isNotNull);
    });

    test('Create note not favorite', () async {
      final response = await client.notes.createNote(
        title: 'a',
        content: 'b',
        category: 'c',
      );
      expect(response.id, isPositive);
      expect(response.title, 'a');
      expect(response.content, 'b');
      expect(response.category, 'c');
      expect(response.favorite, false);
      expect(response.readonly, false);
      expect(response.etag, isNotNull);
      expect(response.modified, isNotNull);
    });

    test('Get notes', () async {
      await client.notes.createNote(title: 'a');
      await client.notes.createNote(title: 'b');

      final response = await client.notes.getNotes();
      expect(response, hasLength(2));
      expect(response[0].title, 'a');
      expect(response[1].title, 'b');
    });

    test('Get note', () async {
      final response = await client.notes.getNote(
        id: (await client.notes.createNote(title: 'a')).id,
      );
      expect(response.title, 'a');
    });

    test('Update note', () async {
      final id = (await client.notes.createNote(title: 'a')).id;
      await client.notes.updateNote(
        id: id,
        title: 'b',
      );

      final response = await client.notes.getNote(id: id);
      expect(response.title, 'b');
    });

    test('Update note fail changed on server', () async {
      final response = await client.notes.createNote(title: 'a');
      await client.notes.updateNote(
        id: response.id,
        title: 'b',
        ifMatch: '"${response.etag}"',
      );
      expect(
        () => client.notes.updateNote(
          id: response.id,
          title: 'c',
          ifMatch: '"${response.etag}"',
        ),
        throwsA(predicate((final e) => (e! as ApiException).statusCode == 412)),
      );
    });

    test('Delete note', () async {
      final id = (await client.notes.createNote(title: 'a')).id;

      var response = await client.notes.getNotes();
      expect(response, hasLength(1));

      await client.notes.deleteNote(id: id);

      response = await client.notes.getNotes();
      expect(response, hasLength(0));
    });

    test('Get settings', () async {
      final response = await client.notes.getSettings();
      expect(response.notesPath, 'Notes');
      expect(response.fileSuffix, '.txt');
      expect(response.noteMode, NotesSettings_NoteMode.edit);
    });

    test('Update settings', () async {
      var response = await client.notes.updateSettings(
        notesSettings: NotesSettings(
          notesPath: 'Test Notes',
          fileSuffix: '.md',
          noteMode: NotesSettings_NoteMode.preview,
        ),
      );
      expect(response.notesPath, 'Test Notes');
      expect(response.fileSuffix, '.md');
      expect(response.noteMode, NotesSettings_NoteMode.preview);

      response = await client.notes.getSettings();
      expect(response.notesPath, 'Test Notes');
      expect(response.fileSuffix, '.md');
      expect(response.noteMode, NotesSettings_NoteMode.preview);
    });
  });
}
