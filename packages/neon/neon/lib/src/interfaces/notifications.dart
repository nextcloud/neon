part of '../../neon.dart';

abstract interface class NotificationsAppInterface<T extends NotificationsBlocInterface,
    R extends NotificationsOptionsInterface> extends AppImplementation<T, R> {
  NotificationsAppInterface(
    super.sharedPreferences,
    super.requestManager,
    super.platform,
  );
}

abstract interface class NotificationsBlocInterface extends InteractiveBloc {
  NotificationsBlocInterface(this.options);

  final NotificationsOptionsInterface options;
  void deleteNotification(final int id);
}

abstract interface class NotificationsOptionsInterface extends NextcloudAppSpecificOptions {
  NotificationsOptionsInterface(super.storage);
}
