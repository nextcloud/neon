library notifications;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:neon/blocs.dart';
import 'package:neon/models.dart';
import 'package:neon/nextcloud.dart';
import 'package:neon/settings.dart';
import 'package:neon/theme.dart';
import 'package:neon/utils.dart';
import 'package:neon/widgets.dart';
import 'package:neon_notifications/l10n/localizations.dart';
import 'package:neon_notifications/routes.dart';
import 'package:rxdart/rxdart.dart';

part 'blocs/notifications.dart';
part 'options.dart';
part 'pages/main.dart';

class NotificationsApp extends AppImplementation<NotificationsBloc, NotificationsAppSpecificOptions>
    implements NotificationsAppInterface<NotificationsBloc, NotificationsAppSpecificOptions> {
  NotificationsApp();

  @override
  final String id = AppIDs.notifications;

  @override
  final LocalizationsDelegate<AppLocalizations> localizationsDelegate = AppLocalizations.delegate;

  @override
  final List<Locale> supportedLocales = AppLocalizations.supportedLocales;

  @override
  late final NotificationsAppSpecificOptions options = NotificationsAppSpecificOptions(storage);

  @override
  NotificationsBloc buildBloc(final Account account) => NotificationsBloc(
        options,
        account,
      );

  @override
  final Widget page = const NotificationsMainPage();

  @override
  final RouteBase route = $notificationsAppRoute;

  @override
  BehaviorSubject<int> getUnreadCounter(final NotificationsBloc bloc) => bloc.unreadCounter;
}
