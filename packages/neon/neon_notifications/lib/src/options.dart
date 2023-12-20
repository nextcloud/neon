import 'package:neon_framework/models.dart';
import 'package:neon_framework/settings.dart';

class NotificationsOptions extends AppImplementationOptions implements NotificationsOptionsInterface {
  NotificationsOptions(super.storage) {
    super.categories = [];
    super.options = [];
  }
}
