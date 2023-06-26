library notifications;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:neon/blocs.dart';
import 'package:neon/models.dart';
import 'package:neon/settings.dart';
import 'package:neon/utils.dart';
import 'package:neon/widgets.dart';
import 'package:neon_notifications/l10n/localizations.dart';
import 'package:neon_notifications/routes.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

part 'blocs/notifications.dart';
part 'options.dart';
part 'pages/main.dart';

class NotificationsApp extends AppImplementation<NotificationsBloc, NotificationsAppSpecificOptions>
    implements NotificationsAppInterface<NotificationsBloc, NotificationsAppSpecificOptions> {
  NotificationsApp(super.sharedPreferences, super.requestManager, super.platform);

  @override
  String id = appId;

  static const String appId = 'notifications';

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
  RouteBase get route => $notificationsAppRoute;

  @override
  BehaviorSubject<int> getUnreadCounter(final NotificationsBloc bloc) => bloc.unreadCounter;
}
