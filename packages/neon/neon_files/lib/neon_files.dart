/// The Neon client for the Files app.
///
/// Add `FilesApp()` to your runNeon command to execute this app.
library;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neon_files/l10n/localizations.dart';
import 'package:neon_files/src/blocs/files.dart';
import 'package:neon_files/src/options.dart';
import 'package:neon_files/src/pages/main.dart';
import 'package:neon_files/src/routes.dart';
import 'package:neon_framework/models.dart';
import 'package:nextcloud/files.dart' as files;

class FilesApp extends AppImplementation<FilesBloc, FilesOptions> {
  FilesApp();

  @override
  final String id = files.appID;

  @override
  final LocalizationsDelegate<FilesLocalizations> localizationsDelegate = FilesLocalizations.delegate;

  @override
  final List<Locale> supportedLocales = FilesLocalizations.supportedLocales;

  @override
  late final FilesOptions options = FilesOptions(storage);

  @override
  FilesBloc buildBloc(Account account) => FilesBloc(
        options: options,
        account: account,
      );

  @override
  final Widget page = const FilesMainPage();

  @override
  final RouteBase route = $filesAppRoute;
}
