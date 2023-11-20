/// The Neon client for the notes app.
///
/// Add `NotesApp()` to your runNeon command to execute this app.
///
/// A basic implementation could look like:
///```dart
///Future<void> main() async {
///  await runNeon(
///    appImplementations: {
///      NotesApp()
///    },
///    theme: NeonTheme(
///      branding: Branding(
///       name: 'Notes',
///       logo: VectorGraphic(
///         loader: AssetBytesLoader(
///           'assets/logo.svg.vec',
///         ),
///       ),
///      ),
///    ),
///  );
/// }
///```
library notes;

import 'dart:async';
import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:neon/blocs.dart';
import 'package:neon/models.dart';
import 'package:neon/settings.dart';
import 'package:neon/sort_box.dart';
import 'package:neon/theme.dart';
import 'package:neon/utils.dart';
import 'package:neon/widgets.dart';
import 'package:neon_notes/l10n/localizations.dart';
import 'package:neon_notes/routes.dart';
import 'package:nextcloud/core.dart' as core;
import 'package:nextcloud/nextcloud.dart';
import 'package:nextcloud/notes.dart' as notes;
import 'package:queue/queue.dart';
import 'package:rxdart/rxdart.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

part 'blocs/note.dart';
part 'blocs/notes.dart';
part 'dialogs/create_note.dart';
part 'dialogs/select_category.dart';
part 'options.dart';
part 'pages/category.dart';
part 'pages/main.dart';
part 'pages/note.dart';
part 'sort/categories.dart';
part 'sort/notes.dart';
part 'utils/category_color.dart';
part 'utils/exception_handler.dart';
part 'widgets/categories_view.dart';
part 'widgets/category_select.dart';
part 'widgets/notes_floating_action_button.dart';
part 'widgets/notes_view.dart';

class NotesApp extends AppImplementation<NotesBloc, NotesAppSpecificOptions> {
  NotesApp();

  @override
  final String id = AppIDs.notes;

  @override
  final List<Locale> supportedLocales = NotesLocalizations.supportedLocales;

  @override
  final LocalizationsDelegate<NotesLocalizations> localizationsDelegate = NotesLocalizations.delegate;

  @override
  late final NotesAppSpecificOptions options = NotesAppSpecificOptions(storage);

  @override
  NotesBloc buildBloc(final Account account) => NotesBloc(
        options,
        account,
      );

  @override
  final Widget page = const NotesMainPage();

  @override
  final RouteBase route = $notesAppRoute;

  @override
  VersionCheck getVersionCheck(
    final Account account,
    final core.OcsGetCapabilitiesResponseApplicationJson_Ocs_Data capabilities,
  ) =>
      account.client.notes.getVersionCheck(capabilities);
}
