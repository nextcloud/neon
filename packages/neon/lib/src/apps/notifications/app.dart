library notifications;

import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/apps/notifications/blocs/notifications.dart';
import 'package:neon/src/blocs/apps.dart';
import 'package:neon/src/neon.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

part 'options.dart';
part 'pages/main.dart';

class NotificationsApp extends AppImplementation<NotificationsBloc, NotificationsAppSpecificOptions> {
  NotificationsApp(super.sharedPreferences, super.requestManager, super.platform);

  @override
  String id = 'notifications';

  @override
  String nameFromLocalization(AppLocalizations localizations) => localizations.notificationsName;

  @override
  NotificationsAppSpecificOptions buildOptions(Storage storage) => NotificationsAppSpecificOptions(storage);

  @override
  NotificationsBloc buildBloc(NextcloudClient client) => NotificationsBloc(
        options,
        requestManager,
        client,
      );

  @override
  Widget buildPage(BuildContext context, AppsBloc appsBloc) => NotificationsMainPage(
        bloc: appsBloc.getAppBloc(this),
      );

  @override
  BehaviorSubject<int>? getUnreadCounter(AppsBloc appsBloc) =>
      appsBloc.getAppBloc<NotificationsBloc>(this).unreadCounter;
}
