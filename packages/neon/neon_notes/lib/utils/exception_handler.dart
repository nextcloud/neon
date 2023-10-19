part of '../neon_notes.dart';

void handleNotesException(final BuildContext context, final Object error) {
  if (error is DynamiteApiException && error.statusCode == 412) {
    NeonError.showSnackbar(context, NotesLocalizations.of(context).errorChangedOnServer);
  } else {
    NeonError.showSnackbar(context, error);
  }
}
