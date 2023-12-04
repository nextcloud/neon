import 'package:neon/models.dart';
import 'package:neon/settings.dart';

class NotificationsAppSpecificOptions extends NextcloudAppOptions implements NotificationsOptionsInterface {
  NotificationsAppSpecificOptions(super.storage) {
    super.categories = [];
    super.options = [];
  }
}
