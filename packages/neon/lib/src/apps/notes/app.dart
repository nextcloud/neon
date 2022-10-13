library notes;

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/apps/notes/blocs/notes.dart';
import 'package:neon/src/blocs/apps.dart';
import 'package:neon/src/neon.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:settings/settings.dart';
import 'package:sort_box/sort_box.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wakelock/wakelock.dart';

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
part 'widgets/notes_view.dart';

class NotesApp extends AppImplementation<NotesBloc, NotesAppSpecificOptions> {
  NotesApp(super.sharedPreferences, super.requestManager, super.platform);

  @override
  String id = 'notes';

  @override
  String nameFromLocalization(final AppLocalizations localizations) => localizations.notesName;

  @override
  NotesAppSpecificOptions buildOptions(final Storage storage) => NotesAppSpecificOptions(storage);

  @override
  NotesBloc buildBloc(final NextcloudClient client) => NotesBloc(
        options,
        requestManager,
        client,
      );

  @override
  Widget buildPage(final BuildContext context, final AppsBloc appsBloc) => NotesMainPage(
        bloc: appsBloc.getAppBloc(this),
      );

  @override
  BehaviorSubject<int>? getUnreadCounter(final AppsBloc appsBloc) => null;
}
