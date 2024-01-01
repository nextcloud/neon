import 'dart:async';

import 'package:meta/meta.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_notifications/src/options.dart';
import 'package:nextcloud/notifications.dart' as notifications;
import 'package:rxdart/rxdart.dart';

sealed class NotificationsBloc implements NotificationsBlocInterface, InteractiveBloc {
  @internal
  factory NotificationsBloc(
    NotificationsOptions options,
    Account account,
  ) =>
      _NotificationsBloc(options, account);

  @override
  void deleteNotification(int id);

  void deleteAllNotifications();

  BehaviorSubject<Result<List<notifications.Notification>>> get notificationsList;

  BehaviorSubject<int> get unreadCounter;
}

class _NotificationsBloc extends InteractiveBloc implements NotificationsBlocInterface, NotificationsBloc {
  _NotificationsBloc(
    this.options,
    this.account,
  ) {
    notificationsList.listen((result) {
      if (result.hasData) {
        unreadCounter.add(result.requireData.length);
      }
    });

    unawaited(refresh());
    timer = TimerBloc().registerTimer(const Duration(seconds: 30), refresh);
  }

  final NotificationsOptions options;
  final Account account;
  late final NeonTimer timer;

  @override
  void dispose() {
    timer.cancel();
    unawaited(notificationsList.close());
    unawaited(unreadCounter.close());
    super.dispose();
  }

  @override
  BehaviorSubject<Result<List<notifications.Notification>>> notificationsList =
      BehaviorSubject<Result<List<notifications.Notification>>>();

  @override
  BehaviorSubject<int> unreadCounter = BehaviorSubject<int>();

  @override
  Future<void> refresh() async {
    await RequestManager.instance.wrapNextcloud<List<notifications.Notification>,
        notifications.EndpointListNotificationsResponseApplicationJson, void>(
      account.id,
      'notifications-notifications',
      notificationsList,
      account.client.notifications.endpoint.listNotificationsRaw(),
      (response) => response.body.ocs.data.toList(),
    );
  }

  @override
  void deleteAllNotifications() {
    wrapAction(() async => account.client.notifications.endpoint.deleteAllNotifications());
  }

  @override
  void deleteNotification(int id) {
    wrapAction(() async => account.client.notifications.endpoint.deleteNotification(id: id));
  }
}
