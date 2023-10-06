part of '../neon_notes.dart';

final notesSortBox = SortBox<NotesSortProperty, notes.Note>(
  {
    NotesSortProperty.alphabetical: (final note) => note.title.toLowerCase(),
    NotesSortProperty.lastModified: (final note) => note.modified,
    NotesSortProperty.favorite: (final note) => note.favorite ? 0 : 1,
  },
  {
    NotesSortProperty.alphabetical: {
      (NotesSortProperty.lastModified, SortBoxOrder.descending),
    },
    NotesSortProperty.lastModified: {
      (NotesSortProperty.alphabetical, SortBoxOrder.ascending),
    },
  },
);
