import 'package:neon/src/bloc/bloc.dart';
import 'package:neon/src/models/app_implementation.dart';
import 'package:neon/src/settings/models/nextcloud_app_options.dart';

abstract interface class NotificationsAppInterface<T extends NotificationsBlocInterface,
    R extends NotificationsOptionsInterface> extends AppImplementation<T, R> {
  NotificationsAppInterface(super.sharedPreferences);
}

abstract interface class NotificationsBlocInterface extends InteractiveBloc {
  NotificationsBlocInterface(this.options);

  final NotificationsOptionsInterface options;
  void deleteNotification(final int id);
}

abstract interface class NotificationsOptionsInterface extends NextcloudAppOptions {
  NotificationsOptionsInterface(super.storage);
}
