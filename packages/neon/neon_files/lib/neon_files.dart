library neon_files;

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:file_icons/file_icons.dart';
import 'package:file_picker/file_picker.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intersperse/intersperse.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:neon/neon.dart';
import 'package:neon_files/l10n/localizations.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as p;
import 'package:provider/provider.dart';
import 'package:queue/queue.dart';
import 'package:rxdart/rxdart.dart';
import 'package:settings/settings.dart';
import 'package:sort_box/sort_box.dart';

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
part 'utils/download_task.dart';
part 'utils/upload_task.dart';
part 'widgets/browser_view.dart';
part 'widgets/file_preview.dart';

class FilesApp extends AppImplementation<FilesBloc, FilesAppSpecificOptions> {
  FilesApp(super.sharedPreferences, super.requestManager, super.platform);

  @override
  String id = 'files';

  @override
  LocalizationsDelegate localizationsDelegate = AppLocalizations.delegate;

  @override
  List<Locale> supportedLocales = AppLocalizations.supportedLocales;

  @override
  FilesAppSpecificOptions buildOptions(final AppStorage storage) => FilesAppSpecificOptions(storage);

  @override
  FilesBloc buildBloc(final NextcloudClient client) => FilesBloc(
        options,
        client,
        requestManager,
        platform,
      );

  @override
  Widget buildPage(final BuildContext context, final AppsBloc appsBloc) => FilesMainPage(
        bloc: appsBloc.getAppBloc(this),
      );

  @override
  BehaviorSubject<int>? getUnreadCounter(final AppsBloc appsBloc) => null;
}
