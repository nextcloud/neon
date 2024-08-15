import 'package:flutter/material.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:notes_app/l10n/localizations.dart';

void handleNotesException(BuildContext context, Object error) {
  if (error is DynamiteStatusCodeException && error.statusCode == 412) {
    NeonError.showSnackbar(context, NotesLocalizations.of(context).errorChangedOnServer);
  } else {
    NeonError.showSnackbar(context, error);
  }
}
