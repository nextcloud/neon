part of '../app.dart';

void handleNotesException(final BuildContext context, final Exception error) {
  if (error is ApiException && error.statusCode == 412) {
    ExceptionWidget.showSnackbar(context, AppLocalizations.of(context).notesNoteChangedOnServer);
  } else {
    ExceptionWidget.showSnackbar(context, error);
  }
}
