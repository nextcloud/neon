part of '../neon_notes.dart';

final notesSortBox = SortBox<NotesSortProperty, NotesNote>(
  {
    NotesSortProperty.alphabetical: (final note) => note.title.toLowerCase(),
    NotesSortProperty.lastModified: (final note) => note.modified,
  },
  {
    NotesSortProperty.alphabetical: {
      (NotesSortProperty.lastModified, SortBoxOrder.descending),
    },
  },
);
