import 'package:neon/sort_box.dart';
import 'package:neon_notes/src/options.dart';

final categoriesSortBox = SortBox<CategoriesSortProperty, NoteCategory>(
  {
    CategoriesSortProperty.alphabetical: (final category) => category.name.toLowerCase(),
    CategoriesSortProperty.notesCount: (final category) => category.count,
  },
  {
    CategoriesSortProperty.notesCount: {
      (property: CategoriesSortProperty.alphabetical, order: SortBoxOrder.ascending),
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
