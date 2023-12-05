import 'package:neon_framework/sort_box.dart';
import 'package:neon_notes/src/options.dart';
import 'package:nextcloud/notes.dart' as notes;

final notesSortBox = SortBox<NotesSortProperty, notes.Note>(
  {
    NotesSortProperty.alphabetical: (final note) => note.title.toLowerCase(),
    NotesSortProperty.lastModified: (final note) => note.modified,
    NotesSortProperty.favorite: (final note) => note.favorite ? 0 : 1,
  },
  {
    NotesSortProperty.alphabetical: {
      (property: NotesSortProperty.lastModified, order: SortBoxOrder.descending),
    },
    NotesSortProperty.lastModified: {
      (property: NotesSortProperty.alphabetical, order: SortBoxOrder.ascending),
    },
  },
);
