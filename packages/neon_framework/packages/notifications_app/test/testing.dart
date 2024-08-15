import 'package:mocktail/mocktail.dart';
import 'package:nextcloud/notifications.dart' as notifications;
import 'package:notifications_app/src/blocs/notifications.dart';

class MockNotificationsBloc extends Mock implements NotificationsBloc {}

class MockNotification extends Mock implements notifications.Notification {}

class MockAction extends Mock implements notifications.NotificationAction {}
