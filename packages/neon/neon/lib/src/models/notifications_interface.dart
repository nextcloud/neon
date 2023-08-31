import 'package:meta/meta.dart';
import 'package:neon/src/bloc/bloc.dart';
import 'package:neon/src/models/app_implementation.dart';
import 'package:neon/src/settings/models/options_collection.dart';

abstract interface class NotificationsAppInterface<T extends NotificationsBlocInterface,
    R extends NotificationsOptionsInterface> extends AppImplementation<T, R> {
  NotificationsAppInterface();

  @override
  @mustBeOverridden
  R get options => throw UnimplementedError();
}

abstract interface class NotificationsBlocInterface extends InteractiveBloc {
  NotificationsBlocInterface(this.options);

  final NotificationsOptionsInterface options;
  void deleteNotification(final int id);
}

abstract interface class NotificationsOptionsInterface extends NextcloudAppOptions {
  NotificationsOptionsInterface(super.storage);
}
