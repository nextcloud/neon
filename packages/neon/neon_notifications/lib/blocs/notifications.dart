part of '../neon_notifications.dart';

abstract interface class NotificationsBlocEvents {
  void deleteNotification(final int id);

  void deleteAllNotifications();
}

abstract interface class NotificationsBlocStates {
  BehaviorSubject<Result<List<NotificationsNotification>>> get notifications;

  BehaviorSubject<int> get unreadCounter;
}

class NotificationsBloc extends InteractiveBloc
    implements NotificationsBlocInterface, NotificationsBlocEvents, NotificationsBlocStates {
  NotificationsBloc(
    this.options,
    this._account,
  ) {
    notifications.listen((final result) {
      if (result.hasData) {
        unreadCounter.add(result.requireData.length);
      }
    });

    unawaited(refresh());
    _timer = TimerBloc().registerTimer(const Duration(seconds: 30), refresh);
  }

  @override
  final NotificationsAppSpecificOptions options;
  final Account _account;
  late final NeonTimer _timer;

  @override
  void dispose() {
    _timer.cancel();
    unawaited(notifications.close());
    unawaited(unreadCounter.close());
    super.dispose();
  }

  @override
  BehaviorSubject<Result<List<NotificationsNotification>>> notifications =
      BehaviorSubject<Result<List<NotificationsNotification>>>();

  @override
  BehaviorSubject<int> unreadCounter = BehaviorSubject<int>();

  @override
  Future refresh() async {
    await RequestManager.instance
        .wrapNextcloud<List<NotificationsNotification>, NotificationsEndpointListNotificationsResponseApplicationJson>(
      _account.id,
      'notifications-notifications',
      notifications,
      () async {
        final response = await _account.client.notifications.endpoint.listNotifications();
        return response.data;
      },
      (final response) => response.ocs.data.toList(),
    );
  }

  @override
  void deleteAllNotifications() {
    wrapAction(() async => _account.client.notifications.endpoint.deleteAllNotifications());
  }

  @override
  void deleteNotification(final int id) {
    wrapAction(() async => _account.client.notifications.endpoint.deleteNotification(id: id));
  }
}
