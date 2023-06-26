part of '../neon_notes.dart';

void handleNotesException(final BuildContext context, final Object error) {
  if (error is DynamiteApiException && error.statusCode == 412) {
    NeonException.showSnackbar(context, AppLocalizations.of(context).errorChangedOnServer);
  } else {
    NeonException.showSnackbar(context, error);
  }
}
