part of '../neon_notes.dart';

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
