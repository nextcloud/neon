part of '../neon_notes.dart';

final categoriesSortBox = SortBox<CategoriesSortProperty, NoteCategory>(
  {
    CategoriesSortProperty.alphabetical: (final category) => category.name.toLowerCase(),
    CategoriesSortProperty.notesCount: (final category) => category.count,
  },
  {
    CategoriesSortProperty.notesCount: {
      Box(CategoriesSortProperty.alphabetical, SortBoxOrder.ascending),
    },
  },
);

class NoteCategory {
  NoteCategory(
    this.name,
    this.count,
  );

  final String name;
  final int count;
}
