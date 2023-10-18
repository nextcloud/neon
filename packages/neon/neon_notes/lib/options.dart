part of 'neon_notes.dart';

class NotesAppSpecificOptions extends NextcloudAppOptions {
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
    name: (final context) => NotesLocalizations.of(context).general,
  );

  final notesCategory = OptionsCategory(
    name: (final context) => NotesLocalizations.of(context).notes,
  );

  final categoriesCategory = OptionsCategory(
    name: (final context) => NotesLocalizations.of(context).categories,
  );

  late final defaultCategoryOption = SelectOption<DefaultCategory>(
    storage: super.storage,
    category: generalCategory,
    key: NotesOptionKeys.defaultCategory,
    label: (final context) => NotesLocalizations.of(context).optionsDefaultCategory,
    defaultValue: DefaultCategory.notes,
    values: {
      DefaultCategory.notes: (final context) => NotesLocalizations.of(context).notes,
      DefaultCategory.categories: (final context) => NotesLocalizations.of(context).categories,
    },
  );

  late final defaultNoteViewTypeOption = SelectOption<DefaultNoteViewType>(
    storage: super.storage,
    category: generalCategory,
    key: NotesOptionKeys.defaultNoteViewType,
    label: (final context) => NotesLocalizations.of(context).optionsDefaultNoteViewType,
    defaultValue: DefaultNoteViewType.preview,
    values: {
      DefaultNoteViewType.preview: (final context) => NotesLocalizations.of(context).optionsDefaultNoteViewTypePreview,
      DefaultNoteViewType.edit: (final context) => NotesLocalizations.of(context).optionsDefaultNoteViewTypeEdit,
    },
  );

  late final notesSortPropertyOption = SelectOption<NotesSortProperty>(
    storage: super.storage,
    category: notesCategory,
    key: NotesOptionKeys.notesSortProperty,
    label: (final context) => NotesLocalizations.of(context).optionsNotesSortProperty,
    defaultValue: NotesSortProperty.lastModified,
    values: {
      NotesSortProperty.lastModified: (final context) =>
          NotesLocalizations.of(context).optionsNotesSortPropertyLastModified,
      NotesSortProperty.alphabetical: (final context) =>
          NotesLocalizations.of(context).optionsNotesSortPropertyAlphabetical,
    },
  );

  late final notesSortBoxOrderOption = SelectOption<SortBoxOrder>(
    storage: super.storage,
    category: notesCategory,
    key: NotesOptionKeys.notesSortBoxOrder,
    label: (final context) => NotesLocalizations.of(context).optionsNotesSortOrder,
    defaultValue: SortBoxOrder.descending,
    values: sortBoxOrderOptionValues,
  );

  late final categoriesSortPropertyOption = SelectOption<CategoriesSortProperty>(
    storage: super.storage,
    category: categoriesCategory,
    key: NotesOptionKeys.categoriesSortProperty,
    label: (final context) => NotesLocalizations.of(context).optionsCategoriesSortProperty,
    defaultValue: CategoriesSortProperty.alphabetical,
    values: {
      CategoriesSortProperty.alphabetical: (final context) =>
          NotesLocalizations.of(context).optionsCategoriesSortPropertyAlphabetical,
      CategoriesSortProperty.notesCount: (final context) =>
          NotesLocalizations.of(context).optionsCategoriesSortPropertyNotesCount,
    },
  );

  late final categoriesSortBoxOrderOption = SelectOption<SortBoxOrder>(
    storage: super.storage,
    category: categoriesCategory,
    key: NotesOptionKeys.categoriesSortBoxOrder,
    label: (final context) => NotesLocalizations.of(context).optionsCategoriesSortOrder,
    defaultValue: SortBoxOrder.ascending,
    values: sortBoxOrderOptionValues,
  );
}

enum NotesOptionKeys implements Storable {
  defaultCategory._('default-category'),
  defaultNoteViewType._('default-note-view-type'),
  notesSortProperty._('notes-sort-property'),
  notesSortBoxOrder._('notes-sort-box-order'),
  categoriesSortProperty._('categories-sort-property'),
  categoriesSortBoxOrder._('categories-sort-box-order');

  const NotesOptionKeys._(this.value);

  @override
  final String value;
}

enum DefaultNoteViewType {
  preview,
  edit,
}

enum NotesSortProperty {
  lastModified,
  alphabetical,
  favorite,
}

enum CategoriesSortProperty {
  alphabetical,
  notesCount,
}

enum DefaultCategory {
  notes,
  categories,
}
