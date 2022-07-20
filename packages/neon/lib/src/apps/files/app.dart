library files;

import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:file_icons/file_icons.dart';
import 'package:file_picker/file_picker.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rx_bloc/flutter_rx_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intersperse/intersperse.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/apps/files/blocs/browser.dart';
import 'package:neon/src/apps/files/blocs/files.dart';
import 'package:neon/src/apps/files/blocs/sync.dart';
import 'package:neon/src/apps/files/models/sync_mapping.dart';
import 'package:neon/src/blocs/accounts.dart';
import 'package:neon/src/blocs/apps.dart';
import 'package:neon/src/models/account.dart';
import 'package:neon/src/neon.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:path/path.dart' as p;
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:settings/settings.dart';

part 'dialogs/choose_create.dart';
part 'dialogs/choose_folder.dart';
part 'dialogs/create_folder.dart';
part 'dialogs/sync_conflict.dart';
part 'models/file_details.dart';
part 'options.dart';
part 'pages/details.dart';
part 'pages/main.dart';
part 'utils/download_task.dart';
part 'utils/upload_task.dart';
part 'widgets/browser_view.dart';
part 'widgets/file_preview.dart';
part 'widgets/file_tile.dart';
part 'widgets/sync_status_icon.dart';

class FilesApp extends AppImplementation<FilesBloc, FilesAppSpecificOptions> {
  FilesApp(super.sharedPreferences, super.requestManager, super.platform);

  @override
  String id = 'files';

  @override
  String nameFromLocalization(final AppLocalizations localizations) => localizations.filesName;

  @override
  FilesAppSpecificOptions buildOptions(final Storage storage) => FilesAppSpecificOptions(storage);

  @override
  FilesBloc buildBloc(final NextcloudClient client) => FilesBloc(
        options,
        requestManager,
        client,
        platform,
      );

  @override
  Widget buildPage(final BuildContext context, final AppsBloc appsBloc) => FilesMainPage(
        bloc: appsBloc.getAppBloc(this),
      );

  @override
  BehaviorSubject<int>? getUnreadCounter(final AppsBloc appsBloc) => null;
}
