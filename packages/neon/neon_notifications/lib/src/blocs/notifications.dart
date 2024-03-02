import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:neon_framework/blocs.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_notifications/src/options.dart';
import 'package:nextcloud/notifications.dart' as $notifications;
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

  BehaviorSubject<Result<BuiltList<$notifications.Notification>>> get notifications;

  BehaviorSubject<int> get unreadCounter;
}

class _NotificationsBloc extends InteractiveBloc implements NotificationsBlocInterface, NotificationsBloc {
  _NotificationsBloc(
    this.options,
    this.account,
  ) {
    notifications.listen((result) {
      if (result.hasData) {
        unreadCounter.add(result.requireData.length);
      }
    });

    unawaited(refresh());
    timer = TimerBloc().registerTimer(const Duration(seconds: 30), refresh);
  }

  @override
  final log = Logger('NotificationsBloc');

  final NotificationsOptions options;
  final Account account;
  late final NeonTimer timer;

  @override
  void dispose() {
    timer.cancel();
    unawaited(notifications.close());
    unawaited(unreadCounter.close());
    super.dispose();
  }

  @override
  final notifications = BehaviorSubject();

  @override
  final unreadCounter = BehaviorSubject();

  @override
  Future<void> refresh() async {
    await RequestManager.instance.wrapNextcloud(
      account: account,
      cacheKey: 'notifications-notifications',
      subject: notifications,
      rawResponse: account.client.notifications.endpoint.listNotificationsRaw(),
      unwrap: (response) => response.body.ocs.data,
    );
  }

  @override
  Future<void> deleteAllNotifications() async {
    await wrapAction(() async => account.client.notifications.endpoint.deleteAllNotifications());
  }

  @override
  Future<void> deleteNotification(int id) async {
    await wrapAction(() async => account.client.notifications.endpoint.deleteNotification(id: id));
  }
}
