library notifications;

import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:neon/l10n/localizations.dart';
import 'package:neon/src/apps/notifications/blocs/notifications.dart';
import 'package:neon/src/neon.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'options.dart';
part 'pages/main.dart';

class NotificationsApp extends AppImplementation<NotificationsBloc, NotificationsAppSpecificOptions> {
  NotificationsApp(
    final SharedPreferences sharedPreferences,
    final RequestManager requestManager,
  ) : super(
          'notifications',
          (final localizations) => localizations.notificationsName,
          sharedPreferences,
          NotificationsAppSpecificOptions.new,
          (final options, final client) => NotificationsBloc(
            options,
            requestManager,
            client,
          ),
          (final context, final bloc) => NotificationsMainPage(
            bloc: bloc,
          ),
        );
}
