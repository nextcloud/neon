library neon_files;

import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:file_icons/file_icons.dart';
import 'package:file_picker/file_picker.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intersperse/intersperse.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:neon/blocs.dart';
import 'package:neon/models.dart';
import 'package:neon/nextcloud.dart';
import 'package:neon/platform.dart';
import 'package:neon/settings.dart';
import 'package:neon/sort_box.dart';
import 'package:neon/utils.dart';
import 'package:neon/widgets.dart';
import 'package:neon_files/l10n/localizations.dart';
import 'package:neon_files/routes.dart';
import 'package:neon_files/widgets/file_list_tile.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as p;
import 'package:provider/provider.dart';
import 'package:queue/queue.dart';
import 'package:rxdart/rxdart.dart';

part 'blocs/browser.dart';
part 'blocs/files.dart';
part 'dialogs/choose_create.dart';
part 'dialogs/choose_folder.dart';
part 'dialogs/create_folder.dart';
part 'models/file_details.dart';
part 'options.dart';
part 'pages/details.dart';
part 'pages/main.dart';
part 'sort/files.dart';
part 'utils/task.dart';
part 'widgets/browser_view.dart';
part 'widgets/file_preview.dart';

class FilesApp extends AppImplementation<FilesBloc, FilesAppSpecificOptions> {
  FilesApp();

  @override
  String id = AppIDs.files;

  @override
  LocalizationsDelegate localizationsDelegate = AppLocalizations.delegate;

  @override
  List<Locale> supportedLocales = AppLocalizations.supportedLocales;

  @override
  late final FilesAppSpecificOptions options = FilesAppSpecificOptions(storage);

  @override
  FilesBloc buildBloc(final Account account) => FilesBloc(
        options,
        account,
      );

  @override
  Widget get page => const FilesMainPage();

  @override
  RouteBase get route => $filesAppRoute;
}
