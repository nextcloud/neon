import 'package:mocktail/mocktail.dart';
import 'package:neon_notifications/src/blocs/notifications.dart';
import 'package:nextcloud/notifications.dart' as notifications;

class MockNotificationsBloc extends Mock implements NotificationsBloc {}

class MockNotification extends Mock implements notifications.Notification {}

class MockAction extends Mock implements notifications.NotificationAction {}
