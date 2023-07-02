part of 'neon_notifications.dart';

class NotificationsAppSpecificOptions extends NextcloudAppOptions implements NotificationsOptionsInterface {
  NotificationsAppSpecificOptions(super.storage) {
    super.categories = [];
    super.options = [];
  }
}
