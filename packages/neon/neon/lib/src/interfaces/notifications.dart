part of '../../neon.dart';

abstract class NotificationsAppInterface
    extends AppImplementation<NotificationsBlocInterface, NotificationsOptionsInterface> {
  NotificationsAppInterface(
    super.sharedPreferences,
    super.requestManager,
    super.platform,
  );
}

abstract class NotificationsBlocInterface extends InteractiveBloc {
  NotificationsBlocInterface(this.options);

  final NotificationsOptionsInterface options;
  void deleteNotification(final int id);
}

abstract class NotificationsOptionsInterface extends NextcloudAppSpecificOptions {
  NotificationsOptionsInterface(super.storage);
}
