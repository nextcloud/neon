/// The Neon client for the Notes app.
///
/// Add `NotesApp()` to your runNeon command to execute this app.
library;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neon_framework/models.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/notes.dart' as notes;
import 'package:notes_app/l10n/localizations.dart';
import 'package:notes_app/src/blocs/notes.dart';
import 'package:notes_app/src/options.dart';
import 'package:notes_app/src/pages/main.dart';
import 'package:notes_app/src/routes.dart';

class NotesApp extends AppImplementation<NotesBloc, NotesOptions> {
  NotesApp();

  @override
  final String id = notes.appID;

  @override
  final List<Locale> supportedLocales = NotesLocalizations.supportedLocales;

  @override
  final LocalizationsDelegate<NotesLocalizations> localizationsDelegate = NotesLocalizations.delegate;

  @override
  late final NotesOptions options = NotesOptions(storage);

  @override
  NotesBloc buildBloc(Account account) => NotesBloc(
        account: account,
      );

  @override
  final Widget page = const NotesMainPage();

  @override
  final RouteBase route = $notesAppRoute;

  @override
  VersionCheck getVersionCheck(
    Account account,
    core.OcsGetCapabilitiesResponseApplicationJson_Ocs_Data capabilities,
  ) =>
      account.client.notes.getVersionCheck(capabilities);
}
