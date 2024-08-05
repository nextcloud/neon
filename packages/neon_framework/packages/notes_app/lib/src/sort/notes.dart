import 'package:neon_framework/sort_box.dart';
import 'package:nextcloud/notes.dart' as notes;
import 'package:notes_app/src/options.dart';

final notesSortBox = SortBox<NotesSortProperty, notes.Note>(
  properties: {
    NotesSortProperty.alphabetical: (note) => note.title.toLowerCase(),
    NotesSortProperty.lastModified: (note) => note.modified,
    NotesSortProperty.favorite: (note) => note.favorite ? 0 : 1,
  },
  boxes: const {
    NotesSortProperty.alphabetical: {
      (property: NotesSortProperty.lastModified, order: SortBoxOrder.descending),
    },
    NotesSortProperty.lastModified: {
      (property: NotesSortProperty.alphabetical, order: SortBoxOrder.ascending),
    },
  },
);
