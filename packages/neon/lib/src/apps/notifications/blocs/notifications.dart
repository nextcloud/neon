part of '../app.dart';

abstract class NotificationsBlocEvents {
  void deleteNotification(final int id);

  void deleteAllNotifications();
}

abstract class NotificationsBlocStates {
  BehaviorSubject<Result<List<NextcloudNotificationsNotification>>> get notifications;

  BehaviorSubject<int> get unreadCounter;
}

class NotificationsBloc extends InteractiveBloc implements NotificationsBlocEvents, NotificationsBlocStates {
  NotificationsBloc(
    this.options,
    this._requestManager,
    this._client,
  ) {
    notifications.listen((final result) {
      if (result.data != null) {
        unreadCounter.add(result.data!.length);
      }
    });

    unawaited(refresh());
  }

  final NotificationsAppSpecificOptions options;
  final RequestManager _requestManager;
  final NextcloudClient _client;

  @override
  void dispose() {
    unawaited(notifications.close());
    unawaited(unreadCounter.close());
    super.dispose();
  }

  @override
  BehaviorSubject<Result<List<NextcloudNotificationsNotification>>> notifications =
      BehaviorSubject<Result<List<NextcloudNotificationsNotification>>>();

  @override
  BehaviorSubject<int> unreadCounter = BehaviorSubject<int>();

  @override
  Future refresh() async {
    await _requestManager
        .wrapNextcloud<List<NextcloudNotificationsNotification>, NextcloudNotificationsListNotifications>(
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
