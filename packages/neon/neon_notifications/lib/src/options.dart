import 'package:neon_framework/models.dart';
import 'package:neon_framework/settings.dart';

class NotificationsAppSpecificOptions extends NextcloudAppOptions implements NotificationsOptionsInterface {
  NotificationsAppSpecificOptions(super.storage) {
    super.categories = [];
    super.options = [];
  }
}
