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
    this._requestManager,
    this._client,
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
  final RequestManager _requestManager;
  final NextcloudClient _client;
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
    await _requestManager.wrapNextcloud<List<NotificationsNotification>, NotificationsListNotifications>(
      _client.id,
      'notifications-notifications',
      notifications,
      () async => _client.notifications.listNotifications(),
      (final response) => response.ocs.data.toList(),
    );
  }

  @override
  void deleteAllNotifications() {
    wrapAction(() async => _client.notifications.deleteAllNotifications());
  }

  @override
  void deleteNotification(final int id) {
    wrapAction(() async => _client.notifications.deleteNotification(id: id));
  }
}
