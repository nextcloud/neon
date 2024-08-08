import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:neon_notifications/l10n/localizations.dart';
import 'package:neon_notifications/src/blocs/notifications.dart';
import 'package:neon_notifications/src/widgets/notification.dart';

class NotificationsMainPage extends StatefulWidget {
  const NotificationsMainPage({
    super.key,
  });

  @override
  State<NotificationsMainPage> createState() => _NotificationsMainPageState();
}

class _NotificationsMainPageState extends State<NotificationsMainPage> {
  late NotificationsBloc bloc;
  late final StreamSubscription<Object> errorsSubscription;

  @override
  void initState() {
    super.initState();

    bloc = NeonProvider.of<NotificationsBlocInterface>(context) as NotificationsBloc;

    errorsSubscription = bloc.errors.listen((error) {
      NeonError.showSnackbar(context, error);
    });
  }

  @override
  void dispose() {
    unawaited(errorsSubscription.cancel());

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: StreamBuilder(
        stream: bloc.unreadCounter,
        builder: (context, snapshot) {
          final unreadCount = snapshot.data ?? 0;
          return FloatingActionButton(
            onPressed: unreadCount > 0 ? bloc.deleteAllNotifications : null,
            tooltip: NotificationsLocalizations.of(context).notificationsDismissAll,
            child: const Icon(MdiIcons.checkAll),
          );
        },
      ),
      body: ResultBuilder.behaviorSubject(
        subject: bloc.notifications,
        builder: (context, notifications) => NeonListView(
          scrollKey: 'notifications-notifications',
          isLoading: notifications.isLoading,
          error: notifications.error,
          onRefresh: bloc.refresh,
          itemCount: notifications.data?.length ?? 0,
          itemBuilder: (context, index) {
            final notification = notifications.data![index];

            return NotificationsNotification(
              notification: notification,
              onDelete: () {
                bloc.deleteNotification(notification.notificationId);
              },
            );
          },
        ),
      ),
    );
  }
}
