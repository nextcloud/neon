library notifications;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:neon/neon.dart';
import 'package:neon_notifications/l10n/localizations.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

part 'blocs/notifications.dart';
part 'options.dart';
part 'pages/main.dart';

class NotificationsApp extends NotificationsAppInterface {
  NotificationsApp(super.sharedPreferences, super.requestManager, super.platform);

  @override
  String id = 'notifications';

  @override
  LocalizationsDelegate localizationsDelegate = AppLocalizations.delegate;

  @override
  List<Locale> supportedLocales = AppLocalizations.supportedLocales;

  @override
  NotificationsAppSpecificOptions buildOptions(final AppStorage storage) => NotificationsAppSpecificOptions(storage);

  @override
  NotificationsBloc buildBloc(final NextcloudClient client) => NotificationsBloc(
        options,
        requestManager,
        client,
      );

  @override
  Widget get page => const NotificationsMainPage();

  @override
  BehaviorSubject<int> getUnreadCounter(final AppsBloc appsBloc) =>
      appsBloc.getAppBloc<NotificationsBloc>(this).unreadCounter;
}
