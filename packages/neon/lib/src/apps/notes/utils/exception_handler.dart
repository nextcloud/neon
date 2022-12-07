part of '../app.dart';

void handleNotesException(final BuildContext context, final Object error) {
  if (error is ApiException && error.statusCode == 412) {
    ExceptionWidget.showSnackbar(context, AppLocalizations.of(context).notesNoteChangedOnServer);
  } else {
    ExceptionWidget.showSnackbar(context, error);
  }
}
