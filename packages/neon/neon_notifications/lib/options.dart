part of 'neon_notifications.dart';

class NotificationsClientSpecificOptions extends NextcloudClientOptions implements NotificationsOptionsInterface {
  NotificationsClientSpecificOptions(super.storage) {
    super.categories = [];
    super.options = [];
  }
}
