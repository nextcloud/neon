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
    name: (final context) => AppLocalizations.of(context).general,
  );

  final notesCategory = OptionsCategory(
    name: (final context) => AppLocalizations.of(context).notes,
  );

  final categoriesCategory = OptionsCategory(
    name: (final context) => AppLocalizations.of(context).categories,
  );

  late final defaultCategoryOption = SelectOption<DefaultCategory>(
    storage: super.storage,
    category: generalCategory,
    key: 'default-category',
    label: (final context) => AppLocalizations.of(context).optionsDefaultCategory,
    defaultValue: DefaultCategory.notes,
    values: {
      DefaultCategory.notes: (final context) => AppLocalizations.of(context).notes,
      DefaultCategory.categories: (final context) => AppLocalizations.of(context).categories,
    },
  );

  late final defaultNoteViewTypeOption = SelectOption<DefaultNoteViewType>(
    storage: super.storage,
    category: generalCategory,
    key: 'default-note-view-type',
    label: (final context) => AppLocalizations.of(context).optionsDefaultNoteViewType,
    defaultValue: DefaultNoteViewType.preview,
    values: {
      DefaultNoteViewType.preview: (final context) => AppLocalizations.of(context).optionsDefaultNoteViewTypePreview,
      DefaultNoteViewType.edit: (final context) => AppLocalizations.of(context).optionsDefaultNoteViewTypeEdit,
    },
  );

  late final notesSortPropertyOption = SelectOption<NotesSortProperty>(
    storage: super.storage,
    category: notesCategory,
    key: 'notes-sort-property',
    label: (final context) => AppLocalizations.of(context).optionsNotesSortProperty,
    defaultValue: NotesSortProperty.lastModified,
    values: {
      NotesSortProperty.lastModified: (final context) =>
          AppLocalizations.of(context).optionsNotesSortPropertyLastModified,
      NotesSortProperty.alphabetical: (final context) =>
          AppLocalizations.of(context).optionsNotesSortPropertyAlphabetical,
    },
  );

  late final notesSortBoxOrderOption = SelectOption<SortBoxOrder>(
    storage: super.storage,
    category: notesCategory,
    key: 'notes-sort-box-order',
    label: (final context) => AppLocalizations.of(context).optionsNotesSortOrder,
    defaultValue: SortBoxOrder.descending,
    values: sortBoxOrderOptionValues,
  );

  late final categoriesSortPropertyOption = SelectOption<CategoriesSortProperty>(
    storage: super.storage,
    category: categoriesCategory,
    key: 'categories-sort-property',
    label: (final context) => AppLocalizations.of(context).optionsCategoriesSortProperty,
    defaultValue: CategoriesSortProperty.alphabetical,
    values: {
      CategoriesSortProperty.alphabetical: (final context) =>
          AppLocalizations.of(context).optionsCategoriesSortPropertyAlphabetical,
      CategoriesSortProperty.notesCount: (final context) =>
          AppLocalizations.of(context).optionsCategoriesSortPropertyNotesCount,
    },
  );

  late final categoriesSortBoxOrderOption = SelectOption<SortBoxOrder>(
    storage: super.storage,
    category: categoriesCategory,
    key: 'categories-sort-box-order',
    label: (final context) => AppLocalizations.of(context).optionsCategoriesSortOrder,
    defaultValue: SortBoxOrder.ascending,
    values: sortBoxOrderOptionValues,
  );
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
