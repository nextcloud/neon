import 'localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get general => 'General';

  @override
  String get note => 'Note';

  @override
  String get notes => 'Notes';

  @override
  String get categories => 'Categories';

  @override
  String get createNote => 'Create note';

  @override
  String get category => 'Category';

  @override
  String get setCategory => 'Set category';

  @override
  String get noteTitle => 'Title';

  @override
  String get noteChangedOnServer => 'The note has been changed on the server. Please refresh and try again';

  @override
  String notesInCategory(int count) {
    return '$count notes';
  }

  @override
  String get uncategorized => 'Uncategorized';

  @override
  String get showEditor => 'Edit note';

  @override
  String get showPreview => 'Preview note';

  @override
  String get star => 'Star note';

  @override
  String get unstar => 'Unstar note';

  @override
  String get changeCategory => 'Change note category';

  @override
  String deleteNoteConfirm(String name) {
    return 'Are you sure you want to delete the note \'$name\'?';
  }

  @override
  String get optionsDefaultCategory => 'Category to show by default';

  @override
  String get optionsDefaultNoteViewType => 'How to show note';

  @override
  String get optionsDefaultNoteViewTypePreview => 'Preview';

  @override
  String get optionsDefaultNoteViewTypeEdit => 'Editor';

  @override
  String get optionsNotesSortOrder => 'Sort order of notes';

  @override
  String get optionsNotesSortProperty => 'How to sort notes';

  @override
  String get optionsNotesSortPropertyLastModified => 'Last modified';

  @override
  String get optionsNotesSortPropertyAlphabetical => 'Alphabetical';

  @override
  String get optionsCategoriesSortOrder => 'Sort order of categories';

  @override
  String get optionsCategoriesSortProperty => 'How to sort categories';

  @override
  String get optionsCategoriesSortPropertyAlphabetical => 'Alphabetical';

  @override
  String get optionsCategoriesSortPropertyNotesCount => 'Count of notes';
}
