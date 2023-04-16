part of 'neon_notes.dart';

class NotesAppSpecificOptions extends NextcloudAppSpecificOptions {
  NotesAppSpecificOptions(super.storage) {
    super.categories = [
      generalCategory,
      notesCategory,
      categoriesCategory,
    ];
    super.options = [
      defaultCategoryOption,
      defaultNoteViewTypeOption,
      notesSortPropertyOption,
      notesSortBoxOrderOption,
      categoriesSortPropertyOption,
      categoriesSortBoxOrderOption,
    ];
  }

  final generalCategory = OptionsCategory(
    name: (final context) => AppLocalizations.of(context).optionsCategoryGeneral,
  );

  final notesCategory = OptionsCategory(
    name: (final context) => AppLocalizations.of(context).notesNotes,
  );

  final categoriesCategory = OptionsCategory(
    name: (final context) => AppLocalizations.of(context).notesCategories,
  );

  late final defaultCategoryOption = SelectOption<DefaultCategory>(
    storage: super.storage,
    category: generalCategory,
    key: 'default-category',
    label: (final context) => AppLocalizations.of(context).notesOptionsDefaultCategory,
    defaultValue: BehaviorSubject.seeded(DefaultCategory.notes),
    values: BehaviorSubject.seeded({
      DefaultCategory.notes: (final context) => AppLocalizations.of(context).notesNotes,
      DefaultCategory.categories: (final context) => AppLocalizations.of(context).notesCategories,
    }),
  );

  late final defaultNoteViewTypeOption = SelectOption<DefaultNoteViewType>(
    storage: super.storage,
    category: generalCategory,
    key: 'default-note-view-type',
    label: (final context) => AppLocalizations.of(context).notesOptionsDefaultNoteViewType,
    defaultValue: BehaviorSubject.seeded(DefaultNoteViewType.preview),
    values: BehaviorSubject.seeded({
      DefaultNoteViewType.preview: (final context) =>
          AppLocalizations.of(context).notesOptionsDefaultNoteViewTypePreview,
      DefaultNoteViewType.edit: (final context) => AppLocalizations.of(context).notesOptionsDefaultNoteViewTypeEdit,
    }),
  );

  late final notesSortPropertyOption = SelectOption<NotesSortProperty>(
    storage: super.storage,
    category: notesCategory,
    key: 'notes-sort-property',
    label: (final context) => AppLocalizations.of(context).notesOptionsNotesSortProperty,
    defaultValue: BehaviorSubject.seeded(NotesSortProperty.lastModified),
    values: BehaviorSubject.seeded({
      NotesSortProperty.lastModified: (final context) =>
          AppLocalizations.of(context).notesOptionsNotesSortPropertyLastModified,
      NotesSortProperty.alphabetical: (final context) =>
          AppLocalizations.of(context).notesOptionsNotesSortPropertyAlphabetical,
    }),
  );

  late final notesSortBoxOrderOption = SelectOption<SortBoxOrder>(
    storage: super.storage,
    category: notesCategory,
    key: 'notes-sort-box-order',
    label: (final context) => AppLocalizations.of(context).notesOptionsNotesSortOrder,
    defaultValue: BehaviorSubject.seeded(SortBoxOrder.descending),
    values: BehaviorSubject.seeded(sortBoxOrderOptionValues),
  );

  late final categoriesSortPropertyOption = SelectOption<CategoriesSortProperty>(
    storage: super.storage,
    category: categoriesCategory,
    key: 'categories-sort-property',
    label: (final context) => AppLocalizations.of(context).notesOptionsCategoriesSortProperty,
    defaultValue: BehaviorSubject.seeded(CategoriesSortProperty.alphabetical),
    values: BehaviorSubject.seeded({
      CategoriesSortProperty.alphabetical: (final context) =>
          AppLocalizations.of(context).notesOptionsCategoriesSortPropertyAlphabetical,
      CategoriesSortProperty.notesCount: (final context) =>
          AppLocalizations.of(context).notesOptionsCategoriesSortPropertyNotesCount,
    }),
  );

  late final categoriesSortBoxOrderOption = SelectOption<SortBoxOrder>(
    storage: super.storage,
    category: categoriesCategory,
    key: 'categories-sort-box-order',
    label: (final context) => AppLocalizations.of(context).notesOptionsCategoriesSortOrder,
    defaultValue: BehaviorSubject.seeded(SortBoxOrder.ascending),
    values: BehaviorSubject.seeded(sortBoxOrderOptionValues),
  );
}

enum DefaultNoteViewType {
  preview,
  edit,
}

enum NotesSortProperty {
  lastModified,
  alphabetical,
}

enum CategoriesSortProperty {
  alphabetical,
  notesCount,
}

enum DefaultCategory {
  notes,
  categories,
}
