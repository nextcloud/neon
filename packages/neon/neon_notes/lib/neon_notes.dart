library notes;

import 'dart:async';
import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:neon/blocs.dart';
import 'package:neon/models.dart';
import 'package:neon/platform.dart';
import 'package:neon/settings.dart';
import 'package:neon/utils.dart';
import 'package:neon/widgets.dart';
import 'package:neon_notes/l10n/localizations.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:provider/provider.dart';
import 'package:queue/queue.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sort_box/sort_box.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wakelock/wakelock.dart';

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
  NotesApp(super.sharedPreferences, super.requestManager, super.platform);

  @override
  String id = 'notes';

  @override
  List<Locale> supportedLocales = AppLocalizations.supportedLocales;

  @override
  LocalizationsDelegate localizationsDelegate = AppLocalizations.delegate;

  @override
  NotesAppSpecificOptions buildOptions(final AppStorage storage) => NotesAppSpecificOptions(storage);

  @override
  NotesBloc buildBloc(final NextcloudClient client) => NotesBloc(
        options,
        requestManager,
        client,
      );

  @override
  Widget get page => const NotesMainPage();
}
