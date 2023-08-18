part of '../neon_notes.dart';

final notesSortBox = SortBox<NotesSortProperty, NotesNote>(
  {
    NotesSortProperty.alphabetical: (final note) => note.title.toLowerCase(),
    NotesSortProperty.lastModified: (final note) => note.modified,
  },
  {
    NotesSortProperty.alphabetical: {
      Box(NotesSortProperty.lastModified, SortBoxOrder.descending),
    },
  },
);
