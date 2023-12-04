import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neon/models.dart';
import 'package:neon_notifications/l10n/localizations.dart';
import 'package:neon_notifications/src/blocs/notifications.dart';
import 'package:neon_notifications/src/options.dart';
import 'package:neon_notifications/src/pages/main.dart';
import 'package:neon_notifications/src/routes.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:rxdart/rxdart.dart';

class NotificationsApp extends AppImplementation<NotificationsBloc, NotificationsAppSpecificOptions>
    implements
        // ignore: avoid_implementing_value_types
        NotificationsAppInterface<NotificationsBloc, NotificationsAppSpecificOptions> {
  NotificationsApp();

  @override
  final String id = AppIDs.notifications;

  @override
  final LocalizationsDelegate<NotificationsLocalizations> localizationsDelegate = NotificationsLocalizations.delegate;

  @override
  final List<Locale> supportedLocales = NotificationsLocalizations.supportedLocales;

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
