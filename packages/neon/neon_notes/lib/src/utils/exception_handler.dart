import 'package:flutter/material.dart';
import 'package:neon_framework/widgets.dart';
import 'package:neon_notes/l10n/localizations.dart';
import 'package:nextcloud/nextcloud.dart';

void handleNotesException(final BuildContext context, final Object error) {
  if (error is DynamiteApiException && error.statusCode == 412) {
    NeonError.showSnackbar(context, NotesLocalizations.of(context).errorChangedOnServer);
  } else {
    NeonError.showSnackbar(context, error);
  }
}
